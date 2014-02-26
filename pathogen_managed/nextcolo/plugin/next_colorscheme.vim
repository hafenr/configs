let s:scriptfile=expand("<sfile>")

execute "pyfile ".fnameescape(fnamemodify(s:scriptfile, ":h")."/next_colorscheme.py")

command! -nargs=0 NextColo call NextColorScheme(1)
command! -nargs=0 PrevColo call NextColorScheme(-1)

function! NextColorScheme(increment)
    py nextcolorscheme(vim.eval("a:increment"))
endfunction
