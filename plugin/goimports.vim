function! s:install()
  augroup goimports_autoformat
    au!
    autocmd BufWritePre <buffer> call goimports#Run()
    command! -buffer -nargs=1 -bang -complete=customlist,goimports#Complete GoImport call goimports#SwitchImport(1, '', <f-args>, '<bang>')
    command! -buffer -nargs=* -bang -complete=customlist,goimports#Complete GoImportAs call goimports#SwitchImport(1, '', <f-args>, '<bang>')
  augroup END
endfunction

augroup goimports_install
  au!
  autocmd FileType go call s:install()
augroup END
