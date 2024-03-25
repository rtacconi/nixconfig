{ 
  config, pkgs, lib, ... 
}: 

{
  home.stateVersion = "22.11";
  home.username = "rtacconi";
  home.homeDirectory = "/Users/riccardotacconi";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bazelisk
    postgresql_15
    kind
    yq
    ruby_3_1
    cachix
    gnumake
    cmake
    (import (fetchTarball https://install.devenv.sh/latest)).default
    nmap
    scala_2_12
    spark
    rustup
    kubectl
    coreutils-full
    expect
    vlang
    direnv
    jq
    htop
    bat
    httpie
    unixtools.watch
    sops
    iperf
    awscli2
    ack
    actionlint
    tflint
    terraform-docs
    tree
    dbmate
    leiningen
    shellcheck
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./home/extraConfig.vim;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
    ];
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "emacs";
    history.extended = true;
    initExtra = ''
      ${builtins.readFile ./home/post-compinit.zsh}
      ${builtins.readFile ./home/shell-aliases.zsh}
    '';
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.3";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "rtacconi";
    userEmail = "rtacconi@gmail.com";
  };

}
