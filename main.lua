_AUTO_RELOAD_DEBUG = true

--local musicutil = require ("lib/musicutil")
--local notesutil = require ("lib/notesutil")
--local gutils = require ("lib/gutils")
--local patternbuilder = require ("lib/patternbuilder")

local active = require "gui"
--print(active)
         
--local scalename = "major"

--local scaleTest = musicutil.generate_scale_of_length(0, scalename, 8)
--[[ if scaleTest then
  print("Scale Test: ", table.concat(scaleTest, ", "))
else
  print("Scale generation failed")
end ]]

--[[ local curScala = notesutil.get_scale("bebop tonic minor")
if curScala then
  print("Current Scale: ", table.concat(curScala, ", "))
else
  print("Scale retrieval failed")
end ]]
-- print(notesutil.test())

--[[ local beats = gutils.create_range(0, 63)
local shuffled_beats = gutils.shuffle(beats)
local slice_beats = gutils.nslice(shuffled_beats, 8)
print("Shuffled Beats: ", table.concat(shuffled_beats, ", ")) 
print("Slice Beats: ", table.concat(slice_beats, ", ")) ]]

function randomDo(note_root, icol)
  --print(icol)
  --print("Note root: " .. note_root)
  local song = renoise.song()
  local transport = song and song.transport
  local playback_pos = transport and transport.playback_pos
  if not playback_pos then
    print("Playback position is unavailable")
    return
  end
  local current_line = playback_pos.line
  --print(current_line)

  local cur_playback_pos = renoise.song().transport.playback_pos
  local pattern = song and song.patterns and song.patterns[cur_playback_pos.sequence]
  local curpatterns = song and song.patterns
  
  if not pattern then
    print("Pattern 1 is unavailable")
    return
  end

  local nl = pattern.number_of_lines
  --print(nl)

    --local curScale = GetSelectedScale()

     --scaleTest = musicutil.generate_scale_of_length(0, curScale, 8)

     --print("Scale Test: ", table.concat(scaleTest ", "))
          -- Method C: Using the nested table structure
    local track = pattern.tracks and pattern.tracks[icol]
    local line = track and track.lines and playback_pos and track.lines[playback_pos.line +1 or 1]
    local note_col = line and line.note_columns and line.note_columns[1]

        if note_col == nil then
      --print("First note column is unavailable")
      return
    end

    if note_root > 0 then
      pattern.tracks[icol]:clear()





    
    -- Set the note value (e.g., 60 for C-4)
    local n_min = note_root - 12
    if n_min < 30 then n_min = 30 end
    
    local n_max = note_root + 12
    if n_max > 100 then n_max = 100 end
    math.randomseed(note_root)
    local num = math.random(n_min, n_max)   
    math.randomseed(num)
    local vol = math.random(0, 127)
    math.randomseed(vol)
    local pan = math.random(0, 127) 
    math.randomseed(pan)
    local delay = math.random(0, 127) 
    math.randomseed(delay)
    local fx = math.random(0, 127) 
    --print("volume: " .. vol)
   --print("Scale: ", table.concat(GetSelectedScaleNotes() ", "))

--[[ local myArray = GetSelectedScaleNotes()
local randomIndex = math.random(#myArray)
local randomItem = #myArray[randomIndex]    ]]

    note_col.note_value = num
    
    -- Set the instrument (optional, defaults to selected)
    note_col.instrument_value = icol-1
    
    -- Set volume (optional, 0-127 or 0x00-0x7F)

    if Rvtget(icol) == true then
      note_col.volume_value = vol
    end
    if Rptget(icol) == true then
      note_col.panning_value = pan
    end
    if Rdtget(icol) == true then
      note_col.delay_value = delay
    end
--[[     note_col.effect_number_value = 1
    note_col.effect_amount_value = fx ]]

    --line.effect_columns[1].number_string = "0G"
--line.effect_columns[1].amount_string = "20" -- Hex value for speed 48
    
    -- print(note_col)
--[[     if song and song.transport then
      song.transport.playback_pos_beats = 0
    end ]]
    -- song.transport.playing = true 
    
    --local t2 = patternbuilder.scalewriter(curScala, slice_beats, 1, 2, 1, 2, 127)
    
    else
      for i = #song.sequencer.pattern_sequence, 1, -1 do
        curpatterns[i].tracks[icol]:clear()
        note_col.note_value = 120 --!!!!!!!!!!!!
        -- s.sequencer:delete_sequence_at(i)
      end
    end
    


end
  
function helloWorld()
    print("Hello, World!")
end




-- Define the function to execute when a song loads
local function on_song_loaded()
    -- Access renoise.song() safely here
    --print("Song loaded: " .. renoise.song().file_name)
    --renoise.song().tracks[1].name = "Roto"
    -- Your tool logic here
    renoise.song().transport.playing_observable:add_notifier(function()
  if renoise.song().transport.playing then
    randomDo(GetNoteRoot())
    --print("Playback started")
  else
    --print("Playback stopped")
    --helloWorld()
  end
end)
end

if active then
-- Attach the function to the observable
renoise.tool().app_new_document_observable:add_notifier(on_song_loaded)      
-- Call the function to execute it
-- helloWorld()
end

local function track_exists_by_name(name)
  local song = renoise.song()
  for _, track in ipairs(song.tracks) do
    if track.name == name then
      return true, track
    end
  end
  return false, nil
end

local function show_roto_dialog()
  --print('show_roto_dialog')
  -- To display, use:
renoise.app():show_custom_dialog("Roto - Performance Controller", Dialog_content)

local song = renoise.song()

  local exists, track_obj = track_exists_by_name("Roto - Performance Tracks")

for i = 1, 6 do
  if exists then
    --print("Track found: " .. track_obj.name)
  else
    --print("Track not found")
      song:insert_track_at(i) -- Insert at top
  --local trackpos = s
  local new_track = song:track(i)
  new_track.name = "Instrument #0" .. i-1
  --new_track.visible_note_columns = 4   
  end
end

if exists then
  --print("Track found: " .. track_obj.name)
else
  song:insert_group_at(1)
  song:track(1).name = "Roto - Performance Tracks"
  -- Assign tracks to the group
  song:add_track_to_group(2, 1)
  song:add_track_to_group(3, 2)
  song:add_track_to_group(4, 3)
  song:add_track_to_group(5, 4)
  song:add_track_to_group(6, 5)
  song:add_track_to_group(7, 6)
end





--renoise.song().tracks[1].name = "Roto #1"
end
-- Register menu entry
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Roto",
  invoke = show_roto_dialog
}

