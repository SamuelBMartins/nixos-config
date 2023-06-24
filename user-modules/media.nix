{ config, pkgs, ... }:

{

  programs.mpv = {
    enable = true;

    config = {
      profile = "gpu-hq";

      gpu-api = "vulkan";
      gpu-context = "x11vk";
      vo = "gpu";
      hwdec = "auto";
      fbo-format = "rgba16hf";

      # shaders
      glsl-shaders = [
        "${../dotfiles/mpv/shaders/FSRCNNX_x2_8-0-4-1_LineArt.glsl}"
        "${../dotfiles/mpv/shaders/SSimDownscaler.glsl}"
        "${../dotfiles/mpv/shaders/KrigBilateral.glsl}"
      ];
      scale = "ewa_lanczossharp";

      dscale = "mitchell";
      linear-downscaling = "no";
      correct-downscaling = "yes";

      cscale = "mitchell";

      # Antiring
      scale-antiring = 0.7;
      dscale-antiring = 0.7;
      cscale-antiring = 0.7;

      # Debanding
      deband = "yes";
      deband-iterations = 4;
      deband-threshold = 35;
      deband-range = 16;
      deband-grain = 4;

      # General
      keep-open = "yes";
      snap-window = "yes";          # Snap to corners on Windows
      cursor-autohide = 1000;
      save-position-on-quit = true; # Remember position when closing the player
      osd-bar = "no";               # No huge box on screen when turning the volume
      osd-font-size = 32;
      volume = 100;
      volume-max = 100;
      audio-exclusive = "no";       # A hotkey for this inside input.conf (k cycle audio-exclusive)

      # Language & subtitles
      alang = "jp,jpn,ja,en,eng"; # Language priority for audio
      slang = "jp,jpn,ja,en,eng"; # Language priority for subtitles
      sub-auto = "fuzzy";
      sub-font = "Arial";
      sub-font-size = 40;
      sub-border-size = 1;
      sub-shadow-color = "0.0/0.0/0.0/0.50";
      sub-shadow-offset = 2;

      ###### High-quality screenshots
      screenshot-format = "webp";
      screenshot-webp-lossless = "yes";
      screenshot-high-bit-depth = "yes";
      screenshot-sw = "no";
      screenshot-directory = "~~/screenshots";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
    };
  };

  home.packages = with pkgs; [
    plex-media-player
    jellyfin-web
    spotify
    plex-mpv-shim
    jellyfin-mpv-shim
  ];


}
