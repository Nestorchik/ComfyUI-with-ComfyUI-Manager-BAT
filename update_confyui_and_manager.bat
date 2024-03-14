echo off
REM This file update only git-versions of "ComfyUI" + "ComfyUI-Manager".
cls
echo Make sure that GIT is in the PATH
set startDir=%CD%
set comfy=%startDir%\ComfyUI
set venv=%comfy%\venv
set scripts=%venv%\Scripts
echo ===================================
echo Updating "ComfyUI" via GIT
echo ===================================
cd %comfy%
git pull
cd %startDir%
echo ===================================
echo Updating "ComfyUI-Manager" via GIT
echo ===================================
cd %comfy%\custom_nodes
git pull
cd %startDir%
echo ===================================
echo Complete Update
echo ===================================
pause
