#!/bin/bash
# ------------------------------------------------------------
# PREMIUM TERMUX BANNER ENGINE – EMON EDITION (FINAL FULL)
# All styles include EMON credit + Matrix Animation + Color
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

# Rainbow color generator
rainbow() {
    colors=("$RED" "$YELLOW" "$GREEN" "$CYAN" "$BLUE" "$MAGENTA")
    text="$1"
    for ((i=0; i<${#text}; i++)); do
        printf "${colors[$((i % 6))]}${text:$i:1}"
    done
    printf "${RESET}\n"
}

# Matrix animation
matrix_rain() {
    clear
    echo -e "${GREEN}"
    for i in {1..50}; do
        printf "%*s\n" $(( (RANDOM % 40) + 20 )) "$(tr -dc '01' </dev/urandom | head -c $((RANDOM%30+5)))"
        sleep 0.03
    done
    echo -e "${RESET}"
}

# ------------------------------------------------------------
clear
echo -e "${CYAN}🔥 PREMIUM TERMUX BANNER MAKER – EMON EDITION${RESET}"
echo ""
read -p "👉 Enter Your Name: " USERNAME

if [[ -z "$USERNAME" ]]; then
    echo "Name cannot be empty!"
    exit 1
fi

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
echo "11) Rainbow Name Banner"
echo "12) Matrix + Neon Combo"
echo "13) Ultra Big Block Banner"
echo "14) Double Layer Banner"
echo "15) EMON Prestige Logo"
echo ""

read -p "Select (1-15): " STYLE

# ------------------------------------------------------------
#       BANNER GENERATION
# ------------------------------------------------------------

make_banner() {
case $STYLE in

1) cat <<EOF
${GREEN}
██████╗ ███████╗ ██████╗ ███╗   ██╗
██╔══██╗██╔════╝██╔═══██╗████╗  ██║
██║  ██║█████╗  ██║   ██║██╔██╗ ██║
██║  ██║██╔══╝  ██║   ██║██║╚██╗██║
██████╔╝███████╗╚██████╔╝██║ ╚████║
╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
   BIG HACKER MODE: ${USERNAME} | EMON
${RESET}
EOF
;;

2) cat <<EOF
${CYAN}
███████╗██╗  ██╗ █████╗ ██████╗ ██████╗ 
██╔════╝██║  ██║██╔══██╗██╔══██╗██╔══██╗
███████╗███████║███████║██████╔╝██████╔╝
SHADOW MODE: ${USERNAME} | EMON
${RESET}
EOF
;;

3) cat <<EOF
${GREEN}
▒█▀▀█ ▒█▀▀█ ▒█▀▀▄ ▒█▀▀▀ 
▒█▄▄█ ▒█░▄▄ ▒█░▒█ ▒█▀▀▀ 
▒█░▒█ ▒█▄▄█ ▒█▄▄▀ ▒█▄▄▄ 
 CYBER MATRIX: ${USERNAME} | EMON
${RESET}
EOF
;;

4) cat <<EOF
${RED}
🔥🔥🔥 FIRE MODE 🔥🔥🔥
██████╗  █████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝
FIRE USER: ${USERNAME} | EMON
${RESET}
EOF
;;

5) cat <<EOF
${BLUE}
██████╗ ███████╗ ██████╗ ███╗   ██╗
██╔══██╗██╔════╝██╔═══██╗████╗  ██║
NEON MODE: EMON
USER: ${USERNAME}
${RESET}
EOF
;;

6) cat <<EOF
${RED}
██████╗ ██╗   ██╗███╗   ██╗
██╔══██╗██║   ██║████╗  ██║
BLOODY USER: ${USERNAME} | EMON
${RESET}
EOF
;;

7) cat <<EOF
${MAGENTA}
┌────────────────────────────┐
│ USER: ${USERNAME}           │
│ CREATED BY: EMON            │
└────────────────────────────┘
${RESET}
EOF
;;

8) cat <<EOF
${CYAN}
██████╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝
3D STYLE: ${USERNAME} | EMON
${RESET}
EOF
;;

9) cat <<EOF
${GREEN}
༒ 𝗚𝗛𝗢𝗦𝗧 𝗛𝗔𝗖𝗞𝗘𝗥 ༒
█▀█ █▀▀ █▄ █
█▀▀ ██▄ █ ▀█
USER: ${USERNAME} | EMON
${RESET}
EOF
;;

10) cat <<EOF
${YELLOW}
==> ${USERNAME} <==  | EMON
${RESET}
EOF
;;

11)
rainbow "R A I N B O W  :  $USERNAME  |  EMON"
;;

12) cat <<EOF
${GREEN}
[ MATRIX DROPS ]  ${RESET}
$(matrix_rain)
${BLUE}
NEON USER: ${USERNAME} | EMON
${RESET}
EOF
;;

13) cat <<EOF
${CYAN}
██████╗ ██████╗ ███╗   ███╗ ██████╗ ███╗   ██╗
ULTRA BLOCK: ${USERNAME} | EMON
${RESET}
EOF
;;

14) cat <<EOF
${MAGENTA}
██████╗ 
██╔══██╗   DOUBLE LAYER
██║  ██║ → USER: ${USERNAME}
██║  ██║ → AUTHOR: EMON
${RESET}
EOF
;;

15) cat <<EOF
${GREEN}
██████╗ ███╗   ███╗ ██████╗ ███╗   ██╗
PRESTIGE LOGO – EMON EDITION
USER: ${USERNAME}
${RESET}
EOF
;;

*) echo "Invalid style!" ;;
esac
}

# ------------------------------------------------------------
# INSTALL BANNER
# ------------------------------------------------------------
banner_output="$(make_banner)"

echo -e "${GREEN}✔ Running Matrix animation...${RESET}"
matrix_rain

echo -e "${CYAN}✔ Installing Banner...${RESET}"

# Remove old banner
sed -i '/# >>> EMON_BANNER_START >>>/,/# <<< EMON_BANNER_END <<</d' "$RCFILE"

# Add new banner
{
echo ""
echo "# >>> EMON_BANNER_START >>>"
echo -e "printf \"${banner_output}\""
echo "# <<< EMON_BANNER_END <<<"
} >> "$RCFILE"

echo -e "${GREEN}✔ Installation Complete!"
echo -e "🔰 Restart Termux to see your EMON Banner.${RESET}"
