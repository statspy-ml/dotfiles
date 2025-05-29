return {

  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
        runner = "pytest",
        args = { "--maxfail=1", "--disable-warnings", "-q" },
      }),
    },
  },
}
