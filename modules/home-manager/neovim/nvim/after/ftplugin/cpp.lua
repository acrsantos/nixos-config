-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4

local wk = require("which-key")
wk.add({
  {
    { "<leader>cD", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>cc", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
    { "<leader>ci", "<cmd>CMakeInstall<cr>", desc = "CMake Install" },
    { "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake Select Build Type" },
  }
}, { prefix = "<leader>" })
