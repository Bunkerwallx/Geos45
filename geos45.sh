# Geos45
# geolocation



# Colores regulares
Black="\e[0;30m" # Negro
Red="\e[0;31m" # Rojo
Green="\e[0;32m" # Verde
Yellow="\e[0;33m" # Amarillo
Blue="\e[0;34m" # Azul
Purple="\e[0;35m" # Morado
Cyan="\e[0;36m" # Cyan
White="\e[0;37m" # Blanco
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

# pause function
function pause(){
   echo -e $cyan""
   read -sn 1 -p "   Presiona cual quier tecla para continuar..."
}

INPUT=$1
DIR=/tmp/test1.txt

function fetch(){
	curl -s -H "User-Agent: keycdn-tools:https://veekrum.github.io" https://tools.keycdn.com/geo.json?host={$INPUT} | \
	
	sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | \
	grep 'isp\|pais\|ciudad\|ip\|latitud\|longitud\|region\|continente\|metro_code' | \
	sed -e 's/"/''/g' | sed -e 's/:/= /g'> $DIR 

cat $DIR
rm $DIR
}

function usage {

    echo -e "Usage: geos45 [OPTIONS]";
    echo -e "\t-h | --help\tShow the help"
    echo -e "\t-v | --version\tVersion Infomacion"
    echo -e "\t-u | --usar \t Usar "
}


function msg {
    
    echo   
    echo -e "\t -Geos45 [dominio] [i.e www.example.com or example.com]"
    echo -e "\t -Geos45 [IP]  [i.e 127.0.0.1]"
}







function check {

	#if [[ -n "$1" ]]; then
	
	if [ "$1" != "" ]; then 
	   	echo  // $1 cannot be empty because it does not exist
	else
		fetch
	fi	
}


#sudo apt-get update && sudo apt-get dselect-upgrade  -y
#sudo apt --fix-broken install && sudo dpkg --configure -a
#sudo apt autoremove

clear
pause
echo "" 
echo -e $White"    Geos45 es una herramienta para geolacalizar ip para contribuir con el mapeo de antenas GSM "
echo -e $White"    Esta Herramienta para mejor desempeño requiere api ... @Bunkerwallx /30Junio2021/03:40am"
echo -e $Purple'''

                       ________________________________________________________
                       ========================================================
                       
                           
                            #      ## ###          ######## ## #######  
                           ##     ###  ## ######## ######## ## #######  
                          ####### ###   # ######## ##     # ## ##       
                         ######## ###              ##    ## ###   ###   
                         ######## ### ###          ##   ### ### #  ###  
                          ####### ### ###          ##       ## ### ###  
                           ##      ## ##           ##       ##  # ###   
                            #                      ##                  
                                                              <===\e[0;36mGeos45 \e[0;35m(\e[0;37mR\e[0;35m) 
                       ________________________________________________________
                       ========================================================     
                          \e[1;37mGeolocalizando el internet by \e[1;33m===== \e[0;36mBunkerland \e[1;33m======   
                             '''
                            echo -e "                                                               ***Bunkerland***"
                            pause
                            echo ""
                            echo -e $Purple "  Geos45 escaneando ip o host (web)..." && sleep 5 && echo -e $White
                            while true; do

    case $1 in

	-h|--help)     usage; exit;;
	-u|--usage)     msg; exit;;
	-v|--version)  cat "$INSTALL_DIR.version"; exit;;
	*)            check; exit;;
    esac
done

fetch






