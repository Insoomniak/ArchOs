# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh
chmod -R +x ~/ArchOs/
~/ArchOs/Archinstall/startInstall.sh
