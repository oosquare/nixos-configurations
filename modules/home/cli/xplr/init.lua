version = "0.21.9"

function clone(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[clone(k, s)] = clone(v, s) end
  return res
end

xplr_original = clone(xplr)

-- -----------
-- Keybindings
-- -----------

-- Navigation (replace `h`, `j`, `k` and `l` with `j`, `k`, `i` and `l`)
xplr.config.modes.builtin.default.key_bindings.on_key["h"] = nil
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["i"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["down"]

-- Move focus across multiple lines
xplr.config.modes.builtin.default.key_bindings.on_key["I"] = {
  help = "up multi-lines",
  messages = {
    "FocusPrevious",
    "FocusPrevious",
    "FocusPrevious",
    "FocusPrevious",
    "FocusPrevious",
  }
}

xplr.config.modes.builtin.default.key_bindings.on_key["K"] = {
  help = "down multi-lines",
  messages = {
    "FocusNext",
    "FocusNext",
    "FocusNext",
    "FocusNext",
    "FocusNext",
  }
}

-- Enter child or parent directory with Enter or Backspace
xplr.config.modes.builtin.default.key_bindings.on_key["enter"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["backspace"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["left"]

-- Helix-like select/unselect all
xplr.config.modes.builtin.default.key_bindings.on_key["%"] = {
  help = "select all",
  messages = {
    "SelectAll",
  }
}
xplr.config.modes.builtin.default.key_bindings.on_key["V"] = nil

xplr.config.modes.builtin.default.key_bindings.on_key[","] = {
  help = "unselect all",
  messages = {
    "UnSelectAll",
  }
}

xplr.config.modes.builtin.default.key_bindings.on_key["<"] = {
  help = "clear selection",
  messages = {
    "ClearSelection",
  }
}

-- Visual mode
xplr.config.modes.builtin.default.key_bindings.on_key["v"] = {
  help = "visual",
  messages = {
    { CallLuaSilently = "custom.visual_mode_init" },
  }
}

-- Helix-like go to bottom (replace `G` with `ge`)
xplr.config.modes.builtin.go_to.key_bindings.on_key["e"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["G"]
xplr.config.modes.builtin.default.key_bindings.on_key["G"] = nil

-- Sort (replace `s` with `:S`)
xplr.config.modes.builtin.action.key_bindings.on_key["S"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["s"]

-- Filter (replace `f` with `:f`)
xplr.config.modes.builtin.action.key_bindings.on_key["f"] =
  xplr_original.config.modes.builtin.default.key_bindings.on_key["f"]
xplr.config.modes.builtin.default.key_bindings.on_key["f"] = nil

-- Quit and change directory (print $PWD)
xplr.config.modes.builtin.default.key_bindings.on_key["Q"] = {
  help = "quit and change directory",
  messages = {
    "PrintPwdAndQuit",
  }
}

-- Helix-like select one
xplr.config.modes.builtin.default.key_bindings.on_key["x"] = {
  help = "toggle selection",
  messages = {
    "ToggleSelection",
  }
}

xplr.config.modes.builtin.default.key_bindings.on_key["X"] = {
  help = "extend selection",
  messages = {
    "ToggleSelection",
    "FocusNext",
  }
}


-- Copy mode
xplr.config.modes.builtin.default.key_bindings.on_key["y"] = {
  help = "select and copy",
  messages = {
    "Select",
    { SwitchModeCustom = "select_and_copy" },
  }
}
xplr.config.modes.builtin.default.key_bindings.on_key["c"] = nil

-- Move and delete mode
xplr.config.modes.builtin.default.key_bindings.on_key["d"] = {
  help = "select and move/delete",
  messages = {
    "Select",
    { SwitchModeCustom = "select_and_move_or_delete" },
  }
}
xplr.config.modes.builtin.default.key_bindings.on_key["m"] = nil

-- -----
-- Custom Modes
-- -----

-- Helix-like copy mode
xplr.config.modes.custom.select_and_copy = {
  name = "select and copy",
  key_bindings = {
    on_key = {
      -- Navigation
      ["left"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["left"],
      ["right"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["right"],
      ["up"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["up"],
      ["down"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["down"],
      ["j"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["left"],
      ["l"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["right"],
      ["i"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["up"],
      ["k"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["down"],

      ["I"] = {
        help = "up multi-lines",
        messages = {
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
        }
      },

      ["K"] = {
        help = "down multi-lines",
        messages = {
          "FocusNext",
          "FocusNext",
          "FocusNext",
          "FocusNext",
          "FocusNext",
        }
      },

      -- Paste selection
      ["p"] = {
        help = "copy selection here",
        messages = xplr_original.config.modes.builtin.selection_ops.key_bindings.on_key["c"].messages,
      },

      ["P"] = {
        help = "copy selection to",
        messages = xplr_original.config.modes.builtin.default.key_bindings.on_key["c"].messages,
      },
    },
  }
}

-- Helix-like move mode
xplr.config.modes.custom.select_and_move_or_delete = {
  name = "select and move/delete",
  key_bindings = {
    on_key = {
      -- Navigation
      ["left"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["left"],
      ["right"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["right"],
      ["up"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["up"],
      ["down"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["down"],
      ["j"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["left"],
      ["l"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["right"],
      ["i"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["up"],
      ["k"] = xplr_original.config.modes.builtin.default.key_bindings.on_key["down"],

      ["I"] = {
        help = "up multi-lines",
        messages = {
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
          "FocusPrevious",
        }
      },

      ["K"] = {
        help = "down multi-lines",
        messages = {
          "FocusNext",
          "FocusNext",
          "FocusNext",
          "FocusNext",
          "FocusNext",
        }
      },

      -- Move selection
      ["p"] = {
        help = "move selection here",
        messages = xplr_original.config.modes.builtin.selection_ops.key_bindings.on_key["m"].messages,
      },

      ["P"] = {
        help = "move selection to",
        messages = xplr_original.config.modes.builtin.default.key_bindings.on_key["m"].messages,
      },

      -- Delete selection
      ["D"] = {
        help = "delete selection",
        messages = xplr_original.config.modes.builtin.delete.key_bindings.on_key["D"].messages,
      },
    },
  }
}

-- Visual mode
xplr.config.modes.custom.visual = {
  name = "visual",
  key_bindings = {
    on_key = {
      -- Exit visual mode
      ["v"] = {
        help = "exit visual mode",
        messages = {
          { CallLuaSilently = "custom.visual_mode_exit" },
        }
      },

      -- Navigation
      ["up"] = {
        help = "up",
        messages = {
          { CallLuaSilently = "custom.visual_mode_up" },
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          { CallLuaSilently = "custom.visual_mode_down" },
        },
      },
    },
  },
}

-- Visual mode helper functions
-- bounded_index = xplr.config.general.enforce_bounded_index_navigation
xplr.fn.custom.visual_mode_init = function(app)
  -- TODO: Set this dynamically
  bounded_index = true
  visual_mode_global_state = "init"
  visual_mode_global_state_index = clone(app.directory_buffer.focus)
  return {
    "ToggleSelection",
    { SwitchModeCustom = "visual" },
  }
end

xplr.fn.custom.visual_mode_exit = function(app)
  visual_mode_global_state = nil
  visual_mode_global_state_index = nil
  return {
    "PopMode",
  }
end


function get_previous_index(app)
  if app.directory_buffer.total == 0 then
    return nil
  end

  local index = app.directory_buffer.focus

  if index == 0 then
    if bounded_index then
      return nil
    else
      return app.directory_buffer.total - 1
    end
  else
    return index - 1
  end
end

function get_next_index(app)
  if app.directory_buffer.total == 0 then
    return nil
  end

  local index = app.directory_buffer.focus

  if index == app.directory_buffer.total - 1 then
    if bounded_index then
      return nil
    else
      return 0
    end
  else
    return index + 1
  end
end

xplr.fn.custom.visual_mode_up = function(app)
  -- Do nothing when there is no node in directory.
  if app.directory_buffer.total == 0 then
    return {}
  end

  local new_index = get_previous_index(app)

  -- Do nothing when can't move focus up.
  if new_index == nil then
    return {}
  end

  if visual_mode_global_state == "init" then
    if app.directory_buffer.total == 1 then
      -- Don't move focus when there is only one entry.
      return {}
    else
      visual_mode_global_state = "up_extending"
      return {
        "FocusPrevious",
        "ToggleSelection",
      }
    end
  elseif visual_mode_global_state == "up_extending" then
    if new_index == visual_mode_global_state_index then
      -- Will reach the start position and cover the whole buffer.
      -- (xplr.config.general.enforce_bounded_index_navigation = false)
      visual_mode_global_state = "up_collapsing"
      visual_mode_global_state_index = app.directory_buffer.focus

      return {
        "FocusPrevious"
      }
    else
      return {
        "FocusPrevious",
        "ToggleSelection",
      }
    end
  elseif visual_mode_global_state == "up_collapsing" then
    -- Will reach the start position
    if new_index == visual_mode_global_state_index then
      visual_mode_global_state = "init"
    end

    return {
      "ToggleSelection",
      "FocusPrevious",
    }
  elseif visual_mode_global_state == "down_extending" then
    -- Will reach the start position
    if new_index == visual_mode_global_state_index then
      visual_mode_global_state = "init"
    else
      visual_mode_global_state = "up_collapsing"
    end

    return {
      "ToggleSelection",
      "FocusPrevious",
    }
  elseif visual_mode_global_state == "down_collapsing" then
    visual_mode_global_state = "up_extending"
    return {
      "FocusPrevious",
      "ToggleSelection",
    }
  else
    return {
      { LogError = "Unknown state: " .. visual_mode_global_state },
    }
  end
end

xplr.fn.custom.visual_mode_down = function(app)
  -- Do nothing when there is no node in directory.
  if app.directory_buffer.total == 0 then
    return {}
  end

  local new_index = get_next_index(app)

  -- Do nothing when can't move focus up.
  if new_index == nil then
    return {}
  end

  if visual_mode_global_state == "init" then
    if app.directory_buffer.total == 1 then
      -- Don't move focus when there is only one entry
      return {}
    else
      visual_mode_global_state = "down_extending"
      return {
        "FocusNext",
        "ToggleSelection",
      }
    end
  elseif visual_mode_global_state == "down_extending" then
    if new_index == visual_mode_global_state_index then
      -- Will reach the start position and cover the whole buffer.
      -- (xplr.config.general.enforce_bounded_index_navigation = false)
      visual_mode_global_state = "down_collapsing"
      visual_mode_global_state_index = app.directory_buffer.focus

      return {
        "FocusNext"
      }
    else
      return {
        "FocusNext",
        "ToggleSelection",
      }
    end
  elseif visual_mode_global_state == "down_collapsing" then
    -- Will reach the start position
    if new_index == visual_mode_global_state_index then
      visual_mode_global_state = "init"
    end

    return {
      "ToggleSelection",
      "FocusNext",
    }
  elseif visual_mode_global_state == "up_extending" then
    -- Will reach the start position
    if new_index == visual_mode_global_state_index then
      visual_mode_global_state = "init"
    else
      visual_mode_global_state = "down_collapsing"
    end

    return {
      "ToggleSelection",
      "FocusNext",
    }
  elseif visual_mode_global_state == "up_collapsing" then
    visual_mode_global_state = "down_extending"
    return {
      "FocusNext",
      "ToggleSelection",
    }
  else
    return {
      { LogError = "Unknown state: " .. visual_mode_global_state },
    }
  end
end

-- --
-- UI
-- --

-- Less fancy border instead of rounded one
xplr.config.general.panel_ui.default.border_type = "Plain"

-- Preserve layout instead of switching to fullscreen layout when using the following mode
xplr.config.modes.builtin.selection_ops.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.create.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.go_to.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.delete.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.action.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.quit.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.switch_layout.layout = xplr_original.config.layouts.builtin.default
xplr.config.modes.builtin.vroot.layout = xplr_original.config.layouts.builtin.default

-- Disable rounded-conrner tree structure display
xplr.config.general.table.header.cols = {
  { format = " index", style = {} },
  { format = "┌─── path", style = {} },
  { format = "permission", style = {} },
  { format = "size", style = {} },
  { format = "modified", style = {} },
}

xplr.config.general.table.tree = {
  { format = "├", style = {} },
  { format = "├", style = {} },
  { format = "└", style = {} },
}

-- Emphasis for focused entry
xplr.config.general.focus_ui.prefix = "[["
xplr.config.general.focus_ui.suffix = "]]"
xplr.config.general.focus_selection_ui.prefix = "[{"
xplr.config.general.focus_selection_ui.suffix = "]}"

-- ----
-- Misc
-- ----

xplr.config.general.enforce_bounded_index_navigation = true
