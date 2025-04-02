# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    if set -q __zoxide_loop
        builtin echo "zoxide: infinite loop detected"
        builtin echo "Avoid aliasing `cd` to `z` directly, use `zoxide init --cmd=cd fish` instead"
        return 1
    end

    # A copy of fish's internal cd function. This makes it possible to use
    # `alias cd=z` without causing an infinite loop.
    if ! builtin functions --query __zoxide_cd_internal
        string replace --regex -- '^function cd\s' 'function __zoxide_cd_internal ' <$__fish_data_dir/functions/cd.fish | source
    end

    __zoxide_loop=1 __zoxide_cd_internal $argv
end