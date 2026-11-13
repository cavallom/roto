--local vb = renoise.ViewBuilder()

--local column_rack = vb:column {
--    margin = 1,          -- Optional: space around the rack
--    spacing = 2,         -- Optional: space between child views
--    style = "body",-- Optional: background style
--    
--    -- Child views are defined inline within this table
--    vb:text {
--        text = "Child View 1"
--    },
--    vb:text {
--        text = "Child View 2"
--    },
--    vb:checkbox {       
--        value = true
--    }
--} 
local musicutil = require ("lib/musicutil")
local notesutil = require ("lib/notesutil")
--local dialog = renoise.app():show_custom_dialog("Roto", column_rack)

local pkv = 0
local pkv2 = 0
local pkv3 = 0
local pkv4 = 0
local pkv5 = 0
local pkv6 = 0
local nkv = 0
local nkv2 = 0
local nkv3 = 0
local nkv4 = 0
local nkv5 = 0
local nkv6 = 0

local seqcount = 1
local currut = 0

local curscale = nil
local current_scale = nil

local rv = { true, true, true, true, true, true }
local rp = { false, false, false, false, false, false }
local rd = { false, false, false, false, false, false }


function EvoSongGet()
  return renoise.song()
end

function SeqCountGet()
  return seqcount
end

function SeqCountSet(nseqcount)
  seqcount = nseqcount
end

function Rvtget(ntrack)
  return rv[ntrack]
end

function Rptget(ntrack)
  return rp[ntrack]
end

function Rdtget(ntrack)
  return rd[ntrack]
end

function Rvtset(ntrack, rvtval)
  rv[ntrack] = rvtval
  if rvtval == true then
    EvoSongGet().tracks[ntrack].volume_column_visible = true
  else
    EvoSongGet().tracks[ntrack].volume_column_visible = false
  end
end

function Rptset(ntrack, rptval)
  rp[ntrack] = rptval
  if rptval == true then
    EvoSongGet().tracks[ntrack].panning_column_visible = true
  else
    EvoSongGet().tracks[ntrack].panning_column_visible = false
  end
end

function Rdtset(ntrack, rdtval)
  rd[ntrack] = rdtval
  if rdtval == true then
    EvoSongGet().tracks[ntrack].delay_column_visible = true
  else
    EvoSongGet().tracks[ntrack].delay_column_visible = false
  end
end

