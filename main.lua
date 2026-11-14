_AUTO_RELOAD_DEBUG = true

local active = require "gui"

function randomDo(note_root, icol)
  local song = renoise.song()
  local transport = song and song.transport
  local playback_pos = transport and transport.playback_pos

  if not playback_pos then
    print("Playback position is unavailable")
    return
  end

  local cur_playback_pos = renoise.song().transport.playback_pos
  local pattern = song and song.patterns and song.patterns[cur_playback_pos.sequence]
  local curpatterns = song and song.patterns
  
  if not pattern then
    print("Pattern 1 is unavailable")
    return
  end

  local track = pattern.tracks and pattern.tracks[icol]
  local line = track and track.lines and playback_pos and track.lines[playback_pos.line +1 or 1]
  local note_col = line and line.note_columns and line.note_columns[1]

  if note_col == nil then
    --print("First note column is unavailable")
    return
  end

  if note_root > 0 then

    pattern.tracks[icol]:clear()
  
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

    -- math.randomseed(delay)
    -- local fx = math.random(0, 127) 

    note_col.note_value = num
    
    note_col.instrument_value = icol-1

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
    local sequence = song and song.sequencer and song.sequencer.pattern_sequence
    if sequence then
      for i = #sequence, 1, -1 do
        local current_pattern = curpatterns and curpatterns[i]
        if current_pattern and current_pattern.tracks then
          local current_track = current_pattern.tracks[icol]
          if current_track then
            current_track:clear()
          end
        end
        if note_col then
          note_col.note_value = 120
        end
        -- 
      end
    end
  end

end

local function on_song_loaded()
  local song = renoise.song()
  local transport = song and song.transport

  if not transport then
    return
  end

  transport.playing_observable:add_notifier(function()
    local current_song = renoise.song()
    local current_transport = current_song and current_song.transport

    if current_transport and current_transport.playing then
      --print("Playback started")
    else
      --print("Playback stopped")
    end
  end)
end

if active then
  -- Attach the function to the observable
  renoise.tool().app_new_document_observable:add_notifier(on_song_loaded)      
  -- Call the function to execute it
end

local function track_exists_by_name(name)
  local song = renoise.song()
  if not song or not song.tracks then
    return false, nil
  end
  for _, track in ipairs(song.tracks) do
    if track.name == name then
      return true, track
    end
  end
  return false, nil
end

local function show_roto_dialog()
  local song = renoise.song()
  renoise.app():show_custom_dialog("Roto", Dialog_content)

  if not song then
    return
  end

  local exists, track_obj = track_exists_by_name("Roto")

  for i = 1, 6 do
    if exists then
      --print("Track found: " .. track_obj.name)
    else
      --print("Track not found")
        song:insert_track_at(i) -- Insert at top
    --local trackpos = s
    local new_track = song:track(i)
    if new_track then
      new_track.name = "Instrument #0" .. i-1
    end
    --new_track.visible_note_columns = 4   
    end
  end

  if exists then
    --print("Track found: " .. track_obj.name)
  else
    song:insert_group_at(1)
    local group_track = song:track(1)
    if group_track then
      group_track.name = "Roto"
    end
    -- Assign tracks to the group
    song:add_track_to_group(2, 1)
    song:add_track_to_group(3, 2)
    song:add_track_to_group(4, 3)
    song:add_track_to_group(5, 4)
    song:add_track_to_group(6, 5)
    song:add_track_to_group(7, 6)
  end

end

-- Register menu entry
renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Roto",
  invoke = show_roto_dialog
}

