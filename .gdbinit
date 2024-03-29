# do not ask confirmation on exit
define hook-quit
    set confirm off
end

# setup command history
set history save on
set history size 5000
set history filename ~/.gdb_history

set debuginfod enabled on

# for disasm
set disassembly-flavor intel

# plugins
py import duel

define init-pwndbg
    source /usr/share/pwndbg/gdbinit.py
end
