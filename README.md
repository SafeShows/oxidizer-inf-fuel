# Infinite Fuel

A [Kitten Space Agency](https://ksa.ahwoo.com) mod, run by [Oxidizer](https://github.com/SafeShows/Oxidizer), that
keeps the controlled vehicle's tanks full, even while the engines burn.

**Mods > Infinite Fuel** turns it on and off (a check mark shows while it is on). The setting is remembered. It starts off.

## Install

Install Oxidizer (as `Oxidizer.StarMap` or standalone, see
[Oxidizer's install steps](https://github.com/SafeShows/Oxidizer#install)), then unzip `inf_fuel-X.Y.Z.zip` from
the releases into the game's mods folder, so there is a `mods/inf_fuel/` folder. Mod managers such as Borea do
this for you.

## Limits

- Only the vehicle you control is refilled.
- Every tank is refilled, not only propellant: life support gases too.

## How it works

Vehicle physics runs on worker threads and writes its tank states back each frame, so a refill made in `frame()`
is overwritten while engines burn. The mod refills in a postfix on `KSA.Universe.ApplyVehicleSolvers`, right after
that write-back, with the game's own `ResourceManager.RefillAllTanks`.

## Release

Push a tag (`git tag v1.0.0 && git push origin v1.0.0`): the workflow publishes `inf_fuel-1.0.0.zip`.
To list it in the [KSA content index](https://github.com/KSAModding/content-index), fill in
`index-listing.example.toml` and follow the template's steps.
