# this is a simple script to test the terminal's visuals and colors
# (to make sure I haven't messed things up)
echo -e "\n--- 1. VISUAL CAPABILITY TEST (What Alacritty sees) ---"
echo -e "\e[1mBold\e[0m \e[2mDim\e[0m \e[3mItalic\e[0m \e[4mUnderline\e[0m \e[9mStrikethrough\e[0m"
echo -e "\n--- 2. TRUE COLOR GRADIENT (Should be smooth, not blocky) ---"
awk 'BEGIN{for(x=0;x<80;x++){r=255-x*3;g=x*3;b=128;printf "\033[48;2;%d;%d;%dm ",r,g,b}print "\033[0m"}'
echo -e "\n--- 3. SYSTEM KNOWLEDGE TEST (What the OS thinks) ---"
echo "Colors known: $(tput colors)"
echo "Italics code: $(tput sitm | cat -v)"
