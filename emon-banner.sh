#!/bin/bash
# ------------------------------------------------------------
# PREMIUM TERMUX BANNER ENGINE – EMON EDITION (FIXED VERSION)
# ------------------------------------------------------------

ZSHRC="$HOME/.zshrc"
BASHRC="$HOME/.bashrc"

if [ -n "$ZSH_VERSION" ]; then
    RCFILE="$ZSHRC"
else
    RCFILE="$BASHRC"
fi

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
MAGENTA="\033[1;35m"
WHITE="\033[1;37m"
RESET="\033[0m"

# ------------------------------------------------------------
# CLEAN SCREEN FIRST
# ------------------------------------------------------------
clear
sleep 0.2

echo -e "${CYAN}🔥 PREMIUM TERMUX BANNER MAKER – EMON EDITION${RESET}"
echo ""

# ------------------------------------------------------------
# ASK USER NAME (FIXED INPUT)
# ------------------------------------------------------------
while true; do
    read -rp "👉 Enter Your Name: " USERNAME

    if [[ -z "$USERNAME" ]]; then
        echo -e "${RED}Name cannot be empty!${RESET}"
        sleep 0.8
        continue
    fi
    break
done

# ------------------------------------------------------------
# SELECT STYLE
# ------------------------------------------------------------
clear
echo -e "${YELLOW}Choose Your Banner Style:${RESET}"
echo ""
echo "1) BIG Hacker Text"
echo "2) Shadow Text"
echo "3) Cyber Matrix"
echo "4) Fire Flame"
echo "5) Neon Mode (EMON)"
echo "6) Bloody Text"
echo "7) Box Banner"
echo "8) 3D Style"
echo "9) Ghost Hacker"
echo "10) Clean Minimal"
echo ""

read -rp "Select (1-10): " STYLE

# ------------------------------------------------------------
# BANNER CREATION
# ------------------------------------------------------------
make_banner() {
case $STYLE in

1)
cat <<EOF
${GREEN}
██████╗ ███████╗ ██████╗
BIG HACKER: ${USERNAME} | EMON
${RESET}
EOF
;;

2)
cat <<EOF
${CYAN}
███████╗██╗  ██╗ █████╗
SHADOW MODE: ${USERNAME} | EMON
${RESET}
EOF
;;

3)
cat <<EOF
${GREEN}
▒█▀▀█ ▒█▀▀█ ▒█▀▀▄
CYBER MATRIX: ${USERNAME} | EMON
${RESET}
EOF
;;

4)
cat <<EOF
${RED}
🔥 FIRE MODE 🔥
USER: ${USERNAME} | EMON
${RESET}
EOF
;;

5)
cat <<EOF
${BLUE}
██████╗ ███████╗ ██████╗
NEON MODE: EMON
USER: ${USERNAME}
${RESET}
EOF
;;

6)
cat <<EOF
${RED}
██████╗ ██╗   ██╗███╗
BLOODY USER: ${USERNAME} | EMON
${RESET}
EOF
;;

7)
cat <<EOF
${MAGENTA}
┌───────────────────────────┐
│ USER : ${USERNAME}         │
│ AUTHOR : EMON              │
└───────────────────────────┘
${RESET}
EOF
;;

8)
cat <<EOF
${CYAN}
██████╗ ██████╗ ███████╗
3D STYLE: ${USERNAME} | EMON
${RESET}
EOF
;;

9)
cat <<EOF
${GREEN}
༒ GHOST HACKER ༒
USER: ${USERNAME} | EMON
${RESET}
EOF
;;

10)
cat <<EOF
${YELLOW}
==> ${USERNAME} <== | EMON
${RESET}
EOF
;;

*)
echo -e "${RED}Invalid option!${RESET}"
exit 1
;;
esac
}

banner_output="$(make_banner)"

# ------------------------------------------------------------
# INSTALL TO STARTUP
# ------------------------------------------------------------
echo -e "${CYAN}Installing banner...${RESET}"
sleep 0.5

# Remove old banner
sed -i '/# >>> CUSTOM_BANNER_START >>>/,/# <<< CUSTOM_BANNER_END <<</d' "$RCFILE"

{
echo ""
echo "# >>> CUSTOM_BANNER_START >>>"
echo -e "printf \"${banner_output}\""
echo "# <<< CUSTOM_BANNER_END <<<"
} >> "$RCFILE"

echo -e "${GREEN}✔ Done! Restart Termux to see your banner.${RESET}"
