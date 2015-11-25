set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" ==================================================================================
"				[ pathogen ]
" ==================================================================================
call pathogen#infect()

" ========================================================================
"                        [ file Settings ]
" ========================================================================
syntax on               " Íµ¨Î¨∏ Í∞ïÏ°∞
filetype on             " ?åÏùº Ï¢ÖÎ•ò???∞Îùº Í∞ïÏ°∞
filetype plugin on		
filetype indent on

" ========================================================================
"                        [ Terminal Settings ]
" ========================================================================

"if &term =~ "xterm"     " Terminal color settings 
    "256 color -- 
	set t_Co=256
    let &t_Co=256 
    " restore screen after quitting 
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8 
    if has("terminfo") 
        let &t_Sf="\ESC[3%p1%dm" 
        let &t_Sb="\ESC[4%p1%dm" 
    else 
        let &t_Sf="\ESC[3%dm" 
        let &t_Sb="\ESC[4%dm" 
    endif 
"endif

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

colorscheme  wombat256mod

set laststatus=2					" status bar display (0:display, 1:a window of two or more, 2:always)
set statusline=%<%F%h%m%r%h%w%y>\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
set nocp
set nu
set ls=2
set hi=1000 
set expandtab
set hls
set loadplugins	
set ruler
set ignorecase	
set autoread
set cursorline	
set title
set ai								
set si								
set sw=4							
set tabstop=4						
set shiftwidth=4					
set sts=4							
set scs                             
set cindent							
set smartindent						
set showmatch						
set wmnu							
set backspace=indent,eol,start

set km=startsel

" ========================================================================
"                        [ Vim Settings ]
" ========================================================================

" Remember the previous source location
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "norm g`\"" |
            \ endi

" ========================================================================
"                        [ Macro Settings ]
" ========================================================================

map <F5> :norm I// <CR>              " ?ÑÏû¨?ºÏù∏ Ï£ºÏÑù, Î≤îÏúÑ?§Ï†ï???òÎ©¥ Î≤îÏúÑÏ£ºÏÑù
map <F6> :norm ^xxx<CR> 				" Ï£ºÏÑù?¥Ï†ú

map <F7> <C-W><C-W><CR>					"
map <F9>  :NERDTreeToggle<CR>		" NERDTree toggle
map <F10> :TlistToggle<CR><C-W><C-W>	" taglist toggle
map <F11> :SrcExplToggle<CR>		" SrcExpl toggle
map <F12> :BufExplorer<CR>			" BufExpl toggle

map <leader>zf v%zf					" folding
map <leader>zo zo                   " unfolding 

" hls Toggle
let g:hlsToggle = 0
func! HlsToggle()
    if(g:hlsToggle == 0)
        let g:hlsToggle = 1
        echo "hls On"
        set hls
    else
        let g:hlsToggle = 0
        echo "hls Off"
        set nohlsearch
    endif
endfunc
nmap <F7> :call HlsToggle()<cr>

" Folding Toggle
let g:foldToggle = 0
func! Fd()
    if(g:foldToggle == 0)
        let g:foldToggle = 1    
        echo "folding"
        "exe "v%zf" 
    else
        let g:foldToggle = 0
        echo "unfolding"
        "exe "zo"
    endif
endfunc
nmap <F8> :call Fd()<cr>

" Mouse Toggle
let g:mouseToggle = 0
func! MouseToggle()
    if(g:mouseToggle == 0)
        let g:mouseToggle = 1
        echo "Mouse On"
        set mouse=a
    else
        let g:mouseToggle = 0
        echo "Mouse Off"
        set mouse=c
    endif
endfunc
nmap <leader>mou :call MouseToggle()<cr>

" comment settings
map <leader>//<ENTER> :norm i//<cr>
map <leader>//<BACKSPACE> :norm xx<cr>

"undo - redo ctrl+r
map uu :u<CR>						
map ww =SetWindows()<CR>

