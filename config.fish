// config.fish
                      
oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#can access project in /home/project for apache with "user www-data, group www-data"
umask 027

# Default to FlyEnv PHP 8.3.25
set PATH $HOME/.config/FlyEnv/app/static-php-8.3.25/bin $PATH

set -l phpdir (readlink -f ~/.config/FlyEnv/env/php)
set PATH $phpdir/bin $PATH

# Created by `pipx` on 2025-09-06 03:54:09
set PATH $PATH /home/ernest/.local/bin

# Android SDK environment setup
set -x ANDROID_HOME $HOME/Android/Sdk
set -x PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin >
