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


local function my_timer_function()
    if pkv ~= nkv then
      pkv = nkv

      randomDo(nkv, 1)
    end
    if pkv2 ~= nkv2 then
      pkv2 = nkv2

      randomDo(nkv2, 2)
    end
    if pkv3 ~= nkv3 then
      pkv3 = nkv3

      randomDo(nkv3, 3)
    end

    if pkv4 ~= nkv4 then
      pkv4 = nkv4

      randomDo(nkv4, 4)
    end
    if pkv5 ~= nkv5 then
      pkv5 = nkv5

      randomDo(nkv5, 5)
    end
    if pkv6 ~= nkv6 then
      pkv6 = nkv6

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

local rotary_view1 = vb:rotary {
id = "rotary1",
tooltip="Instrument #00 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#01" -- Assigns the MIDI mapping target
}

local rotary_view2 = vb:rotary {
  
id = "rotary2",
tooltip="Instrument #01 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv2 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#02" -- Assigns the MIDI mapping target
}

local rotary_view3 = vb:rotary {
id = "rotary3",
tooltip="Instrument #02 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv3 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#03" -- Assigns the MIDI mapping target
}


local rotary_view4 = vb:rotary {
id = "rotary4",
tooltip="Instrument #03 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv4 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#04" -- Assigns the MIDI mapping target
}

local rotary_view5 = vb:rotary {
id = "rotary5",
tooltip="Instrument #04 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv5 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#05" -- Assigns the MIDI mapping target
}

local rotary_view6 = vb:rotary {
id = "rotary6",
tooltip="Instrument #05 notes generator controller.",
  --bind = options.volume, -- Binds view to the Observable
  notifier = function(value)
    nkv6 = value
  end,
  min = 0, -- Optional: Set min/max range
  max = 127,
  midi_mapping = "Tools:Roto:Rotary_#06" -- Assigns the MIDI mapping target
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#01",
  invoke = function(midi_message)
    ---@class RotaryView
    ---@field value number
    ---@type RotaryView
    local my_ro = vb.views["rotary1"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#02",
  invoke = function(midi_message)
    ---@type RotaryView
    local my_ro = vb.views["rotary2"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#03",
  invoke = function(midi_message)
    ---@type RotaryView
    local my_ro = vb.views["rotary3"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#04",
  invoke = function(midi_message)
    ---@type RotaryView
    local my_ro = vb.views["rotary4"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#05",
  invoke = function(midi_message)
    ---@type RotaryView
    local my_ro = vb.views["rotary5"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

renoise.tool():add_midi_mapping {
  name = "Tools:Roto:Rotary_#06",
  invoke = function(midi_message)
    ---@type RotaryView
    local my_ro = vb.views["rotary6"]
    --print(my_ro)
    my_ro.value = midi_message.int_value
  end
}

Dialog_content = vb:column {
    margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
    views = {
      vb:row {
        views = {
          vb: column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_view1
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

            views = {
              --vb:text { text = "Column 1 Item 1" },
                  vb:button {
                    style = "rounded",
                    height = 30,
                    --color = {0xFF, 0xA5, 0x00},
                    secondary_color = {0x00, 0x00, 0x00},

                    width = 80,
                    
                  id = "bt",
            text = "Start",
            tooltip = "Start Roto!",
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
                  my_button.tooltip = "Start Roto!"
                  --my_button.color = { 82, 36, 17} 
              else
                renoise.song().transport.playing = true
                -- Add a timer that calls 'my_timer_function' every 100 milliseconds
                if not renoise.tool():has_timer(my_timer_function) then
                    renoise.tool():add_timer(my_timer_function, 100)
                end
                --renoise.tool():add_timer(my_timer_function, 1000) 
                my_button.text = "Stop"
                my_button.tooltip = "Stop Roto!"
                --my_button.color = { 0xFF, 0x00, 0x00 } -- Red in RGB (0-255)
                --my_button.color = { 82, 36, 17} -- Renoise Orange RGB
              end
            end
          }
            }
          },
          vb:column {
            style = "body"
          },
          vb:column {
            --width = 244,
            --margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            --spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            vb:text {
              text = "When Roto is running, set the knob to 0\nto clear all sequences in a track.",
            },

          }
        }
      }
    }
}

function GetNoteRoot()
  return nkv
end
