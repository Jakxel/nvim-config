local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
"     ██╗ █████╗ ██╗  ██╗██╗  ██╗███████╗██╗     ██╗   ██╗██╗███╗   ███╗",
"     ██║██╔══██╗██║ ██╔╝╚██╗██╔╝██╔════╝██║     ██║   ██║██║████╗ ████║",
"     ██║███████║█████╔╝  ╚███╔╝ █████╗  ██║     ██║   ██║██║██╔████╔██║",
"██   ██║██╔══██║██╔═██╗  ██╔██╗ ██╔══╝  ██║     ╚██╗ ██╔╝██║██║╚██╔╝██║",
"╚█████╔╝██║  ██║██║  ██╗██╔╝ ██╗███████╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
" ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

dashboard.opts.layout[1].val = 8
dashboard.opts.layout[3].val = 2 
alpha.setup(dashboard.config)


