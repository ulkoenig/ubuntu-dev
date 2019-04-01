#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install {
echo "Install now Google Chrome Browser"

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
wget https://dl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub
apt update
apt install -y google-chrome-stable
# You may see the following warning message when issuing sudo apt update command.
# Target Packages (main/binary-amd64/Packages) is configured multiple times
# That’s because the Google Chrome package created an APT line in file /etc/apt/sources.list.d/google-chrome.list. You can remove the warning message by deleting that file.
if [[ -f /etc/apt/sources.list.d/google-chrome.list ]]; then
    rm /etc/apt/sources.list.d/google-chrome.list
fi

# Patch application menu, add flag --no-sandbox add exec command and remove all language settings which are not en-uk and not de 
cat > /usr/share/applications/google-chrome.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Google Chrome
# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
GenericName=Web Browser
GenericName[de]=Web-Browser
GenericName[en_GB]=Web Browser
# Gnome and KDE 3 uses Comment.
Comment=Access the Internet
Comment[de]=Internetzugriff
Comment[en_GB]=Access the Internet
Exec=/usr/bin/google-chrome-stable %U --no-sandbox
StartupNotify=true
Terminal=false
Icon=google-chrome
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-s
cheme-handler/ftp;
Actions=new-window;new-private-window;
[Desktop Action new-window]
Name=New Window
Name[de]=Neues Fenster
Name[en_GB]=New Window
Exec=/usr/bin/google-chrome-stable --no-sandbox
[Desktop Action new-private-window]
Name=New Incognito Window
Name[de]=Neues Inkognito-Fenster
Name[en_GB]=New Incognito window
Exec=/usr/bin/google-chrome-stable --incognito --no-sandbox
EOF
}

if [ "$#" -lt  "2" ] || [ "$#" -gt "2" ]
   then
    echo "$0 -install [true|false]"
 else

    while [[ $# > 1 ]]
    do
        key="$1"

        case $key in
            -i|--install)
            INSTALL="$2"
            shift # past argument
            ;;
            *)
             # unknown option
            ;;
        esac
        shift # past argument or value
    done

    if [ "$INSTALL" = true ] || [ "$INSTALL" = TRUE ] ||  [ "$INSTALL" = True ]
    then
        install
    fi
fi
