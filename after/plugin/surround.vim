" vim-bepo - Plugin vim pour disposition de clavier bépo
" Maintainer:       Micha Moskovic

if exists("g:loaded_surround") && (!exists("g:surround_no_mappings") || ! g:surround_no_mappings) && maparg('cs', 'n') !=# ''
  execute 'nmap ls' maparg('cs', 'n')
  execute 'nmap lS' maparg('cS', 'n')
  execute 'nmap cs' maparg('ds', 'n')
  nunmap ds
  nunmap cs
  nunmap cS
endif
