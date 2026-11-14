# Roto

Roto is a Renoise tool. It is a random note generator—unconstrained by musical scales or harmonic logic—that uses six tracks, each controlled by its own dedicated knob.

* [Roto](#roto)
    * [Load Roto Tool](#Load-Roto-Tool)
    * [Activation](#Activation)
    * [Note generation](#Note-generation)
        * [Volume](#Volume)
        * [Pan](#Pan)
        * [Delay](#Delay)                
    * [Clean sequence](#Clean-sequence)
    * [MIDI map](#MIDI-map)
    * [License](#license)

## Load Roto Tool
The Roto tool can be launched by selecting the Tools/Roto menu item within the Renoise application.
The corresponding track managed by Roto is created automatically, if it does not already exist, the first time Roto is launched.

## Activation

The generation and writing of notes is triggered only if playback is initiated using the [Start] button in the Roto tool.

## Note generation

With each movement of the knob, the range for note randomization is narrowed; it begins from the note selected at the end of the rotation, extending one octave above and one octave below. From the resulting set of notes (including semitones), a note is chosen at random and written into the current step of the active sequence for the corresponding track.

### Volume

If enabled the [*vol] checkbox, this adds a random value for the volume to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the volume column is displayed in the track.

### Pan

If enabled the [*pan] checkbox, this adds a random value for the panning to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the panning column is displayed in the track.

### Delay

If enabled the [*dly] checkbox, this adds a random value for the delay to the note generated and written in the current sequence. Enabling or disabling this feature determines whether or not the delay column is displayed in the track.

## Clean Sequence

When Roto is running, set the knob to 0 to clear all sequences in a track.

## MIDI map
Knob can be mapped to a MIDI controller for greater versatility and expressiveness of the Roto tool.

## License

[MIT](https://opensource.org/blog/license/mit)