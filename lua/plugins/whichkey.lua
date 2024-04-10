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
            ["<"] = "Move Tab Left",
            [">"] = "Move Tab Right",
            f = {
                name = "Find",
                f = "Find File",
                g = "Grep all files",
                b = "Find Buffer",
                h = "Find in Help",
                r = "Find in Repository",
            },
            nh = "No highlighting",
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
                e = "Buffermanager Quick Menu"
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
                x = "Terminate",
                a = "Restart (Again)",
                h = "Hover",
                p = "Preview",
                f = "Frames",
                s = "Scope",
                c = "Close Dap UI",
            },
            c = {
                name = "Copilot",
                a = "Code action",
                p = "Open Copilot Panel",
                c = "Copilot Chat",
            },
            h = {
                name = "Harpoon",
                a = "Append File",
                r = "Remove File",
                e = "Quick Menu (Explorer)",
                h = "Select 1",
                j = "Select 2",
                k = "Select 3",
                l = "Select 4",
                p = "Previous",
                n = "Next",
            },
            D = "Type definition",
            q = "Quit",
            rn = "Rename Symbol",
            s = "Leap forward",
            S = "Leap backward",
            t = {
                name = "Test",
                c = "Test Class",
                m = "Test Method",
                s = "Goto Subjects",
            },
        }, { prefix = "<leader>" })
    end
}
