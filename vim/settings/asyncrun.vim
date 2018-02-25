" ### Async Command Execution
" Additional helper for the asyncrun.vim plugin
" `:AsyncOpenRun ls -l` for example will open
" the quickfix window and then asyncronously run
" `ls -l` and put the results in the quickfix window.
" ###
command! -nargs=+ -complete=file -bar AsyncOpenRun silent copen|AsyncRun! <args>
