setlocal indentexpr=GetJsonIndent()
"setlocal indentkeys+==end,=elsif,=when,=ensure,=rescue,==begin,==end

if exists("*GetJsonIndent")
    finish
endif

function GetJsonIndent()
    let lastlnum = prevnonblank(v:lnum - 1)

    let ind = indent(lastlnum)

    let lastLine = getline(lastlnum)
    if lastLine =~ '^.*\({\|[\)\s*$'
        let ind = ind + &sw
    endif

    let curLine = getline(v:lnum)
    if curLine =~ '^.*\(}\|]\),\?\s*$'
        let ind = ind - &sw
    endif

    return ind
endfunction
