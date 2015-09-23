# boxen
boxen script to set up my mac

### manually install:

- xcode
- google music
- adobe cloud
- menu meters
- jing
- uApp
- omni outliner pro
- ynab
- pages
- numbers
- office
- zoom.us
- display meter
- ecoute
- android file transfer
- private internet access
- Quicken 2007


### manual set-up

* Install developer tools `xcode-select --install`

* Install [gdrive](https://www.google.com/drive/download/)

* Install via AppStore
  * Divvy (enable access: 'System Preferences' :  'Security & Privacy' : 'Privacy' : 'Accessibility', add it to allowd apps)
  * Slack

* change the machine name
	* in ’System Preferences’ -> ‘sharing’
	* Enable 'Remote Login' & 'Remote Management'
	* run `sudo scutil --set HostName [NewHostNameHere]` on command line

* Machine Hygiene
  * Add login items
    * Divvy
    * iTerm
  * Start Menu Meter in _System Preferences_ and show the cpu usage as graph
  * Start Chrome, set it as default browser and login

* iTerm > Preferences > Profiles > Default > Text
  	* Regular Font > Change Font > 15pt Monaco
  	* Non-ASCII Font > Change Font > 15pt Monaco

* Finder
	* open preferences
		* under General set _New Finder windows show_ to _USER_HOME
		* in Sidebar, check _pivotal_ under favorites, uncheck _All My Files, iCloud Drive, Documents_
	* add _workspace_ to the side-bar (in an open Finder window you can just drag that in there)

* Open Textmate
  * Preferences -> Terminal -> Install command line tools
  * Preferences -> Project -> Show file browser on: Left side


* Open IntelliJ
	* open a project from workspace
	* in Preferences
		* Appearance & Behavior -> Appearance -> Select Darcula as theme
		* Appearance & Behavior -> System Settings -> Open project in new Window
		* Editor -> General -> Scroll Down
			* Set 'Maximum number of clipboard contents' to 100
			* Set 'Recent File Limit' to 100
		* Editor -> General -> Appearance -> check `show line numbers`

* Open Atom
    * under Preferences -> Packages -> Search for Save, then click on settings for the 'autosave' package and check the box for enable

* Encrypt the harddrive
    * System Preferences -> Security & Privacy -> Turn on FileVault, store the backup key in the google drive



