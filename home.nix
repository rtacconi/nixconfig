{ 
  config, pkgs, lib, ... 
}: 

{
#  home.stateVersion = "24.05";
  home.stateVersion = "24.05";
  home.username = "riccardotacconi";
  home.homeDirectory = "/Users/riccardotacconi";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    qemu
    fastfetch
    wget
    kubernetes-helm
    crane
    istioctl
    jre8_headless
    go
    talosctl
    freerdp
    python311Full
    python311Packages.ansible-core
    python311Packages.boto3
    python311Packages.botocore
    python311Packages.pip
    python311Packages.poetry-core
    ansible-lint
    neofetch
    tenv
    packer
    vscode
    tart
    tmux
    rio
    kind
    yq
    cachix
    gnumake
    devenv
    devbox
    cmake
    nmap
    rustup
    kubectl
    coreutils-full
    expect
    direnv
    jq
    htop
    bat
    zstd
    httpie
    unixtools.watch
    sops
    iperf
    awscli2
    ack
    tflint
    terraform-docs
    tree
    dbmate
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
    autosuggestion.enable = true;
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
    userEmail = "riccardo.tacconi@crystalblockchain.com";
  };
}
