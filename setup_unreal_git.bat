@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Ask for repo name
set /p REPO_NAME="Enter your project/repo name (e.g. DarkLoop): "

:: Init git
echo Initializing Git repo...
git init

:: Setup Git LFS
echo Installing Git LFS...
git lfs install

:: Track asset file types
echo Tracking Unreal asset types with Git LFS...
git lfs track "*.uasset" "*.umap" "*.fbx" "*.png" "*.jpg" "*.tga" "*.wav" "*.mp3" "*.ogg"

:: Create .gitattributes
echo Writing .gitattributes...
(
echo *.uasset filter=lfs diff=lfs merge=lfs -text
echo *.umap filter=lfs diff=lfs merge=lfs -text
echo *.fbx filter=lfs diff=lfs merge=lfs -text
echo *.png filter=lfs diff=lfs merge=lfs -text
echo *.jpg filter=lfs diff=lfs merge=lfs -text
echo *.tga filter=lfs diff=lfs merge=lfs -text
echo *.wav filter=lfs diff=lfs merge=lfs -text
echo *.mp3 filter=lfs diff=lfs merge=lfs -text
echo *.ogg filter=lfs diff=lfs merge=lfs -text
) > .gitattributes

:: Create .gitignore
echo Writing .gitignore...
(
echo Binaries/
echo Build/
echo Intermediate/
echo Saved/
echo DerivedDataCache/
echo .vscode/
echo .idea/
echo *.log
echo *.tmp
echo .DS_Store
echo Thumbs.db
echo desktop.ini
echo *.exe
echo *.dll
echo *.lib
echo *.so
echo *.dylib
echo *.app
) > .gitignore

:: Initial commit
git add .
git commit -m "Initial commit for %REPO_NAME% Unreal project with Git + LFS"

:: Done
echo.
echo ✅ Project '%REPO_NAME%' is now set up with Git and LFS!
echo 👉 Next: Create a GitHub repo and run:
echo git remote add origin https://github.com/YOUR_USERNAME/%REPO_NAME%.git
echo git push -u origin main

pause
