@echo off
setlocal

REM =================================================================
REM CONFIGURACIÓN UNIVERSAL
REM =================================================================

REM 1. Nombre del archivo Python (debe estar en la misma carpeta que este script)
REM Si tu archivo se llama "Gestor Correlatividades.py", pon ese nombre aquí.
set "NOMBRE_APP=Gestor Correlatividades"

REM =================================================================
REM LOGICA AUTOMATICA (NO TOCAR DEBAJO)
REM =================================================================

REM %~dp0 es una variable mágica de Windows que significa:
REM "La ruta donde está guardado este archivo .bat ahora mismo"
set "RUTA_ACTUAL=%~dp0"
cd /d "%RUTA_ACTUAL%"

echo ---------------------------------------------------
echo  CONVERTIDOR UNIVERSAL A .EXE
echo  Directorio de trabajo: %RUTA_ACTUAL%
echo ---------------------------------------------------

REM 1. Validar que Python esté instalado (Vital por lo que te pasó antes)
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR CRITICO] Python no esta detectado en el sistema.
    echo Por favor, instala Python marcando "Add to PATH".
    pause
    exit /b
)

REM 2. Buscar el archivo Python
if not exist "%NOMBRE_APP%.py" (
    echo.
    echo [ERROR] No encuentro el archivo: "%NOMBRE_APP%.py"
    echo Asegurate de que el .py y este .bat esten en la misma carpeta.
    pause
    exit /b
)

REM 3. Crear entorno virtual temporal (si no existe)
if not exist "venv_installer" (
    echo [i] Creando entorno virtual temporal...
    python -m venv venv_installer
)

REM 4. Activar y preparar
call venv_installer\Scripts\activate.bat
echo [i] Instalando PyInstaller y CustomTkinter...
pip install --disable-pip-version-check pyinstaller customtkinter >nul

REM 5. Generar el ejecutable
echo [i] Compilando (esto puede tardar unos segundos)...
REM --noconsole: Quita la pantalla negra de fondo al abrir la app
pyinstaller --noconfirm --onefile --windowed --clean --collect-all customtkinter --name "%NOMBRE_APP%" "%NOMBRE_APP%.py"

REM 6. Mover el resultado y limpiar
if exist "dist\%NOMBRE_APP%.exe" (
    move /Y "dist\%NOMBRE_APP%.exe" . >nul
    echo.
    echo [EXITO] Tu ejecutable ha sido creado: %NOMBRE_APP%.exe
) else (
    echo.
    echo [ERROR] Algo fallo durante la compilacion.
    pause
    exit /b
)

REM 7. Limpieza agresiva (Borrar basura generada)
echo [i] Limpiando archivos temporales...
rd /s /q build
rd /s /q dist
rd /s /q venv_installer
del "%NOMBRE_APP%.spec"

echo.
echo ---------------------------------------------------
echo  PROCESO TERMINADO. PUEDES CERRAR ESTA VENTANA.
echo ---------------------------------------------------
pause
endlocal
echo Ejecutable listo en: %CARPETA%\%NOMBRE_APP%.exe
echo ---------------------------------------------------

pause

endlocal
