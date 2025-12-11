return {
    name = 'g++: compile',
    builder = function()
        return {
            name = 'g++: compile',
            cmd = { 'g++' },
            args = {
                '-O',
                '-Wall',
                '-W',
                '-pedantic',
                vim.fn.expand '%:p',
                '-o',
                vim.fn.expand '%:t:r',
            },
        }
    end,
    condition = {
        filetype = { 'cpp' },
    },
}
