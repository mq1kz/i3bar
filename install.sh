#!/bin/bash
 
echo "Начинаю установку виджета..."
 
sudo apt update
sudo apt install -y build-essential libgtk-3-dev libgtk-layer-shell-dev fonts-font-awesome cargo rustc git
 
if ! command -v eww &> /dev/null; then
    echo "Собираю Eww..."
    git clone https://github.com/elkowar/eww
    cd eww
    cargo build --release
    sudo cp target/release/eww /usr/local/bin/
    cd ..
    rm -rf eww
else
    echo "Eww уже установлен, пропускаю сборку."
fi
 
mkdir -p ~/.config/eww
cp eww.yuck eww.scss ~/.config/eww/
 
echo "------------------------------------------"
echo "Установка завершена!"
echo "Теперь выполни: 'eww daemon' и 'eww open mybar'"
echo "------------------------------------------"
