@echo off

set "folder=%cd%"

:input_url
echo. 
echo ~~~~~~~~~~~~~~~~~~~~~~~~~yt-dlp~~~~~~~~~~~~~~
set /p "url=Avast ye! Enter ye olde URL, matey: "

:input_mode
echo.
echo 1. Video Plunderin
echo 2. Audio Lootin
set /p "mode=What say ye, matey? "


if %mode% == 1 (
  cd /d %folder%
  yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %url%
  start %folder%
  pause
  cls
) else if %mode% == 2 (
  cd /d %folder%
  yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 %url%
  start %folder%
  pause
  cls
) else (
  echo Ahoy ye scallywag! Read ye instructions proper like, next time ye blunderin' bilge rat
  goto input_mode
)

goto input_url
