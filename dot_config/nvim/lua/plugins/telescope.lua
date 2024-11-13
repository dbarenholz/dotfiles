return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    -- Developer-oriented module containing a bunch of helper functions that telescope wants
    "nvim-lua/plenary.nvim",
    -- Make sorting fast if necessary
    -- {
    --   "nvim-telescope/telescope-fzf-native.nvim",
    --   build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
    -- }
  }
}
