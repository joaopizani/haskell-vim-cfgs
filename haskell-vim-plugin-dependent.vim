" checks whether NeoBundle is present
if(exists("g:neobundle#log_filename"))
    filetype off

    " Haskell bundles themselves
    NeoBundle 'eagletmt/ghcmod-vim'
    NeoBundle 'ujihisa/neco-ghc'
    NeoBundle 'Twinside/vim-haskellFold'
    NeoBundle 'feuerbach/vim-hs-module-name'

    filetype plugin indent on


    " More usual stuff, keybindings, completion, tags and whatnot

    " Haskell lushtags + tagbar
    if executable('lushtags')
        let g:tagbar_type_haskell = {
            \ 'ctagsbin': 'lushtags',   'ctagsargs': '--ignore-parse-error --',
            \ 'kinds': [
                \ 'm:module:0', 'e:exports:1', 'i:imports:1', 't:declarations:0',
                \ 'd:declarations:1', 'n:declarations:1', 'f:functions:0', 'c:constructors:0'
            \ ],   'sro': '.',
            \ 'kind2scope': {'d': 'data', 'n': 'newtype', 'c': 'constructor', 't': 'type'},
            \ 'scope2kind': {'data': 'd', 'newtype': 'n', 'constructor': 'c', 'type': 't'}
        \ }
    endif

    " key mappings - mappings for GHCMod
    " in the case of a haskell buffer, F12 is for type inference
    nnoremap <silent> <Leader>t :GhcModType<CR>
    nnoremap <silent> <F9>     :GhcModType<CR>

    nnoremap <silent> <Leader>hr :GhcModTypeClear<CR>
    nnoremap <silent> <Leader>hi :GhcModInfoPreview<CR>
    nnoremap <silent> <Leader>he :GhcModInfo<CR>

    " in the case of a haskell buffer, F9 is GHC-Mod check instead of normal MakeProg
    nnoremap <silent> <Leader>hc :w<CR>:GhcModCheck<CR>
    nnoremap <silent> <F8>       :w<CR>:GhcModCheck<CR>
    inoremap <silent> <F8>       <ESC>:w<CR>:GhcModCheck<CR>i

    nnoremap <silent> <Leader>hl :w<CR>:GhcModLint<CR>
    nnoremap <silent> <Leader>hm :GhcModExpand<CR>

    " mapping for inserting the current module name
    let g:hs_module_no_mappings = 1
    nnoremap <silent> <Leader>hM :InsertHaskellModuleName<CR>
endif
