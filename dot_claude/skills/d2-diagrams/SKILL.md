---
name: d2-diagrams
description: Draw and render architecture/topology diagrams with D2 (d2lang). Use when asked for a diagram, to convert a Mermaid diagram to D2, or to render .d2 sources to SVG/PNG for a doc or PR.
---

# D2 diagrams

D2 (https://d2lang.com) is a text-to-diagram language with a CLI. Prefer it
over Mermaid when boxes need several lines of readable text or when the diagram
has nested groups (layers, environments, accounts): D2 containers and markdown
labels stay legible where Mermaid `<br/>` soup does not.

## Workflow

1. Write the source as `<name>.d2` next to where the rendered file will live
   (e.g. `docs/<topic>/<name>.d2`). Start the file with a comment carrying the
   exact render command.
2. Render: `d2 --layout elk <name>.d2 <name>.svg`. The CLI validates syntax and
   prints the offending line on error — always render, never eyeball. Never
   post-process the SVG; if a viewer cannot show it, change the source or
   export PNG (see "Italics and bold").
3. **Look at it.** Export a PNG (`d2 --layout elk <name>.d2 /tmp/<name>.png`;
   uses the local Chrome) and open it with the Read tool. Check for clipped
   text, overlapping edge labels, arrows through titles, and long detours.
   Fix, re-render, look again.
4. Embed the SVG in the markdown: `![<title>](docs/<topic>/<name>.svg)`.
   GitHub does not render D2 source blocks; it renders the SVG as an image.
   Commit both the `.d2` and the `.svg`.

Install: `brew install d2` (it is in the chezmoi-managed Brewfile). Syntax
below is verified on d2 0.9 with `--layout elk`.

## The box shape that works

A bare markdown label (`x: |md … |`) renders as *borderless text*: edges end
on floating words and the box is invisible. Declare the shape explicitly and
put the markdown in `label`:

```d2
accE: {
  shape: rectangle
  width: 480                        # fixed width: see clipping rule below
  label: |md
    *Storage account*\
    **dqdmpeventstorage**

    - Container: ingress
    - Tier: hot 70 days, then cold
    - Auth: managed identity, no key
  |
}
```

Header = the entity *type* in italics on line one, the *name* in bold on line
two, joined by a backslash hard line break (a bare newline is a soft break and
collapses into a space). Then a blank line and one bullet per fact. Bullets,
not plain lines, for the same soft-break reason.

## Syntax that matters

```d2
# comment
direction: down                        # top-level layout: up|down|left|right

outside: Outside Databricks {          # container: id: "Label" { children }
  label.near: outside-top-left         # title above the box, out of the arrows' way
  direction: right                     # per-container direction
  svc: { shape: rectangle; label: |md
    *Service*\
    **dmp-connectors-service**

    - Environment: prod
  | }
}

az: "Layer 1 — Azure Storage" {        # quote labels containing : — ( /
  label.near: outside-top-left
  accE: { shape: rectangle; width: 480; label: |md
    *Storage account*\
    **dqdmpeventstorage**

    - Container: ingress
  | }
}

shared: "Owned by prod" {              # dashed container = foreign / not owned here
  label.near: outside-top-left
  style.stroke-dash: 5
  volE: { shape: rectangle; label: |md
    *Volume*\
    **prod.dmp_pipeline.events**

    - Grant: read-only
  | }
}

outside.svc <-> az.accE: writes, reads # dot paths reach into containers; <-> is bidirectional
az.accE -> shared.volE: published as volume {
  style.stroke-dash: 4                 # dashed edge: "same bytes, different name"
}
shared.volE <- outside.svc: writes results   # see back-edges below
```

## Nesting one entity inside another

A storage account that holds a container, a catalog that holds a schema: make
the outer entity a container with an **empty plain label** and put its header
inside as a borderless markdown text block, then the inner entity as a bordered
rectangle. Edges attach to the inner rectangle by dot path.

```d2
accE: "" {
  hdr: |md
    *Storage account*\
    **dqdmpeventstorage**

    - Auth: managed identity, no key
  |
  container: { shape: rectangle; width: 440; label: |md
    *Container*\
    **ingress**

    - Tier: hot 70 days, then cold
  | }
}
outside.ehc -> az.accE.container: writes AVRO
```

Do not give the outer container a markdown label: a container whose label is
`|md … |` renders with **no border and no label at all** — its children float
in the parent as if the container did not exist. Only plain-string labels work
on containers.

Rules learned the hard way:

- **Italics and bold depend on embedded fonts.** D2 marks bold/italic text
  with CSS classes that select fonts embedded as base64 in the SVG. Browsers
  and WebKit viewers (Safari, Quick Look) load them; some Markdown viewer apps
  do not and show plain text. Do not patch the SVG. If the target viewer is one
  of those, export PNG (`d2 --layout elk --scale 2 x.d2 x.png`) or drop the
  styling and use `sql_table` shapes, whose header/rows need no bold or italic.
- **Markdown labels cannot be centred.** D2 left-aligns every markdown line.
  If centred headers matter, use `shape: sql_table` (header bar is centred by
  design) or a plain shape label, which is centred; do not post-process.
- **Container direction is ignored** under ELK — always, not only when the
  container's children have edges to the outside; a header text block and its
  inner rectangle land side by side, and a `direction: down` lane inside a
  `direction: right` root still flows right. Pin the order with an invisible edge inside the container:
  `hdr -> inner: { style.opacity: 0 }`. Do **not** use `grid-columns` /
  `grid-rows` for this: grid containers with outside edges break ELK's layered
  layout for the whole diagram.
- **Clipping.** A wrapped line inside a markdown label makes the box too short
  and the *last* bullet silently disappears. Either give the shape a `width`
  large enough that no line wraps, or keep every bullet short. Always verify
  in the PNG that the last bullet is present.
- **Container titles** default to inside the box, where vertical edges run
  straight through the text. `label.near: outside-top-left` fixes it.
- **Flow charts / swim lanes.** For "what to do when" charts, use root
  `direction: right`, one dashed container per phase, and **no edges between
  containers**: unconnected containers stack vertically in declaration order,
  so each lane reads left to right and the page stays wide-and-short instead
  of a 7 000 px column. Put inter-lane sequencing in the lane title ("once
  phase 1 has settled"). A legend is a container with `grid-rows: 1` and one
  class-coloured leaf per kind — a grid is safe there because nothing connects
  to it.
- **Back-edges.** With `direction: down`, an edge from a lower layer back up
  (`job -> table`) is routed as a long detour around the diagram. Declare it
  from the upper side with a reversed arrow, `table <- job: writes results`;
  same meaning, drawn straight.
- **Overlapping edge labels.** Two edges into the same node from adjacent
  sources get labels on top of each other. Spread the sources by changing the
  declaration order of siblings in the container (ELK keeps that order), or
  put an unrelated node between them.
- A markdown label is `|md … |`. If the text contains `|`, open with `||md`
  and close with `||`.
- Edge label plus style: `a -> b: label { style.stroke-dash: 4 }`.
- Styles: `style.stroke`, `style.fill`, `style.stroke-dash`, `style.bold`,
  `style.font-size`, `style.stroke-width`; on a shape, a container or an edge.
- Reusable styling: `classes: { foreign: { style.stroke-dash: 5 } }` then
  `shared.class: foreign`.
- Duplicate keys are allowed and the last one wins; keep them out anyway.
- `--layout elk` handles nested containers far better than the default `dagre`.
- Useful flags: `--pad 20`, `--theme <id>` (`d2 themes` lists them),
  `--sketch` for a hand-drawn look, `--watch` for live preview in a browser.

## Designing a readable diagram

- Model layers or environments as containers and give each a one-line label
  saying what the layer *is* ("Layer 2 — Unity Catalog: permissions, no bytes").
- One box per real object; italic type line, bold name line, then bullets with
  the facts a reader needs (path, tier, auth, grant). No prose in boxes.
- Edge labels are verbs: "writes AVRO", "reads imports, writes staging".
- Distinguish kinds of edges by style, and say so in the caption: solid moves
  data, dashed maps a name onto the same bytes.
- Mark things that belong elsewhere with a dashed container labelled
  "Owned by X, not by Y".
- One diagram per environment beats one diagram with three lanes; repeat the
  same layer structure in each so they read the same way.
- Convert Mermaid by mapping `subgraph` → container, `<br/>` label lines →
  markdown bullets, `-.->` → `style.stroke-dash`, `classDef`/`class` →
  `classes`.
