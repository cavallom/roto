# Roto

Roto is a Renoise tool. It is a random note generator—unconstrained by musical scales or harmonic logic—that uses six tracks, each controlled by its own dedicated knob.

* [Roto](#roto)
    * [Note generation](#Note-generation)
        * [Package check](#package-check)
    * [Usage](#usage)
        * [isCodiceFiscale](#iscodicefiscale)
        * [isIBAN](#isiban)
        * [isPartitaIVA](#ispartitaiva)
        * [isTargaAuto](#istargaauto)
        * [isTargaMoto](#istargamoto)
    * [License](#license)

## Note generation

With each movement of the knob, the range for note randomization is narrowed; it begins from the note selected at the end of the rotation, extending one octave above and one octave below. From the resulting set of notes (including semitones), a note is chosen at random and written into the current step of the active sequence for the corresponding track.

```bash
npm i valitalor
```

### Package check

Just to check the success of the installation, also returns basic package information.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
|  |  |  | No parameters are required |

```bash
const valita = require('valitalor');
console.log(valita.itWorks());

#output : { json } > {
#    "itWorks": "Yes, it works!",
#    "package": "valitalor",
#    "version": "1.0.3"
#}
```

## Usage

### isCodiceFiscale

Validation of the "Codice Fiscale" (individual TAX code) including verification of the control character.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
| codicefiscale | string | true | Codice Fiscale |

```bash
const valita = require('valitalor');
console.log(valita.isCodiceFiscale('<codicefiscale>'));

#output : bool > true | false
```

### isIBAN

Formal validation of the IBAN bank account code.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
| IBAN | string | true | IBAN |

```bash
const valita = require('valitalor');
console.log(valita.isIBAN('<IBAN>'));

#output : bool > true | false
```

### isPartitaIVA

Validation of the "Partita IVA" (VAT code) including verification of the control number.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
| partitIVA | string | true | "Partita IVA" (VAT code) |

```bash
const valita = require('valitalor');
console.log(valita.isPartitaIVA('<partitIVA>'));

#output : bool > true | false
```

### isTargaAuto

Formal validation of the car license plate number.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
| targa | string | true | Car license plate number |

```bash
const valita = require('valitalor');
console.log(valita.isTargaAuto('<targa>'));

#output : bool > true | false
```

### isTargaMoto

Formal validation of the motorcycle license plate number.

| Param | Type | Mandatory | Description |
| ----- | ---- | --------- | ----------- |
| targa | string | true | Motorcycle license plate number |

```bash
const valita = require('valitalor');
console.log(valita.isTargaMoto('<codicefiscale>'));

#output : bool > true | false
```

## License

[MIT](https://opensource.org/blog/license/mit)