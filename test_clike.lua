local fi3 = require('Source')
local file = assert(io.open(assert((...),"usage: lua test_clike.lua file"),"rb"))
_G.c_function = function(...)
   local _state = assert(fi3.get_state(),"This function is only callable from sandboxed code")
   -- local L = _state.frame
   _state.pc(_state.pc()+3)
end
---@diagnostic disable-next-line: deprecated
fi3.luaF_dispatch(file:read("*a"),_ENV or getfenv(0))((unpack or table.unpack)(arg,2))
