# gMapping
gMapping is a simple map browser using the embedded Google Maps API.

### Script Purpose as a Tool:
Open gMappng to enable mapping features from the Linux desktop providing satellite, road-map, and zoom features. Options to save or copy and retrieve maps with locations, map type and zoom levels.



### Setup:
- Save the gMapping.sh file to a directory.
- Make the gMapping.sh script executable by running the following command in the same directory as the gMapping.sh file:
_chmod +x gMapping.sh_

### Features:
- Mapping by address.
- Mapping by location.
- Mapping by Zip/Postal area.
- Mapping by City/Town area.
- Mapping by County/Province area.
- Mapping by Coordinates.
- Save map links for future use.
- Copy saved map links.
- Export saved map links.
- Customize map window by size and position.
- Theme options for system default or custom.

### Typical Usage:
When running mRunner the main menu will appear showing options for different ways of creating a map. Choosing a option will bring another menu asking for mapping details including map type and zoom level. Click on the “Map” button to have a Google embedded map appear based on the criteria you have provided.

### Program Navigation:
Each of the menus options when clicked will open a new menu pertaining to the option. For instance as one chooses, "Address", options for locating map features regarding a address will appear. As you choose "City/Town" options for mapping a city or town will be listed. For each option listed, a button for "Save" is listed in the menu. This allows you to save the current view and link to the map for future use. Using the "Saved" button on the main menu will load all saved links for review with further options.

When viewing a menu for the selected map option open, the close button closes the current menu and brings you back to the main menu. When selecting "Exit" from the main menu, all windows of the script will close and gMapping will exit.

### Map Address Example:
Mapping by address is as easy as it sounds:
1) After selecting to map by "Address", the Address menu will appear.
2) Add the address into the "Address" field.
3) Select the option for "Type" and select to view the map in either "Road" or "Satellite" view.
4) Select the option for "Zoom" and choose the level of zoom required.
5) Click on the button "Map" to open the map using your address input and map selections.
6) If needed for future reference, click on the button "Save" button in order to save the current mapping view into the saved listing. This saved link will recall your selections for map type and zoom levels as well as the address.
7) After clicking on the "Map" button with your input, the embedded google map will appear for use.
8) When viewing the google embedded map, options available will allow you to zoom in or out, select either a road map or satellite view, as well as choosing to view a large map.
9) Clicking on the "Close" button in the menu will bring you back to the main menu for all selections.

Each of the options for mapping from the main menu operate in the same way but ask for different input pending on the option selected. Main menu options are described below.

### Main Menu Options and Usage:
**- Address:** Map by address. Example: 945 Park Villa Place, Escondido, CA, 92025.<br/>
**- Location:** Map by location. Example: Coronado Bridge, San Diego CA.<br/>
**- Zip/Postal:** Map by zip code or postal code. Example: 59801<br/>
* _Hint_: Select zoom level between 8 and 13 in order to show outline of zip code or postal code.<br/>
**- City/Town:** Map by name of city or town. Example: Missoula<br/>
* _Hint_: Select zoom level between 8 and 13 in order to show outline of city or town.<br/>
**- County/Province:** Map by County or Province. Example: North County<br/>
**- Coordinates:** Map by Longitude and Latitude. This will pin point your map to a particular location.<br/>
**- Saved:** View saved map links, load a saved map with a double click on the option listed. Details for viewing saved map links are listed below.<br/>
**- Options:** Options will allow you to select a theme for gMapping, as well as changing the map position and size. More information for Options are listed below under "Theme Options" and "Map Position".<br/>
**- Exit:** Closes all menus and windows related to the gMapping script.<br/>

### Saved Maps:

### Settings Usage:




### Map Position:
This screen contains options to adjust the positioning and size of the mapping window:
**- Window Width:** Adjust the mapping window width by pixels.<br/>
**- window Height:** Adjust the mapping window height by pixels.<br/>
**- Window From Top:** Adjust mapping window position from the top of the screen in pixels.<br/>
**- Window From Left:** Adjust mapping window position from the left of the screen in pixels.<br/>

Click on the "Save" button to save your changes or select "Cancel" to not save changes and close the settings window.



### Notes:
- gMapping can be ran from any directory.
- gMapping uses the "/tmp/" folder for temporary and .ini files.
- A map location no found will default to the world map.
- Map links extracted will only work within a "FRAME" html element.




### Critical System Requirements:
The most important requirement is the yad (yet another dialog) application which allows for the use of custom dialog, menu, and window options.

- yad 14.0+ (GTK+ 3.24.41) [https://github.com/v1cont/yad](https://github.com/v1cont/yad)

The gMapping script uses features of yad that do require version 14.0+ and built with GTK+ 3.24.41 or higher. Full setup instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch)

YAD (Yet Another Dialog), a tool for developing graphical user interfaces in Linux, is written by Victor Ananjevsky.

Script interface written by: Robert W. Eckert - rweckert@gmail.com
Please feel free to email to submit bugs, changes or requests.

### gMapping Shortcut File: <br/>
Save the following as a file named "gMapping.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored.<br/>
[Desktop Entry]<br/>
Name=gMapping<br/>
GenericName=gMapping<br/>
Comment=gMapping is a simple map browser using the embedded Google Maps API.<br/>
Exec=/PathToScript/gMapping.sh<br/>
Type=Application<br/>
Icon=text-html<br/>
Terminal=false<br/>

### Project Contents:
**Project Page:** <br/>


**Source File:** <br/>


**Documentation File:** <br/>


**Project Screenshot:** <br/>




