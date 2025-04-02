if not status is-interactive
    exit
end

# Initialize hook to add new entries to the database.
__zoxide_hook &>/dev/null