nmap h <C-W>h						" ?îÎ©¥ ?¥Îèô Left 
nmap j <C-W>j						" ?îÎ©¥ ?¥Îèô Down
nmap k <C-W>k						" ?îÎ©¥ ?¥Îèô Up
nmap l <C-W>l						" ?îÎ©¥ ?¥Îèô Right


nmap <C-Left> <C-W><<C-W><<C-W><<C-W><
nmap <S-Left> <C-W><

nmap <C-Right> <C-W>><C-W>><C-W>><C-W>>
nmap <S-Right> <C-W>>
nmap <A-Right> <C-W>\|

nmap <C-Up> <C-W>+<C-W>+<C-W>+<C-W>+
nmap <S-Up> <C-W>+
nmap <A-Up> <C-W>_

nmap <C-Down> <C-W>-<C-W>-<C-W>-<C-W>-
nmap <S-Down> <C-W>-

" ========================================================================
"                        [ Man Page Settings ]
" ========================================================================

func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap <leader>ma :call Man()<cr><cr>

" ========================================================================
"                        [ HexViewer Settings ]
" ========================================================================

let g:hexViewer = 0
func! Hv()
    if (g:hexViewer == 0)
        let g:hexViewer = 1
        exe "%!xxd"
    else
        let g:hexViewer = 0
        exe "%!xxd -r"
    endif
endfunc
nmap <leader>h :call Hv()<cr>

" ========================================================================
"                        [ vim make Settings ]
" ========================================================================
nmap ,n :cn<cr>
nmap ,p :cp<cr>
nmap ,co :cope<cr>
nmap ,cc :ccl<cr>

" ========================================================================
"                        [ Plugin Settings ]
" ========================================================================

" [ --------------------------- Ctags ---------------------------------- ]

set tags=./tags,tags
set tagstack						" Í≤Ä???àÎçò tag ?ïÎ≥¥Î•?tag stack???ìÏïÑ ?îÎã§.
"set notagstack                     " tag stack???¨Ïö©?òÏ? ?äÎäî?? 
set tagbsearch                      " tag ?¥ÏßÑ ?êÏÉâ Í∞Ä???§Ï†ï
"set notagbsearch					" tag ?¥ÏßÑ ?êÏÉâ Í∏∞Îä• ?¥Ï†ú 

if version >= 500

    func! Sts()
        let st = expand("<cword>")
        exe "sts ".st
    endfunc
    nmap <C-]> :call Sts()<cr>

    func! Tj()
        let st = expand("<cword>")
        exe "tj ".st
    endfunc
    nmap <leader>tj :call Tj()<cr>

    func! Tn()
        exe "tn"
    endfunc
    nmap <leader>tn :call Tn()<cr>

    func! Tp()
        exe "tp"
    endfunc
    nmap <leader>tp :call Tp()<cr>

    func! Tr()
        exe "tr"
    endfunc
    nmap <leader>tr :call Tr()<cr>

    func! Tl()
        exe "tl"
    endfunc
    nmap <leader>tl :call Tl()<cr>

endif

