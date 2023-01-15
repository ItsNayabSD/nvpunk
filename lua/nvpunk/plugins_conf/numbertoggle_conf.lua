local nt = require'nvpunk.util.numbertoggle'
if require'nvpunk.preferences'.get_relative_numbers_enabled() then
    nt.create()
else
    nt.delete()
end
