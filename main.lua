_AUTO_RELOAD_DEBUG = true

local active = require "gui"


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

