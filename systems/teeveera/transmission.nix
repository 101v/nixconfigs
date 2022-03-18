{
  pkgs,
  config,
  ...
}: let
  teeveera = (import ../../shared.nix).teeveera;
  media = teeveera.media;
  incompleteDir = "${media.dir}/.transmission-incomplete";
in {
  services.transmission = {
    group = media.group;
    enable = true;
    settings = {
      rpc-port = teeveera.transmissionRPCPort;
      download-dir = media.dir;
      incomplete-dir-enabled = true;
      incomplete-dir = incompleteDir;
      upload-slots-per-torrent = 14;
      preallocation = 2;
      start-added-torrents = true;
      umask = media.mode.mask;
      cache-size-mb = 16;
      encryption = 2;
      peer-limit-global = 500;
      peer-limit-per-torrent = 500;
      peer-port-random-on-start = true;
      port-forwarding-enabled = true;
      download-queue-enabled = false;
    };
    performanceNetParameters = true;
  };
  system.activationScripts.transmission.text = ''
    mkdir -p ${incompleteDir}
    chown ${config.services.transmission.user}:root ${incompleteDir}
    chmod ${toString media.mode.mode} ${incompleteDir}
  '';
}
