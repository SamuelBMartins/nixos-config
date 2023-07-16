{ config, lib, systemConfig, ... }:

lib.mkIf systemConfig.services.xserver.enable {
  programs.librewolf = {
    enable = true;
    
    settings = {
      "identity.fxaccounts.enabled" = true;

      "clipboard.autocopy" = false;
      "middlemouse.paste" = false;
      "general.autoScroll" = true;

      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.sessions" = false;
      "privacy.clearOnShutdown.cache" = false;
      "privacy.clearOnShutdown.offlineApps" = false;

      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "general.useragent.override" = "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0";
      "network.http.referer.XOriginPolicy" = 0;

      "browser.toolbars.bookmarks.visibility" = "always";
      "browser.urlbar.update2.engineAliasRefresh" = true;
    };
  };
}
