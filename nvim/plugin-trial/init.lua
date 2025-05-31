-- everything is in module in lua
local M ={}

function M.printHello()
    print("Hello world from nvim lua")
end

function M.printHi()
    print("Hi from nvim lua")
end

-- invoke function

vim.api.nvim_create_user_command("HelloWorld", function()
    require("/Users/sujanthapa/.config/nvim/plugin-trial").printHello()
end,{})
 
return M
