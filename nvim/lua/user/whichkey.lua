-- Author: Tarun (tarungovindk) nvim configs --
local status_ok, alpha = pcall(require, "which-key")
if not status_ok then
	return
end

local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
