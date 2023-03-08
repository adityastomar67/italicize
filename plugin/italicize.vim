if !has('nvim-0.5')
  echohl WarningMsg
  echom "nvim-highlights.nvim needs Neovim >= 0.5"
  echohl None
  finish
endif

if exists("g:loaded_italicize")
    finish
endif
let g:loaded_italicize = 1

augroup transparent
    autocmd!
    autocmd VimEnter,ColorScheme * lua require('transparent').clear_bg()
    command -bar -nargs=0 TransparentEnable lua require('italicize.transparent').toggle_transparent(true)
    command -bar -nargs=0 TransparentDisable lua require('italicize.transparent').toggle_transparent(false)
    command -bar -nargs=0 TransparentToggle lua require('italicize.transparent').toggle_transparent()
augroup END

augroup italics
    autocmd!
    autocmd VimEnter,ColorScheme * lua require('italicize').add_highlights()
    command -bar -nargs=0 ItalicsEnable lua require('italicize.italicize').toggle_italics(true)
    command -bar -nargs=0 ItalicsDisable lua require('italicize.italicize').toggle_italics(false)
    command -bar -nargs=0 ItalicsToggle lua require('italicize.italicize').toggle_italics()
augroup END