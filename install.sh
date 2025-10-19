removeInstall() {
    sudo apt remove -y firefox-esr evolution gnome-text-editor gnome-calculator yelp gnome-contacts gnome-calendar gnome-weather gnome-clocks gnome-maps libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer shotwell gnome-sound-recorder gnome-music simple-scan totem gnome-snapshot gnome-characters gnome-tour seahorse evince gnome-connections gnome-disk-utility gnome-logs malcontent-gui gnome-system-monitor loupe baobab libreoffice-common
}

loadSetting() {
    dconf load / < gnome-settings-backup.ini
}

pre_installVlcTreeCurlFlatpakVmAnki() {
    sudo apt install -y vlc tree curl flatpak gnome-software-plugin-flatpak qemu-system qemu-kvm libvirt-daemon-system libvirt-clients virt-manager libxcb-xinerama0 libxcb-cursor0 libnss3
}

braveInstall() {
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
}

ankiInstall() {
    tar --use-compress-program=unzstd -xf anki-launcher-25.09-linux.tar.zst && cd anki-launcher-25.09-linux && sudo ./install.sh && cd - > /dev/null
}

codiumInstall() {
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg && echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' | sudo tee /etc/apt/sources.list.d/vscodium.sources
}

vpnInstall() {
    wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
}

syncInstall() {
    sudo mkdir -p /etc/apt/keyrings && sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg && echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable-v2" | sudo tee /etc/apt/sources.list.d/syncthing.list
}

grubFix() {
    sudo sed -i 's/^#GRUB_TERMINAL=console/GRUB_TERMINAL=console/' /etc/default/grub || echo 'GRUB_TERMINAL=console' | sudo tee -a /etc/default/grub >/dev/null && sudo update-grub
}

screenshotLink() {
    rm -r /home/ahdimsun/Pictures/Screenshots
ln -s /home/ahdimsun/Danish/Screenshots /home/ahdimsun/Pictures/Screenshots
}

flatpkInstall() {
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

flatpkInstallInstall() {
    flatpak install -y flathub org.kde.kdenlive
}

vmInstall() {
    sudo usermod -aG libvirt,kvm $(whoami) && sudo systemctl enable --now libvirtd
}

post_installBraveVpnSync() {
    sudo apt install -y brave-browser codium proton-vpn-gnome-desktop syncthing
}

removeFileFolder() {
    rm -f ./protonvpn-stable-release_1.0.8_all.deb
rm -rf ./anki-launcher-25.09-linux
}

removeInstall
sudo apt autoremove -y
sudo apt update
sudo apt upgrade -y
sudo apt install ./obsidian_1.9.14_amd64.deb
pre_installVlcTreeCurlFlatpakVmAnki
braveInstall
ankiInstall
#codiumInstall
vpnInstall
syncInstall
grubFix
screenshotLink
flatpkInstall
flatpkInstallInstall
vmInstall
sudo apt update
sudo apt upgrade -y
sudo apt install ./protonvpn-stable-release_1.0.8_all.deb
post_installBraveVpnSync
loadSetting
removeFileFolder