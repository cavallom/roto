local pkv = { 0, 0, 0, 0, 0, 0 }
local nkv = { 0, 0, 0, 0, 0, 0 }

local rv = { true, true, true, true, true, true }
local rp = { false, false, false, false, false, false }
local rd = { false, false, false, false, false, false }


function EvoSongGet()
  return renoise.song()
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

  for i = 1, 6 do
    if pkv[i] ~= nkv[i] then
      pkv[i] = nkv[i]

      randomDo(nkv[i], i)
    end
  end

end

local vb = renoise.ViewBuilder()

local rotooption = renoise.Document.create("RotoToolPreferences") {
  valknobs = { 0, 0, 0, 0, 0, 0 }
}

local rotary_views = {}

for i = 1, 6 do
    local rotary_view = vb:rotary {
    id = "rotary" .. tostring(i),
    tooltip="Instrument #0" .. i .. " notes generator controller.\n\nWhen Roto is running generates and plays random notes based on the knob position and writes the last generated note into the current sequence of the pattern, deleting the previous one.\nSet the knob to 0 to clear all sequences in a track.\nThe corresponding track managed by Roto is created automatically, if it does not already exist, the first time Roto is launched.\nKnob can be mapped to a MIDI controller for greater versatility and expressiveness of the Roto tool.",
      bind = rotooption["valknobs[".. tostring(i) .. "]"],
      notifier = function(value)
        nkv[i] = value
      end,
      min = 0,
      max = 127,
      midi_mapping = "Tools:Roto:Rotary_#0" .. tostring(i)
    }
    renoise.tool():add_midi_mapping {
      name = "Tools:Roto:Rotary_#0" .. tostring(i),
      invoke = function(midi_message)
        ---@class RotaryView
        ---@field value number
        ---@type RotaryView
        local my_ro = vb.views["rotary".. tostring(i)]
        my_ro.value = midi_message.int_value
      end
    }
    table.insert(rotary_views, rotary_view)
end

Dialog_content = vb:column {
    margin = renoise.ViewBuilder.DEFAULT_DIALOG_MARGIN,
    views = {
      vb:row {
        views = {
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[1]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#00", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv1",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
                  value = Rvtget(1),
                  notifier = function(value)
                    Rvtset(1, value)
                  end
                },
                vb:text { text = "*vol" }
              },
              vb:row {
                id = "rp1",
                vb:checkbox {
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
                  value = Rptget(1),
                  notifier = function(value)
                    Rptset(1, value)
                  end
                },
                vb:text { text = "*pan" }
              },       
              vb:row {
                id = "rd1",
                vb:checkbox {
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[2]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#01", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv2",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[3]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#02", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv3",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[4]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#03", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv4",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[5]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#04", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv5",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
          vb:column {
            style = "group", -- Applies rounded corners
            margin = renoise.ViewBuilder.DEFAULT_CONTROL_MARGIN,
            spacing = renoise.ViewBuilder.DEFAULT_CONTROL_SPACING,
            views = {
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                rotary_views[6]
              },
              vb:horizontal_aligner {
                mode = "center",
                width = "100%",
                vb:text { text = "#05", align = "center", tooltip = "Instrument index" }
              },
              vb:row {
                id = "rv6",
                vb:checkbox {
                  tooltip = "If enabled, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random panning value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.",
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
                  tooltip = "When enabled, this adds a random delay value to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.",
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
            style = "body",
          }
        }
      },
      vb:row {
        views = {
          vb:column {

            style = "body",

            views = {
                  vb:button {
                    style = "rounded",
                    height = 30,
                    --color = {0xFF, 0xA5, 0x00},
                    secondary_color = {0x00, 0x00, 0x00},

                    width = 80,
                    
                  id = "bt",
            text = "Start",
            tooltip = "The generation and writing of notes is triggered only if playback is initiated using the\n[Start] button in the Roto tool.",
            notifier = function()
              
              ---@class my_button : renoise.Views.View
              ---@field text string
              ---@field tooltip string
              local my_button = vb.views.bt
              
              if renoise.song().transport.playing == true then
                  renoise.song().transport.playing = false
                  if renoise.tool():has_timer(my_timer_function) then
                      renoise.tool():remove_timer(my_timer_function)
                  end

                  my_button.text = "Start"
                  my_button.tooltip = "The generation and writing of notes is triggered only if playback is initiated using the\n[Start] button in the Roto tool."
                  --my_button.color = { 82, 36, 17} 
              else
                renoise.song().transport.playing = true
                
                if not renoise.tool():has_timer(my_timer_function) then
                    renoise.tool():add_timer(my_timer_function, 100)
                end

                my_button.text = "Stop"
                my_button.tooltip = "The generation and writing of notes is triggered only if playback is initiated using the\n[Start] button in the Roto tool."

              end
            end
          }
            }
          },
          vb:column {
            style = "body"
          },
          vb:column {
            vb:text {
              visible = false,
              text = "When Roto is running, set the knob to 0\nto clear all sequences in a track.",
            },

          }
        }
      }
    }
}
