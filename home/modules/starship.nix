with builtins;
  instance: {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = let
        pink = "#FFC0CB";
        vertical = "[║](${pink})";
        sep = "sep";
      in {
        add_newline = false;
        ## https://starship.rs/config/#prompt
        format = concatStringsSep "" [
          "\n"
          "[╓](bold ${pink})"
          "$fill"
          "\n"
          vertical
          "$username"
          "$hostname"
          "$kubernetes"
          "$vcsh"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_metrics"
          "$git_status"
          "$hg_branch"
          "$docker_context"
          "$package"
          "$cmake"
          "$dart"
          "$deno"
          "$dotnet"
          "$elixir"
          "$elm"
          "$erlang"
          "$golang"
          "$helm"
          "$java"
          "$julia"
          "$kotlin"
          "$nim"
          "$nodejs"
          "$ocaml"
          "$perl"
          "$php"
          "$purescript"
          "$python"
          "$red"
          "$ruby"
          "$rust"
          "$scala"
          "$swift"
          "$terraform"
          "$vlang"
          "$vagrant"
          "$zig"
          "$nix_shell"
          "\${custom.mob}"
          "$conda"
          "$memory_usage"
          "$aws"
          "$gcloud"
          "$openstack"
          "$env_var"
          "$crystal"
          "$cmd_duration"
          "$lua"
          "$jobs"
          "$battery"
          "\n"
          vertical
          "$directory"
          "\n"
          vertical
          "$status"
          "[ $shell](bold ${pink})"
          "$shlvl"
          "$character"
        ];
        fill = {
          symbol = "─";
          style = "bold ${pink}";
        };
        directory = {
          truncation_length = 0;
          format = "[ : $path]($style)[$read_only]($read_only_style) ";
        };
        shell.disabled = false;
        shlvl = {
          disabled = false;
          threshold = 2;
          style = "bold red";
          symbol = "";
        };
        status = {
          disabled = false;
          symbol = " ";
        };
        username = {
          show_always = true;
          format = "[  $user]($style) ";
        };
        git_branch = {format = "[$symbol$branch]($style) ";};
        nix_shell = {
          format = "via [$symbol$state]($style) ";
        };
        custom.mob = {
          command = "echo $MOB_TIMER_ROOM";
          format = "[ ($output)]($style) ";
          when = "[[ -v MOB_TIMER_ROOM ]]";
        };

        # https://starship.rs/presets/#nerd-font-symbols
        aws.symbol = " ";
        conda.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " ";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        git_branch.symbol = " ";
        golang.symbol = " ";
        hg_branch.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        memory_usage.symbol = " ";
        nim.symbol = " ";
        nix_shell.symbol = " ";
        package.symbol = " ";
        perl.symbol = " ";
        php.symbol = " ";
        python.symbol = " ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        swift.symbol = "ﯣ ";
        #
      };
    };
  }
