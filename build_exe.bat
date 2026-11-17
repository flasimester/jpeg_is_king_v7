@echo off
REM One-click build of jpeg_is_king.exe: installs packages, bundles FFmpeg, builds, then tests the result.
REM Add --onedir for a faster-starting folder build, or --sample "C:\path\photo.ARW" to test a real file.
python -m pip install -r requirements.txt
if errorlevel 1 goto :err
python build_exe.py %*
if errorlevel 1 goto :err
echo.
echo Finished. See dist\selftest.txt for the test report.
pause
exit /b 0
:err
echo.
echo Build failed - read the messages above.
pause
exit /b 1
