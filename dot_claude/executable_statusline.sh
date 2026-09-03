#!/usr/bin/env bash
# Claude Code status line: <model> | <effort meter> | <dir> | <branch>
#
# Reads the status JSON payload on stdin. Fields available (v2.1.x): model,
# workspace, version, output_style, cost, context_window, exceeds_200k_tokens,
# prompt_cache, fast_mode, effort, thinking, rate_limits, vim, agent, pr,
# worktree, session_name. effort is present only for models that take a level.
#
# Fable gets an animated gradient; the sweep advances with wall-clock time, so
# it only animates while statusLine.refreshInterval keeps re-running this.

set -uo pipefail

input=$(cat)
[ -n "${CC_STATUSLINE_DUMP:-}" ] && printf '%s' "$input" > "$CC_STATUSLINE_DUMP"

IFS=$'\t' read -r model dir effort < <(
  jq -r '[.model.display_name, .workspace.current_dir, (.effort.level // "")] | @tsv' <<<"$input"
)

R=$'\033[0m'; DIM=$'\033[2m'

# 30-stop saturated loop through the xterm cube, darkest blues swapped for
# violets so every stop stays legible on light and dark backgrounds.
PAL=(196 202 208 214 220 226 190 154 118 82 46 47 48 49 50 51 \
     45 39 69 105 141 177 213 207 206 205 204 199 198 197)

render_model() {
  local name=$1
  if [[ $name != *[Ff]able* ]]; then
    printf '\033[36m%s\033[0m' "$name"
    return
  fi
  local now len glint out="" i ch idx
  printf -v now '%(%s)T' -1
  len=${#name}
  glint=$(( now % (len + 8) ))
  for ((i = 0; i < len; i++)); do
    ch=${name:i:1}
    if [[ $ch == " " ]]; then out+=" "; continue; fi
    if (( i == glint )); then
      out+=$'\033[1;38;5;231m'"$ch"
    else
      idx=$(( (i * 2 + now * 3) % ${#PAL[@]} ))
      out+=$'\033[1;38;5;'"${PAL[idx]}m$ch"
    fi
  done
  printf '%s%s' "$out" "$R"
}

render_effort() {
  local level=$1 n color
  case $level in
    low)    n=1; color=$'\033[38;5;245m' ;;
    medium) n=2; color=$'\033[38;5;39m'  ;;
    high)   n=3; color=$'\033[38;5;220m' ;;
    xhigh)  n=4; color=$'\033[38;5;213m' ;;
    max)    n=5; color=$'\033[1;38;5;203m' ;;
    *)      return 1 ;;
  esac
  local filled="" empty="" i
  for ((i = 1; i <= 5; i++)); do
    if (( i <= n )); then filled+="▰"; else empty+="▱"; fi
  done
  printf '%s%s%s%s%s %s%s%s' "$color" "$filled" "$R" "$DIM" "$empty" "$color" "$level" "$R"
}

line="$(render_model "$model")"

if e=$(render_effort "$effort"); then
  line+=" ${DIM}|${R} $e"
fi

line+=" ${DIM}|${R} "$'\033[34m'"$(basename "$dir")$R"

branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
[ -n "$branch" ] && line+=" ${DIM}|${R} "$'\033[33m'"$branch$R"

printf '%s' "$line"
