#!/bin/bash
# gMapping.sh Created: 02/27/2025 Updated: 04/17/2025
# Robert W. Eckert - rweckert@gmail.com
#            _____                       .__                
#    ____   /     \ _____  ______ ______ |__| ____    ____  
#   / ___\ /  \ /  \\__  \ \____ \\____ \|  |/    \  / ___\ 
#  / /_/  )    Y    \/ __ \|  |_) )  |_) )  |   |  \/ /_/  )
#  \___  /\____|__  (____  /   __/|   __/|__|___|  /\___  / 
# /_____/         \/     \/|__|   |__|           \//_____/ v:1.5
# gMapping is a simple map browser using the embedded Google Maps API.

fcall="export -f"
bcall="bash -c"
afp=$(dirname "$(realpath "$0")")
export app="$afp/gMapping.sh"
export td="/tmp"
export tf="$td/gMapping.txt"
export ti="$td/gMapping.ini"
export tt="$td/gMapping.tmp"
export th="$td/gMapping.html"
export mt=$(echo "road,satellite")
export zl=$(echo "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21")

# Main Menu: ===========================
function mMenu {
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-Menu" --name="mMenu" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --no-buttons --columns=9 \
--field="Address":fbtn "$app mAddress" \
--field="Location":fbtn "$app mLocation" \
--field="Zip/Postal":fbtn "$app mPostal" \
--field="City/Town":fbtn "$app mCity" \
--field="County/Province":fbtn "$app mCounty" \
--field="Coordinates":fbtn "$app mCoordinates" \
--field="Saved":fbtn "$app vSaved" \
--field="Options":fbtn "$app mOptions" \
--field="Exit":fbtn "$app mExit"
}
$fcall mMenu

# Map Address: =========================
function mAddress {
gsm='@sh -c "echo %1!%2!%3!Address > $tf & $app mGSave"'
gma='@sh -c "echo %1!%2!%3!Address > $tf & $app gMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-Address" --name="mAddress" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=6 \
--field="Address" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gma" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-Address'"
}
$fcall mAddress

# Map Location: ========================
function mLocation {
gsm='@sh -c "echo %1!%2!%3!Location > $tf & $app mGSave"'
gma='@sh -c "echo %1!%2!%3!Location > $tf & $app gMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-Location" --name="mLocation" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=6 \
--field="Location" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gma" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-Location'"
}
$fcall mLocation

# Map Postal Zip: ======================
function mPostal {
gsm='@sh -c "echo %1!%2!%3!Zip/Postal > $tf & $app mGSave"'
gma='@sh -c "echo %1!%2!%3!Zip/Postal > $tf & $app gMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-Zip/Postal" --name="mPostal" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=6 \
--field="Zip/Postal" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gma" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-Zip/Postal'"
}
$fcall mPostal

# Map City: ============================
function mCity {
gsm='@sh -c "echo %1!%2!%3!City/Town > $tf & $app mGSave"'
gma='@sh -c "echo %1!%2!%3!City/Town > $tf & $app gMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-City/Town" --name="mCity" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=6 \
--field="City/Town" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gma" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-City/Town'"
}
$fcall mCity

# Map County: ==========================
function mCounty {
gsm='@sh -c "echo %1!%2!%3!County/Province > $tf & $app mGSave"'
gma='@sh -c "echo %1!%2!%3!County/Province > $tf & $app gMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-County/Province" --name="mCounty" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=6 \
--field="County/Province" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gma" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-County/Province'"
}
$fcall mCounty

# Map Coordinates: =====================
function mCoordinates {
gsm='@sh -c "echo %1!%2!%3!%4!Coordinates > $tf & $app mCSave"'
gmc='@sh -c "echo %1 %2 %3 %4 > $tf & $app cMap"'
yad --form --css="$tp" --posx=20 --posy=20 --width=900 --title="gMapping-Coordinates" --name="mCoordinates" --window-icon="text-x-script" --separator="," --item-separator="," --f1-action="$app mHelp" --fixed --skip-taskbar --no-buttons --columns=7 \
--field="Latitude" "" \
--field="Longitude" "" \
--field="Type:CB" "$mt" \
--field="Zoom:CB" "$zl" \
--field="Map":fbtn "$gmc" \
--field="Save":fbtn "$gsm" \
--field="Close":fbtn "wmctrl -c 'gMapping-Coordinates'"
}
$fcall mCoordinates

