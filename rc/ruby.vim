" By default, the "end" keyword is colorized according to the opening statement
" of the block it closes.  While useful, this feature can be expensive; if you
" experience slow redrawing (or you are on a terminal with poor color support)
" you may want to turn it off by defining the "ruby_no_expensive" variable:
let ruby_no_expensive = 1

" Ruby operators can be highlighted. This is enabled by defining ruby_operators:
let ruby_operators = 1

" Whitespace errors can be highlighted by defining "ruby_space_errors":
let ruby_space_errors = 1
" This will highlight trailing whitespace and tabs preceded by a space character
" as errors.  This can be refined by defining "ruby_no_trail_space_error" and
" "ruby_no_tab_space_error" which will ignore trailing whitespace and tabs after
" spaces respectively.

function! RunPipe(command)
    " make the named pipe if it doesn't exist
    " this line gives an error, not sure why...
    " exec ":silent !if [ \! -p ~/.vim/commands-fifo ]; then mkfifo ~/.vim/commands-fifo; else true; fi"
    " run the spec by adding the command to the named pipe
    exec ":silent !echo \"" . a:command . "\" > ~/.vim/commands-fifo"
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    call RunPipe("rspec --format documentation --order default --color --tty " . a:filename)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! RunCucumberWip()
  :w
  call RunPipe("bundle exec cucumber --profile wip")
endfunction

function! RunCucumber(filename)
  :w
  call RunPipe("bundle exec cucumber --require features " . a:filename)
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>
map <leader>c :call RunCucumber(@%)<cr>
map <leader>C :call RunCucumberWip()<cr>


" Leader p makes normal variable assignment to RSpec let block
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
