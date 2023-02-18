@ECHO OFF
PUSHD "%~dp0"
for /f "delims== tokens=1,2" %%G in (../Config) do set %%G=%%H
POPD
ECHO .....................
ECHO This will iterate over EVERY key in the keys.txt file and depending on how many keys are in there,
ECHO this might take some time. So... Just wait till it is done, If you don't want to wait then close
ECHO this window and go looking for the key yourself
ECHO .....................
ECHO CommonKey is set as %CommonKey% ... If this does not start with D7B and end with 656 then you need
ECHO read the instructions again
PAUSE

for /F "usebackq tokens=*" %%A in ("%~dp0keys.txt") do (
java -jar "%~dp0JWUDTool.jar" -commonkey %CommonKey% -titleKey %%A -extract all -in %1 -out "%~dp0%~n1 wup"
)
pause