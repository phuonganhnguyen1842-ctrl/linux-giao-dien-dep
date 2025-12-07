{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.streamLayeredImage {
  name = "linux-webtop";
  tag = "latest";

  contents = [ ];

  config = {
    Image = "linuxserver/webtop:latest";

    HostConfig = {
      ShmSize = 1073741824; # 1GB

      PortBindings = {
        "3000/tcp" = [{
          HostPort = "8100";
        }];
      };

      RestartPolicy = {
        Name = "unless-stopped";
      };

      NanoCpus = 2000000000; # 2 CPU
      Memory = 107374182400; # 100GB
      MemoryReservation = 107374182400;
    };

    Env = [
      "PUID=1000"
      "PGID=1000"
      "TZ=Asia/Ho_Chi_Minh"
      "KEYBOARD=vi"
      "TITLE=Linux Webtop"
    ];
  };
}
