source $HOME/.config/bash/alias
source $HOME/.config/bash/conf


# Load Angular CLI autocompletion.
source <(ng completion script)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sunless/desires/google-cloud-sdk/path.bash.inc' ]; then . '/home/sunless/desires/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sunless/desires/google-cloud-sdk/completion.bash.inc' ]; then . '/home/sunless/desires/google-cloud-sdk/completion.bash.inc'; fi
