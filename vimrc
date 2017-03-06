set imdisable nocompatible nobackup nowritebackup noswapfile
set nowrap linebreak
set backspace=indent,eol,start
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch ignorecase	" do incremental searching
set tabstop=4 shiftwidth=4
"set cursorline

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

if has("autocmd")
	filetype plugin indent on
else
	set autoindent
endif

"source $VIMRUNTIME/vimrc_example.vim

colorscheme desert
set guioptions=gmrLTe

" Mouse
if has('mouse')
  set mouse=a
endif

" Hello, I'm Mac
if has("gui_mac")
	set encoding=utf-8 fileencodings=utf-8,cp1251 fileformat=dos
	set guifont=DejaVu_Sans_Mono:h12
	language ru
	winsize 270 70

" … and I'm PC
elseif has("gui_win32")
	" Чтобы работали операторы смены регистра
	language ctype Russian_Russia.1251
	set encoding=cp1251 fileencodings=utf-8,cp1251,koi8-r,cp866 fileformat=dos
	set iskeyword=@,a-z,A-Z,48-57,_,128-175,192-255
	set guifont=DejaVu_Sans_Mono:h11:cRUSSIAN " PT_Mono:h12:cRUSSIAN

	source $VIMRUNTIME/mswin.vim

	" Меню выбора кодировки текста
	set wildmenu
	set wcm=<Tab>
	menu Кодировка.UTF-8		:e ++enc=utf8<CR>
	menu Кодировка.Windows-1251	:e ++enc=cp1251<CR>
	menu Кодировка.KOI8-R		:e ++enc=koi8-r<CR>
	menu Кодировка.CP866		:e ++enc=cp866<CR> 
	map <F8> :emenu Кодировка.<Tab>

	" netrw
	let g:netrw_cygwin = 0
	let g:netrw_scp_cmd = 'C:\"Program Files (x86)"\PuTTY\pscp.exe -q'
	let g:netrw_sftp_cmd = '"c:\"Program Files (x86)"\PuTTY\psftp.exe'
endif

" Избавляемся от необходимости лишний раз переключать раскладку
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Клавиши
function Wrap()
	if &wrap == 0
		set wrap
		echo "Обрыв строк включен"
	else
		set nowrap
		echo "Обрыв строк выключен"
	endif
endfunction
map <F5> :nohl<CR>:echo "Подсветка поиска выключена"<CR>
map <F6> :call Wrap()<CR>
map <F7> <Esc>:let @* = expand('%:t') .':'. line('.')<CR>:echo 'Имя файла и номер строки скопированы в системный буфер!'<CR>
" A4Tech X7 X-760H additional keys
map <X1Mouse> <C-O>
map <X2Mouse> <C-I>

" Проверка орфографии
if version >= 700
	setlocal spell spelllang=
	setlocal nospell
	function ChangeSpellLang()
		if &spelllang == ""
			setlocal spell spelllang=ru_ru,en_us
			echo "Включена проверка орфографии: русской и английской"
		else
			setlocal spell spelllang=
			echo "Проверка орфографии включена"
		endif
	endfunc
	map <F11> <Esc>:call ChangeSpellLang()<CR>
endif

" zen coding
let g:user_zen_settings = {'charset': 'windows-1251'}

" Drupal
au BufNewFile,BufRead *.info set filetype=ini
au BufNewFile,BufRead *.profile set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.module set filetype=php

" Smarty
au BufNewFile,BufRead *.tpl set filetype=smarty

" Mobile Balance plugin
au BufNewFile,BufRead *.jsmb set filetype=javascript

" Nginx
au BufNewFile,BufRead /etc/nginx/*,/usr/local/nginx/conf/* set filetype=nginx


" vim:fenc=cp1251
