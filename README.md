# FlyEnv Linux (Ubuntu) Settings
setting the switch version on linux using fish shell


composer :
-- install composer on flyenv
-- sudo rm /usr/local/bin/composer (if already exist)
-- sudo ln -s /home/ernest/.config/FlyEnv/app/composer-2.8.11/composer /usr/local/bin/composer
-- sudo ln -s /home/ernest/.config/FlyEnv/app/composer-2.8.11/composer /usr/local/bin/composer

apache : 
-- install apache using FlyEnv
-- nano /home/ernest/.config/FlyEnv/server/apache/common/conf/0989a3571b2b9005f7b5dd4ac3689685.conf 
-- the content its like this :
#FlyEnv-Apache-Listen-Begin#
Listen 80
Listen 443
User ernest
Group ernest
#FlyEnv-Apache-Listen-End#
Mutex posixsem default
#
# This is the main Apache HTTP server configuration file.  It contains the
# configuration directives that give the server its instructions.
# See <URL:http://httpd.apache.org/docs/2.4/> for detailed information.

-- serach the tex like this : User _www , Group _www
-- change to User www-data , Group www-data => save (if there a some error about restriction or somethink when start apache, just ignore it)
-- nano .config/fish/config.fish
#can access project in /home/project
umask 027
-- start apache again

php switch static and homebrew :
-- add default path to .config/fish/config.fish
-- # Default to FlyEnv PHP 8.3.25
-- set PATH $HOME/.config/FlyEnv/app/static-php-8.3.25/bin $PATH
-- then use source .config/fish/config.fish
-- restart terminal
-- nano ~/.config/fish/functions/use-php.fish
the content is :

function use-php
    set -l source $argv[1]
    set -l phpver $argv[2]

    # Reset PATH dulu biar bersih
    set PATH /usr/local/bin /usr/bin /bin

    if test "$source" = "flyenv"
        set PATH $HOME/.config/FlyEnv/app/static-php-$phpver/bin $PATH
        echo "✅ Switched to PHP $phpver via FlyEnv"
    else if test "$source" = "brew"
        set PATH /home/linuxbrew/.linuxbrew/Cellar/php@$phpver/$phpver/bin $PATH
        echo "✅ Switched to PHP $phpver via Homebrew"
    else
        echo "❌ Unknown source: $source"
        echo "Usage: use-php flyenv 8.3.25 or use-php brew 7.4.33_9"
    end
end

-- then save and exit 
-- restart terminal
-- then choose env version on GUI FlyEnv
-- on  terminal "use-php flyenv 8.3.25" or " use-php brew 7.4.33_9 "

NodeJS
-- nano ~/.config/fish/functions/use-node.fish
-- the content is :

function use-node
    set -l nodever $argv[1]
    set PATH $HOME/.config/FlyEnv/app/nodejs/v$nodever/bin /usr/local/bin /usr/>
    echo "Switched to Node v$nodever via FlyEnv"
end

-- save and exit
-- source ~/.config/fish/config.fish 
-- restart terminal
-- how to switch using GUI FlyEnv or  using on terminal " use-node 24.5.0 "






