return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async"
  },
  event = "UIEnter",
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  opts = {
    provider_selector = function(_, _, _)
      return {'treesitter', 'indent'}
    end,
    close_fold_kinds_for_ft = {
      default = { "imports", "comment" }
    },
    -- Thank you, pseudometa
    -- show folds with number of folded lines instead of just the icon
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local hlgroup = "NonText"
      local newVirtText = {}
      local suffix = "   " .. tostring(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, hlgroup })
      return newVirtText
     end,
  }
}
