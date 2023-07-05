{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ 
    teams
    zoom-us
    slack
  ];
}
