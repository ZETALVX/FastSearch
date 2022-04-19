I_Icon = fs-logo-mod-new-ico.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

Gui, Add, Text,, Enter your search:
Gui, Add, Edit, w400 h100 vtext,
Gui, Add, Text,, Where?
Gui, Add, DropdownList,w400 h100 vList,DuckDuckGo||Google|Yahoo|Odysee|Youtube|Link
Gui, Add,Button,gOk wp,Search
Gui, Font, s12,Courier New
Gui, Add, Text,cRed +Right w400, by ZETALVX
goto, GUIC
GUIC:
Gui, Show,AutoSize,FastSearch
return

Ok:
Gui,Submit,Nohide
StringLen, textl, text
if(List="Google")
{
parameter = https://www.google.com/search?q=%text%
StringReplace, parameter, parameter, %A_Space%, +, All
Run %parameter%
}
if(List="DuckDuckGo")
{
parameter = https://duckduckgo.com/?q=%text%
StringReplace, parameter, parameter, %A_Space%, +, All
Run %parameter%
}
if(List="Odysee")
{
parameter = https://odysee.com/$/discover?t=%text%
StringReplace, parameter, parameter, %A_Space%, +, All
Run %parameter%
}
if(List="Youtube")
{
parameter = https://www.youtube.com/results?search_query=%text%
StringReplace, parameter, parameter, %A_Space%, +, All
Run %parameter%
}
if(List="Yahoo")
{
parameter = https://search.yahoo.com/search?p=%text%
StringReplace, parameter, parameter, %A_Space%, +, All
Run %parameter%
}

if(List ="Link")
{
parameter = %text%
StringReplace, parameter, parameter, https://, , All
StringReplace, parameter, parameter, http://, , All
Run https://%parameter%
}
;if you want to close the program after the search add this line --> While WinExist("ahk_exe " "FastSearch")
return

GuiClose:
ExitApp

!s::
Goto, GUIC
return
