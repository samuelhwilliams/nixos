# NixOS
Nix configuration files and assorted accoutrements

## Setting up a machine
Follow instructions [here](https://nixos.org/nixos/manual/index.html#sec-installation).

When it comes to editing `configuration.nix` and/or `hardware-configuration.nix`:

* Clone this repository into `/etc/nixos` on the target disk.
* Create symlinks the `machines/<hostname>/{configuration,hardware-configuration}.nix` from this repository into `/etc/nixos` on the target disk, overwriting *if appropriate*. Consider hardware/filesystem changes carefully.

Finish the install with `nixos-install`.
