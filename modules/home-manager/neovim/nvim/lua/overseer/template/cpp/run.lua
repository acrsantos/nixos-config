return {
    name = 'gcc: run',
    builder = function()
        return {
            name = 'g++: run',
            cmd = { vim.fn.expand '%:p:r' },
            components = {
                { 'dependencies', task_names = { 'g++: compile' } },
                'default',
            },
        }
    end,
    condition = {
        filetype = { 'cpp' },
    },
}
