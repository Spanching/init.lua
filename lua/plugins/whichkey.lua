return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.register({
      f = {
        name = "Find",
        f = "Find File",
        g = "Grep all files",
        b = "Find Buffer",
        h = "Find in Help",
        r = "Find in Repository",
      },
      fm = {
        name = "Format",
        f = "Format File"
      },
      e = {
        name = "Explorer",
        e = "Toggle Explorer",
        f = "Focus Explorer",
      },
      b = {
        name = "Buffer",
        n = "Buffer Next",
        p = "Buffer Previous",
        c = "Buffer Close",
      },
      l = {
        name = "Line",
        d = "duplicate",
        j = "Move Down",
        k = "Move Up",
      },
      g = {
        name = "Git",
        g = "Open Lazy Git",
        p = "Preview Hunk",
        f = "Git Fetch",
        b = "Git Branch",
      },
      u = "Undo Tree",
      w = "Write file",
      d = {
        name = "Debug",
        m = "Main Class Configs",
        b = "Breakpoint",
        r = "Open REPL",
        l = "Run Last",
        t = "Terminate",
        a = "Restart (Again)",
        h = "Hover",
        p = "Preview",
        f = "Frames",
        s = "Scope",
      },
      c = {
        name = "Code",
        a = "Code action",
      },
      h = {
        name = "Harpoon",
        a = "Append File",
        r = "Remove File",
        h = "Remove highlighting"
      },
      D = "Type definition",
      p = {
        name = "persistence",
        r = "Restore Session for path",
        l = "Restore last Session",
      },
      q = "Quit",
      rn = "Rename Symbol",
    }, { prefix = "<leader>" })
  end
}
