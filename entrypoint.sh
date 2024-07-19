
cd /home/container

# Get internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

ip_panel=$(dig +short myip.opendns.com @resolver1.opendns.com)
curl -s https://raw.githubusercontent.com/VallzHost/vip-eggs/vallz-vip/ip.txt > ip.txt
mv ip.txt .config
if grep -qF "$ip_panel" .config/ip.txt; then
echo -e "\e[94m[ VALLZ OFFC ]\e[0m" "IP Terdaftar!!!"
else
    echo -e "\e[38;2;255;0;0m[ EROR ]\e[0m" "IP Not Verifid!!!"
    echo "\e[38;2;255;0;0m[ INFO ]\e[0m" "Buy Akses? https://wa.me/6285641225753"
  exit 0
fi
curl -s https://raw.githubusercontent.com/VallzHost/vip-eggs/vallz-vip/run.cjs > run.cjs
curl -s https://raw.githubusercontent.com/VallzHost/vip-eggs/vallz-vip/run.js > run.js
curl -s https://raw.githubusercontent.com/VallzHost/vip-eggs/vallz-vip/vallz.conf > vallz.conf
mv vallz.conf .config/neofetch
neofetch --config .config/neofetch/vallz.conf
eval ${MODIFIED_STARTUP}