# General Mapping Function: ============
function gMap {
wmctrl -c 'World View'
read mp < "$tf"
gal=$(echo $mp | awk 'BEGIN {FS="!" } { print $1 }')
mwt="$gal"
gal=$(sed "s/ /%20/g" <<< $gal)
gal=$(sed "s/,/%20/g" <<< $gal)
gpt=$(echo $mp | awk 'BEGIN {FS="!" } { print $2 }')
if [[ "$gpt" == "road" ]]; then gmt="m"; fi
if [[ "$gpt" == "satellite" ]]; then gmt="k"; fi
gzl=$(echo $mp | awk 'BEGIN {FS="!" } { print $3 }')
gwt=$(echo $mp | awk 'BEGIN {FS="!" } { print $4 }')
gl1="https://maps.google.com/maps?f=q&q="
gl2="+&t="
gl3="&z="
gl4="&output=embed"
gls="%20"
glt="$gl1$gal$gl2$gmt$gl3$gzl$gl4"
fp1="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='"
fp2="'</iframe>"
echo "$fp1$glt$fp2" > "$th"
wwidth=$(grep "wwidth" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wheight=$(grep "wheight" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wftop=$(grep "wftop" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wfleft=$(grep "wfleft" $ti | awk 'BEGIN {FS=":" } { print $2 }')
yad --html --browser --css="$tp" --width="$wwidth" --height="$wheight" --posx="$wfleft" --posy="$wftop" --title="$gwt" --name="gMap" --window-icon="text-x-script" --f1-action="$app mHelp" --uri="$th" --file-op 2>/dev/null
}
$fcall gMap

# Coordinates Mapping Function: ========
function cMap {
wmctrl -c 'World View'
read mp < "$tf"
glt=$(echo $mp | awk 'BEGIN {FS=" " } { print $1 }')
gln=$(echo $mp | awk 'BEGIN {FS=" " } { print $2 }')
gpt=$(echo $mp | awk 'BEGIN {FS=" " } { print $3 }')
if [[ "$gpt" == "road" ]]; then gmt="m"; fi
if [[ "$gpt" == "satellite" ]]; then gmt="k"; fi
gzl=$(echo $mp | awk 'BEGIN {FS=" " } { print $4 }')
gl1="https://maps.google.com/maps?f=q&q="
gl2="+&t="
gl3="&z="
gl4="&output=embed"
gls="%20"
glt="$gl1$glt$gls$gln$gl2$gmt$gl3$gzl$gl4"
fp1="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='"
fp2="'</iframe>"
echo "$fp1$glt$fp2" > "$th"
wwidth=$(grep "wwidth" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wheight=$(grep "wheight" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wftop=$(grep "wftop" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wfleft=$(grep "wfleft" $ti | awk 'BEGIN {FS=":" } { print $2 }')
yad --html --browser --css="$tp" --width="$wwidth" --height="$wheight" --posx="$wfleft" --posy="$wftop" --title="Coordinates" --name="cMap" --window-icon="text-x-script" --f1-action="$app mHelp" --uri="$th" --file-op 2>/dev/null
}
$fcall cMap

# Mapping Default: =====================
function mDefault {
gml="https://maps.google.com/maps?f=q&q=+&t=h&z=2&output=embed"
fp1="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='"
fp2="'</iframe>"
echo "$fp1$gml$fp2" > "$th"
yad --html --browser --css=gtk.css --width=900 --height=500 --posx=20 --posy=115 --title="World View" --name="mDefault" --window-icon="text-x-script" --f1-action="$app mHelp" --uri="$th" --file-op 2>/dev/null
}
$fcall mDefault

# Map Coordinates Save: ================
function mCSave {
read mp < "$tf"
gla=$(echo $mp | awk 'BEGIN {FS="!" } { print $1 }')
glo=$(echo $mp | awk 'BEGIN {FS="!" } { print $2 }')
gsc="${gla}_${glo}"
gpt=$(echo $mp | awk 'BEGIN {FS="!" } { print $3 }')
if [[ "$gpt" == "road" ]]; then gmt="m"; fi
if [[ "$gpt" == "satellite" ]]; then gmt="k"; fi
gzl=$(echo $mp | awk 'BEGIN {FS="!" } { print $4 }')
gwt=$(echo $mp | awk 'BEGIN {FS="!" } { print $5 }')
gl1="https://maps.google.com/maps?f=qampq="
gl2="+ampt="
gl3="ampz="
gl4="ampoutput=embed"
gls="%20"
glt="$gl1$gla$gls$glo$gl2$gmt$gl3$gzl$gl4"
dt=$(date '+%m/%d/%Y %H:%M:%S');
if [ ! -f $td/gmSaved.txt ]; then echo -n "" > "$td/gmSaved.txt"; fi
echo -e "$gsc\n$dt\n$gwt\n$glt" >> "$td/gmSaved.txt"
yad --text="Map Coordinates have been saved." --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
}
$fcall mCSave

# Map General Save: ====================
function mGSave {
read mp < "$tf"
gal=$(echo $mp | awk 'BEGIN {FS="!" } { print $1 }')
mwt="$gal"
gal=$(sed "s/ /_/g" <<< $gal)
gal=$(sed "s/,/_/g" <<< $gal)
gpt=$(echo $mp | awk 'BEGIN {FS="!" } { print $2 }')
if [[ "$gpt" == "road" ]]; then gmt="m"; fi
if [[ "$gpt" == "satellite" ]]; then gmt="k"; fi
gzl=$(echo $mp | awk 'BEGIN {FS="!" } { print $3 }')
gwt=$(echo $mp | awk 'BEGIN {FS="!" } { print $4 }')
gl1="https://maps.google.com/maps?f=qampq="
gl2="+ampt="
gl3="ampz="
gl4="ampoutput=embed"
gls="%20"
glt="$gl1$gal$gl2$gmt$gl3$gzl$gl4"
dt=$(date '+%m/%d/%Y %H:%M:%S');
echo -e "$gal\n$dt\n$gwt\n$glt" >> "$td/gmSaved.txt"
yad --text="Map $gwt has been saved." --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
}
$fcall mGSave

# View Saved Map: ======================
function vSaved {
if [ ! -f $td/gmSaved.txt ]; then echo -n "" > "$td/gmSaved.txt"; fi
sm='@sh -c "echo %s > $tt & $app lSaved"'
ydo=$(yad --list --css="$tp" --posx=20 --posy=115 --width=800 --height=400 --title="Saved Maps" --name="vSave" --window-icon="text-x-script" --dclick-action="$sm" --separator="," --item-separator="," --center --f1-action="$app mHelp" --button="Selected Detail":4 --button="Clear List":3 --button="Open List":2 --button="Close":1 --columns=3 --column="Location" --column="Date Time" --column="Map Type" --column="Link"  < $td/gmSaved.txt > $td/gmExport.txt)
ydo=$?
if [ $ydo -eq 1 ]; then wmctrl -c 'Saved Maps'; fi
if [ $ydo -eq 2 ]; then xdg-open $td/gmSaved.txt;vSaved; fi
if [ $ydo -eq 3 ]; then rm -f $td/gmSaved.txt;vSaved; fi
if [ $ydo -eq 4 ]; then vDetail; fi
}
$fcall vSaved

# Load Saved Map: ======================
function lSaved {
wmctrl -c 'World View'
wmctrl -c 'Saved Maps'
read cf < "$tt"
ml=$(echo $cf | awk 'BEGIN {FS=" " } { print $5 }')
ml=$(sed "s/amp/\&/g" <<< $ml)
ml=$(sed "s/_/%20/g" <<< $ml)
mp=$(echo $cf | awk 'BEGIN {FS=" " } { print $1 }')
mp=$(sed "s/%20/ /g" <<< $mp)
fp1="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='"
fp2="'</iframe>"
echo "$fp1$ml$fp2" > "$th"
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="Saved Map" --name="lSaved"  --window-icon="text-x-script" --f1-action="$app mHelp" --uri="$th" --file-op 2>/dev/null
}
$fcall lSaved

# View Detail: =========================
function vDetail {
read gld < "$td/gmExport.txt"
gml=$(echo $gld | awk 'BEGIN {FS="," } { print $1 }')
gmd=$(echo $gld | awk 'BEGIN {FS="," } { print $2 }')
gmt=$(echo $gld | awk 'BEGIN {FS="," } { print $3 }')
ggl=$(echo $gld | awk 'BEGIN {FS="," } { print $4 }')
gml=$(sed "s/_/ /g" <<< $gml)
ggl=$(sed "s/amp/\&/g" <<< $ggl)
ggl=$(sed "s/_/%20/g" <<< $ggl)
cml='@sh -c "echo %5 > $tt & $app mdCopy"'
cmd='@sh -c "echo %2 %3 %4 %5 > $tt & $app mdCopy"'
yad --form --css="$tp" --posx=40 --posy=185 --width=500 --fixed --title="gMapping-Details" --name="vDetail" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=1 \
--field="Map Link Detail:":lbl "" \
--field="Location" "$gml" \
--field="Date Time" "$gmd" \
--field="Map Type" "$gmt" \
--field="Map Link" "$ggl" \
--field="Copy Map Link":fbtn "$cml" \
--field="Copy Map Detail":fbtn "$cmd" \
--field="Close Detail":fbtn "wmctrl -c 'gMapping-Details'" 2> /dev/null
}
$fcall vDetail

# Copy Detail: =========================
function mdCopy {
read gmd < "$tt"
echo -n "$gmd" | xclip -selection clipboard
yad --text="Map details have beed copied to the system clipboard." --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
}
$fcall mdCopy

# Menu Options: ========================
function mOptions {
yad --form --css="$tp" --posx=20 --posy=115 --title="gMapping-Options" --name="mOptions" --window-icon="text-x-script" --f1-action="$app mHelp" --fixed --no-buttons --columns=1 \
--field="Theme Options":fbtn "$app mTheme" \
--field="Map Position":fbtn "$app mSettings" \
--field="Default Settings":fbtn "$app sDefault" \
--field="Help":fbtn "$app mHelp" \
--field="About":fbtn "$app mAbout" \
--field="Close":fbtn "wmctrl -c 'gMapping-Options'"
}
$fcall mOptions

# Menu Settings: =======================
function mSettings {
wwidth=$(grep "wwidth" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wheight=$(grep "wheight" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wftop=$(grep "wftop" $ti | awk 'BEGIN {FS=":" } { print $2 }')
wfleft=$(grep "wfleft" $ti | awk 'BEGIN {FS=":" } { print $2 }')
yad --form --css="$tp" --posx=90 --posy=185 --width=300 --fixed --on-top --title="gMapping-Settings" --name="mSettings" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Cancel":1 --button="Save":0 --columns=1 \
--field="Window Width":Num "$wwidth" \
--field="Window Height":Num "$wheight" \
--field="Window From Top":Num "$wftop" \
--field="Window From Left":Num "$wfleft" | while read line; do
wwidth=`echo $line | awk -F',' '{print $1}'`
wheight=`echo $line | awk -F',' '{print $2}'`
wftop=`echo $line | awk -F',' '{print $3}'`
wfleft=`echo $line | awk -F',' '{print $4}'`
echo -e "wwidth:$wwidth\nwheight:$wheight\nwftop:$wftop\nwfleft:$wfleft" > "$ti"
done
}
$fcall mSettings

# Default Settings: ====================
function sDefault {
wmctrl -c 'gMapping-Options'
echo "wwidth:900" > "$ti"
echo "wheight:500" >> "$ti"
echo "wfleft:20" >> "$ti"
echo "wftop:115" >> "$ti"
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
}
$fcall sDefault

# Menu Theme: ==========================
function mTheme {
gut='@sh -c "echo %2 > $tf & $app tUser"'
gst='@sh -c "echo %5 > $tf & $app tSystem"'
ydo=$(yad --form --css="$tp" --posx=20 --posy=115 --width=300 --fixed --title="gMapping-Theme" --name="mTheme" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Help":3 --button="About":2 --button="Close":1 \
--field="Custom Theme"::LBL "" \
--field="Load Theme:FL" "/usr/share/themes/" \
--field="Apply Custom Theme":fbtn "$gut" \
--field="System Default"::LBL "" \
--field="Mode:CB" "Light Theme\!Dark Theme" \
--field="Apply System Theme":fbtn "$gst" \
--field="Browse Themes Folder":fbtn "$app tBrowse" 2> /dev/null)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'gMapping-Theme'; fi
if [[ $ydo -eq 2 ]]; then mAbout; fi
if [[ $ydo -eq 3 ]]; then mHelp; fi
}
$fcall mTheme

# User Selected Theme: =================
function tUser {
read gut < "$tf"
sed -i '/stheme:/d' "$ti"
echo "stheme:$gut" >> "$ti"
tApply
}
$fcall tUser

# System Theme: ========================
function tSystem {
read gst < "$tf"
if [ "$gst" = "Dark Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze-Dark/gtk-4.0/gtk.css" >> "$ti"
fi
if [ "$gst" = "Light Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
fi
tApply
}
$fcall tSystem

# Apply Theme: =========================
function tApply {
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
wmctrl -c 'gMapping-Menu'
wmctrl -c 'gMapping-Theme'
wmctrl -c 'gMapping-Options'
mMenu
}
$fcall tApply

# Browse Theme: ========================
function tBrowse {
xdg-open "/usr/share/themes/"
}
$fcall tBrowse

# Main Help: ===========================
function mHelp {
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="gMapping-Documentation" --name="mHelp" --window-icon="text-x-script"  --uri="/home/rweckert/WinXBin/Source/gMapping/readme-gMapping.txt" --file-op 2>/dev/null
}
$fcall mHelp

# About ================================
function mAbout {
yad --about --css="$tp" \
--window-icon="text-x-script" \
--image="text-x-script" \
--authors="Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="gMapping is a simple map browser using the embedded Google Maps API.
Requires YAD 14.0+ (GTK+ 3.24.41)" \
--copyright="Updated 04/17/2025 by Robert W Eckert" \
--pversion="Version: 1.5" \
--pname="gMapping" \
--button="Close!gtk-close":1
}
$fcall mAbout

# Load Menu: ===========================
function mLoad {
if test -f "$ti"; then
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
mMenu &
mDefault &
wait
else
export tp=""
sDefault &
mMenu &
mDefault &
wait
fi
}
$fcall mLoad

# Exit and Cleanup =====================
function mExit {
wmctrl -c 'gMapping-Menu'
wmctrl -c 'gMapping-Address'
wmctrl -c 'gMapping-Location'
wmctrl -c 'gMapping-Zip/Postal'
wmctrl -c 'gMapping-City/Town'
wmctrl -c 'gMapping-County/Province'
wmctrl -c 'gMapping-Coordinates'
wmctrl -c 'Address'
wmctrl -c 'Location'
wmctrl -c 'Zip/Postal'
wmctrl -c 'City/Town'
wmctrl -c 'County/Province'
wmctrl -c 'Coordinates'
wmctrl -c 'Saved Maps'
wmctrl -c 'Saved Map'
wmctrl -c 'World View'
wmctrl -c 'gMapping-Details'
wmctrl -c 'gMapping-Theme'
wmctrl -c 'gMapping-Options'
wmctrl -c 'gMapping-Settings'
wmctrl -c 'gMapping-Documentation'
rm -f "$td/gmExport.txt"
rm -f "$tf"
rm -f "$tt"
rm -f "$th"
exit
}
$fcall mExit

if [ -z "$1" ]; then mLoad; else $1; fi