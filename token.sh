token=$(cat nginx/html/token.txt)
ntoken=$(curl https://api.aliyundrive.com/token/refresh -X POST -H "User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.54 Safari/537.36" -H "Rererer:https://www.aliyundrive.com/" -H "Content-Type:application/json" -d '{"refresh_token":"'$token'"}' | sed 's/,/\n/g' | grep refresh_token | cut -d \: -f2 | sed 's/"//g')
echo  -n ${ntoken} > nginx/html/token.txt
python3 -m http.server --bind 127.0.0.1 81 &
nginx/sbin/nginx -g 'daemon off;'