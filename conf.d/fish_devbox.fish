function __devbox_shell_activate --on-variable PWD
    if status --is-command-substitution
        return
    end
    if not test -e "$PWD/devbox.json"
        if not string match -q "$__devbox_fish_initial_pwd"/'*' "$PWD/"
            set -U __devbox_fish_final_pwd "$PWD"
            exit
        end
        return
    end

    if not test -n "$DEVBOX_SHELL_ENABLED"
        if devbox version >/dev/null 2>&1
        set -x __devbox_fish_initial_pwd "$PWD"

        devbox shell

        set -e __devbox_fish_initial_pwd
        if test -n "$__devbox_fish_final_pwd"
            cd "$__devbox_fish_final_pwd"
            set -e __devbox_fish_final_pwd
        end
        end
    end
end

