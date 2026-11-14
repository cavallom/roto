# Roto

Roto is a Renoise tool. It is a random note generator—unconstrained by musical scales or harmonic logic—that uses six tracks, each controlled by its own dedicated knob.

* [Roto](#roto)
    * [Load Roto Tool](#Load-Roto-Tool)
    * [Activation](#Activation)
    * [Note generation](#Note-generation)
        * [Package check](#package-check)
    * [Usage](#usage)
        * [isCodiceFiscale](#iscodicefiscale)
        * [isIBAN](#isiban)
        * [isPartitaIVA](#ispartitaiva)
        * [isTargaAuto](#istargaauto)
        * [isTargaMoto](#istargamoto)
    * [License](#license)

## Load Roto Tool
The Roto tool can be launched by selecting the Tools/Roto menu item within the Renoise application.
The corresponding track managed by Roto is created automatically, if it does not already exist, the first time Roto is launched.

## Activation

The generation and writing of notes is triggered only if playback is initiated using the [Start] button in the Roto tool.

## Note generation

With each movement of the knob, the range for note randomization is narrowed; it begins from the note selected at the end of the rotation, extending one octave above and one octave below. From the resulting set of notes (including semitones), a note is chosen at random and written into the current step of the active sequence for the corresponding track.

## License

[MIT](https://opensource.org/blog/license/mit)