scriptencoding utf8

" vim-bepo - Plugin vim pour disposition de clavier bépo
" Maintainer:   Micha Moskovic
"               Rémy Taymans

if exists('g:loaded_bepo') || &compatible
  finish
else
  let g:loaded_bepo = 1
endif

"s:tomap is for text-objects
function! s:tomap(key, target) abort
  if maparg(a:key, 'o') ==# ''
    execute 'onoremap' a:key a:target
  endif
  if maparg(a:key, 'x') ==# ''
    execute 'xnoremap' a:key a:target
  endif
endfunction

"s:amap is for the rest
function! s:amap(key, target) abort
  if maparg(a:key, 'n') ==# ''
    execute 'nnoremap' a:key a:target
  endif
  call s:tomap(a:key, a:target)
endfunction

" Navigation keys {hjkl} -> [tsdr]
noremap t h
noremap s j
noremap d k
noremap r l
noremap T H
noremap S J
noremap D K
noremap R L
" Delete : {d} -> [c]
noremap c d
noremap cc dd
noremap C D
noremap CC DD
call s:amap(  'gt', 'gj'     )    "on préserve les variantes avec 'g'
call s:amap(  'gs', 'gk'     )    "on préserve les variantes avec 'g'
call s:amap(  'zt', 'zj'     )    "on préserve les variantes avec 'z'
call s:amap(  'zs', 'zk'     )    "on préserve les variantes avec 'z'
call s:amap(   'j',  't'     )    "{j} devient [h] même doigt que pour [f]
call s:amap(   'J',  'T'     )    "idem pour {J} et [H]
call s:amap(   'l',  'c'     )    "{c} devient [l]
call s:amap(   'L',  'C'     )    "{C} devient [L]
call s:amap(   'h',  'r'     )    "{h} devient [r]
call s:amap(   'H',  'R'     )    "{H} devient [R]
call s:amap(   'k',  's'     )    "{k} devient [s]
call s:amap(   'K',  'S'     )    "{h} devient [S]
call s:amap(   'gb', 'gT'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gé', 'gt'    )    "le couple [gb]/[gé] agit sur les tabs
call s:amap(   'gB', ':execute "silent! tabfirst"<CR>'   )    "[gB] va au premier tab
call s:amap(   'gÉ', ':execute "silent! tablast"<CR> '   )    "[gÉ] au dernier
call s:amap(   'gT', '<C-]>' )    "[gT] est libéré et peut agir sur les tags
call s:amap(   '«',  '<'     )    "[<] est moins accessible que [«]
call s:amap(   '»',  '>'     )    "idem pour [»] et [>]
call s:amap(   ';',  ','     )    "idem pour [,] et [;]
call s:amap(   ',',  ';'     )    "qui sont permutés
call s:amap(  'g,',  'g;'    )    "idem pour [g,] et [g;]
call s:amap(  'g;',  'g,'    )    "qui sont permutés
call s:amap(   'é',  'w'     )    "[w] est peu accessible, on utilise [é]
call s:amap(   'É',  'W'     )    "idem pour [W] et [É]
call s:tomap( 'aé',  'aw'    )    "idem pour [aw] et [aé]
call s:tomap( 'aÉ',  'aW'    )    "idem pour [aW] et [aÉ]
call s:tomap( 'ié',  'iw'    )    "idem pour [iw] et [ié]
call s:tomap( 'iÉ',  'iW'    )    "idem pour [iW] et [iÉ]
call s:amap(   'w',  '<C-w>' )    "[w] est libre pour faire <C-w>
call s:amap(   'W',  '<C-w><C-w>') "et [w] pour faire <C-w><C-w>
call s:amap(  'wt', '<C-w>h' )    "on map [w]+direction
call s:amap(  'ws', '<C-w>j' )    "on map [w]+direction
call s:amap(  'wd', '<C-w>k' )    "on map [w]+direction
call s:amap(  'wr', '<C-w>l' )    "on map [w]+direction
call s:amap(  'wT', '<C-w>H' )    "idem pour les majuscules
call s:amap(  'wS', '<C-w>J' )    "idem pour les majuscules
call s:amap(  'wD', '<C-w>K' )    "idem pour les majuscules
call s:amap(  'wR', '<C-w>L' )    "idem pour les majuscules
call s:amap(  'wh', '<C-w>s' )    "crée un split _h_orizontal
call s:amap(  'wé', '<C-w>t' )    "va en haut à gauche
call s:amap(  'wÉ', '<C-w>T' )    "déplace sur un nouveau tab
call s:amap('w<SPACE>', ':split<CR>') " crée un split horizontal
call s:amap('w<CR>', ':vsplit<CR>') " crée un split vertical