--[[ local curSong = renoise.song()
SeqCountSet(#curSong.sequencer.pattern_sequence) ]]

local function my_timer_function()
    if pkv ~= nkv then
      pkv = nkv
      currut = nkv
      --print("Timer triggered apply kv to " .. nkv)

--[[       curscale = musicutil.generate_scale_of_length(nkv, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv, 1)
    end
    if pkv2 ~= nkv2 then
      pkv2 = nkv2
      currut = nkv2
      --print("Timer triggered apply kv to " .. nkv2)

--[[       curscale = musicutil.generate_scale_of_length(nkv2, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv2, 2)
    end
    if pkv3 ~= nkv3 then
      pkv3 = nkv3
      currut = nkv3
      --print("Timer triggered apply kv to " .. nkv3)

--[[       curscale = musicutil.generate_scale_of_length(nkv3, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv3, 3)
    end

    if pkv4 ~= nkv4 then
      pkv4 = nkv4
      currut = nkv4
      --print("Timer triggered apply kv to " .. nkv4)

--[[       curscale = musicutil.generate_scale_of_length(nkv4, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv4, 4)
    end
    if pkv5 ~= nkv5 then
      pkv5 = nkv5
      currut = nkv5
      --print("Timer triggered apply kv to " .. nkv5)

--[[       curscale = musicutil.generate_scale_of_length(nkv5, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv5, 5)
    end
    if pkv6 ~= nkv6 then
      pkv6 = nkv6
      currut = nkv6
      --print("Timer triggered apply kv to " .. nkv6)

--[[       curscale = musicutil.generate_scale_of_length(nkv6, current_scale, 8)
      if curscale then
        print("Scale Test: ", table.concat(curscale, ", "))
      else
        print("Scale generation failed")
      end ]]
      randomDo(nkv6, 6)
    end
end


local vb = renoise.ViewBuilder()
local isa = true

-- 1. Create an Observable for the knob's value
local options = renoise.Document.create("KnobToolPreferences") {
  volume = 127 -- Default value
}

-- 2. Create the rotary view and bind it

local rotary_view = vb:rotary {
id = "groove_rotary",
tooltip="Instrument #00 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 1 value changed to: " .. value)
    nkv = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary" -- Assigns the MIDI mapping target
}

local rotary_view2 = vb:rotary {
  
id = "groove_rotary2",
tooltip="Instrument #01 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 2 value changed to: " .. value)
    nkv2 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary 2" -- Assigns the MIDI mapping target
}

local rotary_view3 = vb:rotary {
id = "groove_rotary3",
tooltip="Instrument #02 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 3 value changed to: " .. value)
    nkv3 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary 3" -- Assigns the MIDI mapping target
}


local rotary_view4 = vb:rotary {
id = "groove_rotary4",
tooltip="Instrument #03 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 4 value changed to: " .. value)
    nkv4 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary 4" -- Assigns the MIDI mapping target
}

local rotary_view5 = vb:rotary {
id = "groove_rotary5",
tooltip="Instrument #04 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 5 value changed to: " .. value)
    nkv5 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary 5" -- Assigns the MIDI mapping target
}

local rotary_view6 = vb:rotary {
id = "groove_rotary6",
tooltip="Instrument #05 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    -- This function triggers whenever the knob is moved
    --print("Knob 6 value changed to: " .. value)
    nkv6 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:MyGrooveTool:Groove Rotary 6" -- Assigns the MIDI mapping target
}

--[[ renoise.tool():add_midi_mapping {
    name = "Tools:MyGrooveTool:clear_all_cbox", -- Must match the midi_mapping string above
    invoke = function(message)
        -- Access the checkbox view to update its state
        local checkbox_view = vb.views["clear_all_cbox"]
        
        if message:is_trigger() then
            -- Toggle state for buttons/trigger messages
            checkbox_view.value = not checkbox_view.value
        elseif message:is_abs_value() then
            -- Set state for absolute value messages (e.g., CC 0-127)
            -- Convert 0-127 to boolean (e.g., > 64 is true)
            checkbox_view.value = message.int_value > 64
        end
    end
}  ]]  

-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end
}

-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary 2",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary2"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end
}
-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary 3",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary3"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end  
}




renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary 4",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary4"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end
}

-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary 5",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary5"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end
}
-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:Groove Rotary 6",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class rotary_view : renoise.Views.View
    ---@field value number
    ---@type rotary_view
    local my_ro = vb.views["groove_rotary6"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end  
}








-- 2. Create the tool and add the MIDI mapping
renoise.tool():add_midi_mapping {
  name = "Tools:MyGrooveTool:my_slider",
  invoke = function(midi_message)
    -- This function is called when MIDI data is received
    -- You must manually update the rotary's value property to sync the UI
    -- midi_message.value is typically 0-127
    
    -- Update the rotary object's value to reflect the MIDI input
    
    --print(midi_message.int_value)
    ---@class my_slider : renoise.Views.View
    ---@field value number
    ---@type my_slider
    local my_ro = vb.views["my_slider"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
    
    -- The notifier will automatically trigger because value changed
    -- If you need to scale 0-127 to 0-100, do so here before assigning
  end
}

-- Define the scales table
--[[   local scale_selector = vb:popup {
    --items = {"Opzione A", "Opzione B", "Opzione C"},
    items = notesutil.get_all_scales(),
    notifier = function(selected_index)
      current_scale = selected_index
      print("Selected scale index: " .. selected_index)
      -- You can also retrieve the selected mode name if needed
      local selected_mode_name = notesutil.get_all_scales()[selected_index]
      print("Selected scale name: " .. selected_mode_name)
    end
  } ]]
Dialog_content = vb:column {
    margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
    views = {
      vb:row {
        views = {
      --[[     vb: column {
            margin = 5,
            spacing = 5,
            views = {
              vb:text { text = "Select Scale" },
              scale_selector
            }
          }, ]]
          vb: column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#00", align = "center" }
              },
              vb:row {
                id = "rv",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(1),
                  notifier = function(value)
                    Rvtset(1, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(1),
                  notifier = function(value)
                    Rptset(1, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(1),
                  notifier = function(value)
                    Rdtset(1, value)
                  end
                },
                vb:text { text = "*dly" }
              } 
            }
          },
          vb:column {
            width = 5,
          },
          vb: column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view2
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#01", align = "center" }
              },
              vb:row {
                id = "rv2",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(2),
                  notifier = function(value)
                    Rvtset(2, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp2",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(2),
                  notifier = function(value)
                    Rptset(2, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd2",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(2),
                  notifier = function(value)
                    Rdtset(2, value)
                  end
                },
                vb:text { text = "*dly" }
              } 
            }
          },
          vb:column {
            width = 5,
          },
          vb: column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view3
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#02", align = "center" }
              },
              vb:row {
                id = "rv3",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(3),
                  notifier = function(value)
                    Rvtset(3, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp3",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(3),
                  notifier = function(value)
                    Rptset(3, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd3",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(3),
                  notifier = function(value)
                    Rdtset(3, value)
                  end
                },
                vb:text { text = "*dly" }
              } 
            }
          },
          vb:column {
            width = 5,
          },
          vb: column {
            -- margin = 5,
            -- spacing = 5,
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view4
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#03", align = "center" }
              },
              vb:row {
                id = "rv4",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(4),
                  notifier = function(value)
                    Rvtset(4, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp4",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(4),
                  notifier = function(value)
                    Rptset(4, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd4",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(4),
                  notifier = function(value)
                    Rdtset(4, value)
                  end
                },
                vb:text { text = "*dly" }
              } 
            }
          },
          vb:column {
            width = 5,
          },
          vb: column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view5
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#04", align = "center" }
              },
              vb:row {
                id = "rv5",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(5),
                  notifier = function(value)
                    Rvtset(5, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp5",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(5),
                  notifier = function(value)
                    Rptset(5, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd5",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(5),
                  notifier = function(value)
                    Rdtset(5, value)
                  end
                },
                vb:text { text = "*dly" }
              } 
            }
          },    
          vb:column {
            width = 5,
          },
          -- Second Column
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view6
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#05", align = "center" }
              },
              vb:row {
                id = "rv6",
                vb:checkbox {
                  tooltip = "Randomize Volume",
                  value = Rvtget(6),
                  notifier = function(value)
                    Rvtset(6, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp6",
                vb:checkbox {
                  tooltip = "Randomize Panning",
                  value = Rptget(6),
                  notifier = function(value)
                    Rptset(6, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd6",
                vb:checkbox {
                  tooltip = "Randomize Delay",
                  value = Rdtget(6),
                  notifier = function(value)
                    Rdtset(6, value)
                  end          },
                vb:text { text = "*dly" }
              } 
            }
          }
        }
      },
      vb:row {
        views = {
          vb:column {
            height = 10,
            --width = 300,
            style = "body", -- Applies rounded corners
          }
        }
      },
      vb:row {
        views = {
          vb:column {
            style = "body", -- Applies rounded corners
            --margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            --spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            --width = "100%",
            --height = 200,
            views = {
              --vb:text { text = "Column 1 Item 1" },
                  vb:button {
                    style = "rounded",
                    height = 24,
                    --color = {0xFF, 0xA5, 0x00},
                    secondary_color = {0x00, 0x00, 0x00},

                    width = 100,
                    
                  id = "bt",
            text = "Start",
            tooltip = "Start performance!",
            notifier = function()
              --print("Button clicked!")
              
              ---@class my_button : renoise.Views.View
              ---@field text string
              ---@field tooltip string
              local my_button = vb.views.bt
              local oricolor =  {0, 0, 0}
              
              if renoise.song().transport.playing == true then
                  renoise.song().transport.playing = false
                  if renoise.tool():has_timer(my_timer_function) then
                      renoise.tool():remove_timer(my_timer_function)
                  end
                --renoise.tool():remove_timer(my_timer_function) 
                  my_button.text = "Start"
                  my_button.tooltip = "Start performance!"
                  --my_button.color = { 82, 36, 17} 
              else
                renoise.song().transport.playing = true
                -- Add a timer that calls 'my_timer_function' every 100 milliseconds
                if not renoise.tool():has_timer(my_timer_function) then
                    renoise.tool():add_timer(my_timer_function, 100)
                end
                --renoise.tool():add_timer(my_timer_function, 1000) 
                my_button.text = "Stop"
                my_button.tooltip = "Stop performance!"
                --my_button.color = { 0xFF, 0x00, 0x00 } -- Red in RGB (0-255)
                --my_button.color = { 82, 36, 17} -- Renoise Orange RGB
              end
            end
          }--,
      --[[    vb:row {
        views = {
          vb:valuebox {
            width = 50,
            min = 1,      -- Minimum value
            max = 100,    -- Maximum value
            value = SeqCountGet(),
            --bind = my_observable_number, -- Optional: bind to an ObservableNumber for sync
            notifier = function(value)
              -- Called when the value changes
              --Clona gli slot da posizione 1 a 4 e li aggiunge dopo la posizione 4
              --song.sequencer:clone_range(1, 4)   
              local last_sequence_index = #curSong.sequencer.pattern_sequence
              SeqCountSet(last_sequence_index)
              if value > last_sequence_index then
                --curSong.sequencer:insert_sequence_at(last_sequence_index + 1, 1)
                curSong.sequencer:clone_range(last_sequence_index, last_sequence_index)
                curSong.sequencer.pattern_sequence[last_sequence_index + 1] = last_sequence_index + 1   
                print("New value: " .. value)
              else
                -- Remove the sequence position at index 1 (1-based)
                curSong.sequencer:delete_sequence_at(last_sequence_index)
              end
            end
          },
          vb:text {
            text = "+/- sequence"
          }
        }
      } ]]
          
          
          
          --[[ ,
          vb:checkbox {
              id = "clear_all_cbox",
                value = isa,
                    --notifier = function(bool_value)
                    
                        notifier = function(value)
                          -- Handle state change
                          print(value)
                      
              -- This function runs on every click
              if value == true then
                  -- Handle "checked" state
                  print("Checkbox is ON")
                  clear_all_pattern_sequence = true
                  isa = trueGetNoteRoot
              else
                  -- Handle "unchecked" state
                  print("Checkbox is OFF")
                  clear_all_pattern_sequence = false
                  isa = false
              end
          end,
          midi_mapping = "Tools:MyGrooveTool:clear_all_cbox"
              } ]]
          
          
          --[[ ,
              vb:text { text = "Roto Enabled:" } ]]
            }
          },
          vb:column {
            width = 244,
            --margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            --spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            vb:text {
              text = "The vb:row function creates a horizontal",
            },
--[[             vb:text {
              text = "container that stacks child views side-by-side.",
            } ]]
          }
        }
      }
    }
}



--[[ function Returnisa()GetNoteRoot
  return isa
end ]]

function GetSelectedScale()
  return current_scale
end

function GetSelectedScaleNotes()
  return curscale
end
  
function GetNoteRoot()
  return nkv
end
