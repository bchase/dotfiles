if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.xmodmap ]; then
    xmodmap ~/.xmodmap
fi
 
# if [ -f ~/.Xmodmap ]; then
#     xmodmap ~/.Xmodmap
# fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /home/bosco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/bosco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
