{pkgs, ...}: {

  # nix自体の設定
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
  services.nix-daemon.enable = true;

  # システムの設定（nix-darwinが効いているかのテスト）
  system = {
    stateVersion = 5; # 必要そう。。。
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };
    };
  };

  # homebrewの設定
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # !! 注意 !!
      cleanup = "uninstall";
    };
    taps = [
      "siketyan/mozc"
    ];
    # brews = [];
    casks = [
      {
        name = "1password";
        greedy = true;
      }
      {
        name = "1password-cli";
        greedy = true;
      }
      {
        name = "google-chrome";
        greedy = true;
      }
      {
        name = "notion-calendar";
        greedy = true;
      }
      {
        name = "amazon-q";
        greedy = true;
      }
      {
        name = "mozc";
        greedy = true;
      }
      {
        name = "mozc@pre";
        greedy = true;
      }
      {
        name = "alt-tab";
        greedy = true;
      }
      {
        name = "raycast";
        greedy = true;
      }
      {
        name = "slack";
        greedy = true;
      }
      {
        name = "hyper";
        greedy = true;
      }
      {
        name = "orbstack";
        greedy = true;
      }
      {
        name = "arc";
        greedy = true;
      }
      {
        name = "avast-security";
        greedy = true;
      }
      {
        name = "brave-browser";
        greedy = true;
      }
      {
        name = "clion";
        greedy = true;
      }
      {
        name = "datagrip";
        greedy = true;
      }
      {
        name = "deepl";
        greedy = true;
      }
      {
        name = "discord";
        greedy = true;
      }
      {
        name = "goland";
        greedy = true;
      }
      {
        name = "google-drive";
        greedy = true;
      }
      {
        name = "intellij-idea";
        greedy = true;
      }
      {
        name = "karabiner-elements";
        greedy = true;
      }
      {
        name = "kobo";
        greedy = true;
      }
      {
        name = "microsoft-auto-update";
        greedy = true;
      }
      {
        name = "microsoft-edge";
        greedy = true;
      }
      {
        name = "microsoft-excel";
        greedy = true;
      }
      {
        name = "microsoft-powerpoint";
        greedy = true;
      }
      {
        name = "microsoft-teams";
        greedy = true;
      }
      {
        name = "microsoft-word";
        greedy = true;
      }
      {
        name = "neat";
        greedy = true;
      }
      {
        name = "notion";
        greedy = true;
      }
      {
        name = "onedrive";
        greedy = true;
      }
      {
        name = "phpstorm";
        greedy = true;
      }
      {
        name = "raindropio";
        greedy = true;
      }
      {
        name = "skype";
        greedy = true;
      }
      {
        name = "soundsource";
        greedy = true;
      }
      {
        name = "switchresx";
        greedy = true;
      }
      {
        name = "tableplus";
        greedy = true;
      }
      {
        name = "telegram";
        greedy = true;
      }
      {
        name = "utm";
        greedy = true;
      }
      {
        name = "warp";
        greedy = true;
      }
      {
        name = "visual-studio-code";
        greedy = true;
      }
      {
        name = "whatsapp";
        greedy = true;
      }
      {
        name = "zoom";
        greedy = true;
      }
      {
        name = "alacritty";
        greedy = true;
      }
      {
        name = "tinkerwell";
        greedy = true;
      }
      {
        name = "gather";
        greedy = true;
      }
      {
        name = "logseq";
        greedy = true;
      }
      {
        name = "ghostty";
        greedy = true;
      }
     {
       name = "astah-professional";
       greedy = true;
     }
          {
       name = "libreoffice";
       greedy = true;
     }
    ];
    masApps = {
      LINE = 539883307;
      AudioSwitcher = 561712678;
      GarageBand = 682658836;
      iMovie = 408981434;
      Keynote = 409183694;
      MARKETSPEED = 946680495;
      Messenger = 1480068668;
      Numbers = 409203825;
      Pages = 409201541;
      "Unsplash Wallpapers" = 1284863847;
      Xcode = 497799835;
    };
  };
}