nmap <leader>[ :q<CR>

" [ ------------------------------ Taglist ---------------------------------- ]

let Tlist_WinWidth=23				" ?àÎèÑ???¨Í∏∞
let Tlist_Inc_Winwidth = 0			" 
let Tlist_Exit_OnlyWindow = 1		" 
let Tlist_Auto_Open = 0				" 0: ?êÎèô ?¥Í∏∞ ?¥Ï†ú , 1: ?êÎèô ?¥Í∏∞ ?§Ï†ï
let Tlist_Sort_Type = "name"        " ?¥Î¶Ñ?ºÎ°ú ?ïÎ†¨
let Tlist_Use_Left_Window = 1		" Ï¢åÏ∏° ?îÎ©¥

" [ ------------------------------ cscope ----------------------------------- ] 
"set csprg=c:\usr\bin\cscope.exe			"

if filereadable("./cscope.out")     " ?ÑÏû¨ ?¥Îçî?êÏÑú cscope read
    set nocsverb
"    cs add cscope.out
    set csverb
endif


set csto=0
set cst  							"
"set nocst							"

func! Csw()
    exe "cs show"
endfunc
nmap <leader>csw :call Csw()<cr>

func! Csc()
    let csc = expand("<cword>")
    new
    exe "cs find c ".csc
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>csc :call Csc()<cr>

func! Csd()
    let csd = expand("<cword>")
    new
    exe "cs find d ".csd
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>csd :call Csd()<cr>

func! Cse()
    let cse = expand("<cword>")
    new
    exe "cs find e ".cse
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>cse :call Cse()<cr>

func! Csf()
    let csf = expand("<cword>")
    new
    exe "cs find f ".csf
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>csf :call Csf()<cr>

func! Csg()
    let csg = expand("<cword>")
    new
    exe "cs find g ".csg
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>csg :call Csg()<cr>

func! Csi()
    let csi = expand("<cword>")
    new
    exe "cs find i ".csi
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>csi :call Csi()<cr>

func! Css()
    let css = expand("<cword>")
    new
    exe "cs find s ".css
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>css :call Css()<cr>

func! Cst()
    let cst = expand("<cword>")
    new
    exe "cs find t ".cst
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap <leader>cst :call Cst()<cr>


nmap <leader>csh :cs h<cr>

" [ ------------------------------- bufexplorer ------------------------------ ]

" file buffer CleanClose
func! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
endfunc

nmap <leader>cf :call CleanClose(0)<cr>

" [ -------------------------------- NERD Tree ------------------------------- ]

let NERDTreeWinPos='right'			" ?∞Ï∏° ?îÎ©¥ Í≥†Ï†ï
let NERDTreeWinSize=25				" ?àÎèÑ???¨Ïù¥Ï¶??§Ï†ï
let NERDTreeShowBookmarks=1			" Î∂ÅÎßà???¨Ïö©
let NERDTreeMinimalUI=1				" 
"let NERDTreeIgnore=['.o$']			" ?àÏô∏Ï≤òÎ¶¨ ?§Ï†ï

" [ ------------------------------ Source Explorer --------------------------- ] 

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 13	

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100	

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"	  

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"	

" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1		

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below

let g:SrcExpl_pluginList = [
            \ "__Tag_List__",
            \ "_NERD_tree_",
            \ "Source_Explorer"
            \ ]

" [ ------------------------------ autocomplpop --------------------------------- ]

hi Pmenu ctermbg=blue
hi PmenuSel ctermbg=yellow ctermbg=red
hi PmenuSbar ctermbg=blue



"" [ ----------------------------- neocomplcache --------------------------------- ]
""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
""" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Enable heavy features.
"" Use camel case completion.
""let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
""let g:neocomplcache_enable_underbar_completion = 1

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> neocomplcache#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ?  neocomplcache#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>": "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h>    neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>     neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>    neocomplcache#close_popup()
"inoremap <expr><C-e>    neocomplcache#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left> neocomplcache#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
""inoremap <expr><Up> neocomplcache#close_popup() . "\<Up>"
""inoremap <expr><Down> neocomplcache#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplcache_enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplcache_enable_insert_char_pre = 1

"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" [ ---------------------------- Fuzzy Finder ----------------------------------- ]

" ?åÏùº Î™©Î°ù???úÏãú?????úÏãú?òÏ? ?äÏùÑ ?ïÏû•?êÎ? ?§Ï†ï
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp|class|pyc|orig)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

map <leader>ff :FufFile **/<cr>
map <leader>fb :FufBuffer<cr>
map <leader>ft :FufTagWithCursorWord!<cr>

" [ ---------------------------- Jinja ------------------------------------------ ]
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" EOF
