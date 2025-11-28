#!/bin/bash
# ------------------------------------------------------------
# PREMIUM TERMUX BANNER ENGINE – EMON EDITION (FINAL FIXED)
# 100% Auto Shell Detect + Auto File Create + Zero Error
# ------------------------------------------------------------

# Detect active shell
CURRENT_SHELL=$(basename "$SHELL")

if [[ "$CURRENT_SHELL" == "zsh" ]]; then
    RCFILE="$HOME/.zshrc"
elif [[ "$CURRENT_SHELL" == "bash" ]]; then
    RCFILE="$HOME/.bashrc"
else
    # fallback shell (Termux default)
    RCFILE="$HOME/.zshrc"
fi

# Ensure config file exists
if [ ! -f "$RCFILE" ]; then
    touch "$RCFILE"
fi

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# ------------------------------------------------------------
# ASK USER NAME
# ------------------------------------------------------------
clear
echo -e "${CYAN}🔥 PREMIUM TERMUX BANNER MAKER – EMON EDITION${RESET}"
echo ""

while true; do
    read -rp "👉 Enter Your Name: " USERNAME
    [[ -n "$USERNAME" ]] && break
    echo -e "${RED}Name cannot be empty!${RESET}"
done

# ------------------------------------------------------------
# SELECT STYLE
# ------------------------------------------------------------
clear
echo -e "${YELLOW}Choose Your Banner Style:${RESET}"
echo ""
echo "1) BIG Hacker"
echo "2) Shadow"
echo "3) Box Banner"
echo "4) Neon Mode (EMON)"
echo "5) Clean Mode"
echo ""

read -rp "Select (1-5): " STYLE

# ------------------------------------------------------------
# BANNERS
# ------------------------------------------------------------
make_banner() {

case $STYLE in

1) cat <<EOF
${GREEN}
██████╗ ███████╗ ██████╗ 
BIG HACKER MODE: ${USERNAME} | EMON
${RESET}
EOF
;;

2) cat <<EOF
${CYAN}
███████╗██╗  ██╗ █████╗ 
SHADOW MODE: ${USERNAME} | EMON
${RESET}
EOF
;;

3) cat <<EOF
${BLUE}
┌───────────────────────────────┐
│ USER: ${USERNAME}               │
│ EMON EDITION                    │
└───────────────────────────────┘
${RESET}
EOF
;;

4) cat <<EOF
${YELLOW}
██████╗ ███████╗ ██████╗ 
NEON MODE: EMON
USER: ${USERNAME}
${RESET}
EOF
;;

5) cat <<EOF
${GREEN}
>>> ${USERNAME} | EMON <<<
${RESET}
EOF
;;

*) echo "Invalid selection"; exit 1 ;;
esac
}

banner_output="$(make_banner)"

# ------------------------------------------------------------
# INSTALL BANNER
# ------------------------------------------------------------
echo -e "${CYAN}Installing banner...${RESET}"

# Remove old banners
sed -i '/EMON_BANNER_START/,/EMON_BANNER_END/d' "$RCFILE"

# Add new banner
{
echo ""
echo "# EMON_BANNER_START"
echo -e "printf \"${banner_output}\""
echo "# EMON_BANNER_END"
} >> "$RCFILE"

clear
echo -e "${GREEN}✔ Banner Installed Successfully!${RESET}"
echo -e "${YELLOW}Restart Termux to see your new banner.${RESET}"
