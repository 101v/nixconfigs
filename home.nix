with builtins; { config, pkgs, options, ... }:

let
  homeDirectory = toString /home/mightyiam;
in {
  imports = [
    (import ./unfree.nix)
    (import ./packages.nix)
    (import ./merely-enabled.nix)
    (import ./xdg-mime.nix)
    (import ./xdg-user-dirs.nix)
    (import ./fontconfig.nix)
    (import ./accounts.nix)
    (import ./zsh)
    (import ./tmux.nix)
    (import ./alacritty.nix)
    (import ./atuin.nix)
    (import ./firefox.nix)
    (import ./chromium.nix)
    (import ./neovim)
    (import ./vscodium.nix)
    (import ./gh.nix)
    (import ./ssh.nix)
    (import ./starship.nix)
    (import ./git.nix)
    (import ./bottom.nix)
    (import ./wlsunset.nix)
    (import ./exa.nix)
    (import ./sway)
    (import ./udiskie.nix)
    (import ./obs-studio.nix)
  ];

  programs.home-manager = {
    enable = true;
    path = toString homeDirectory + "/src/home-manager";
  };

  home = {
    username = "mightyiam";
    inherit homeDirectory;
    stateVersion = "21.05";
  };
}

