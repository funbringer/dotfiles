function EchoError(msg)
    echohl ErrorMsg
    echomsg a:msg
    echohl None
endfunction

function Unimplemented(name)
  call EchoError('Unimplemented ' . a:name)
endfunction
