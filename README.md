# 🐧 FlyEnv Linux (Ubuntu) Settings

> Dokumentasi setup Composer, Apache, PHP, dan Node.js menggunakan Fish shell di lingkungan FlyEnv.

---

## 🎼 Composer Setup

```bash
# Hapus symlink global jika sudah ada
sudo rm /usr/local/bin/composer

# Buat symlink ke Composer versi FlyEnv
sudo ln -s /home/ernest/.config/FlyEnv/app/composer-2.8.11/composer /usr/local/bin/composer

# Pastikan file bisa dieksekusi
chmod +x /home/ernest/.config/FlyEnv/app/composer-2.8.11/composer
```

# Apache Setup

```bash
# Edit konfigurasi Apache FlyEnv
nano /home/ernest/.config/FlyEnv/server/apache/common/conf/0989a3571b2b9005f7b5dd4ac3689685.conf
```bash
configuraion file example that must edited
```bash
#FlyEnv-Apache-Listen-Begin#
Listen 80
Listen 443
User ernest
Group ernest
#FlyEnv-Apache-Listen-End#

Mutex posixsem default
# Dokumentasi lengkap: http://httpd.apache.org/docs/2.4/
```
# Modification User/Group
```bash
User _www
Group _www

to

User www-data
Group www-data
```

🐟 Konfigurasi Fish Shell
```bash
# Tambahkan ke ~/.config/fish/config.fish
umask 027

# Restart Apache
flyenv apache restart or you can using GUI FlyEnv to restart apache
```

PHP Version Switching
🔧 PATH default
```bash
# ~/.config/fish/config.fish
set PATH $HOME/.config/FlyEnv/app/static-php-8.3.25/bin $PATH

# Reload konfigurasi
source ~/.config/fish/config.fish
# Restart terminal
```

🐟 Fungsi use-php
```bash

# ~/.config/fish/functions/use-php.fish

function use-php
    set -l source $argv[1]
    set -l phpver $argv[2]

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

```bash


# Switch PHP Version
```bash
use-php flyenv 8.3.25
use-php brew 7.4.33_9
```

NodeJS Version Switching
 🐟 Fungsi use-node
 ```bash
# ~/.config/fish/functions/use-node.fish

function use-node
    set -l nodever $argv[1]
    set PATH $HOME/.config/FlyEnv/app/nodejs/v$nodever/bin /usr/local/bin /usr/bin /bin
    echo "✅ Switched to Node v$nodever via FlyEnv"
end

# Reload konfigurasi
source ~/.config/fish/config.fish

# Gunakan versi Node.js
use-node 24.5.0
```

📁 Project Folder Permissions (Opsional)
```bash
# Set grup dan permission default agar bisa dibaca Apache
sudo chown -R ernest:www-data /home/ernest/projects
sudo chmod -R 750 /home/ernest/projects
sudo chmod g+s /home/ernest/projects
```









 
