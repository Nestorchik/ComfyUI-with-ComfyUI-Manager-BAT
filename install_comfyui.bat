echo off
REM This file installs the git-version of "ComfyUI" + "ComfyUI-Manager" with "torch-cuda" for NVIDIA videocards.
cls
echo Make sure that GIT is in the PATH
echo Change "python=c:\p31\python.exe" to the actual location of python 3.10 in the system.
set python=c:\p31\python.exe
set startDir=%CD%
set comfy=%startDir%\ComfyUI
set venv=%comfy%\venv
set scripts=%venv%\Scripts
echo ======================================
echo Downloading "ComfyUI"
echo ======================================
git clone https://github.com/comfyanonymous/ComfyUI.git
echo ======================================
echo Installing VENV for ComfyUI
%python% -m venv %venv%
echo ======================================
echo Updating PIP version
%scripts%\python -m pip install --upgrade pip
echo ======================================
echo Installing ComfyUI python packages
%scripts%\python -m pip install -r %comfy%\requirements.txt
echo ======================================
echo Uninstalling CPU python packages
%scripts%\python -m pip uninstall torch -y
echo ======================================
echo Installing GPU-cuda TORCH python packages
%scripts%\python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
echo ======================================
REM echo Installing GPU-cuda xFormers python packages
REM %scripts%\python -m pip install -U xformers==0.0.23.post1 --index-url https://download.pytorch.org/whl/cu121
REM echo ======================================
echo Installing ComfyUI-Manager custom_node
cd %comfy%\custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd %startDir%
echo ======================================
echo Installing ComfyUI-Manager python packages
%scripts%\python -m pip install -r %comfy%\custom_nodes\ComfyUI-Manager\requirements.txt
echo ======================================
echo Installing sucessful
echo ======================================
echo Don't forget to upload or copy the models to the "ComfyUI\models\checkpoints" folder!
echo ==================================
echo Starting ComfyUI
echo ==================================
echo
%scripts%\python %comfy%\main.py
pause
