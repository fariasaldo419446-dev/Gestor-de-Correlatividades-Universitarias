@echo off
setlocal

REM --- CONFIGURACIÓN ---
REM Define aquí el nombre de tu script (sin la extensión .py)
set "NOMBRE_APP=main"
REM Define la ruta de destino
set "CARPETA=E:\PAPIS\Programas\Archivos Py\Pruebas previas\App escritorio"

REM 1. Crear carpeta si no existe
if not exist "%CARPETA%" (
    mkdir "%CARPETA%"
    echo [+] Carpeta creada: %CARPETA%
) else (
    echo [i] La carpeta ya existe.
)

REM 2. Verificar si el archivo origen existe antes de copiar
if not exist "%NOMBRE_APP%.py" (
    echo [ERROR] No se encuentra "%NOMBRE_APP%.py" en el directorio actual.
    pause
    exit /b
)

REM 3. Copiar script
copy "%NOMBRE_APP%.py" "%CARPETA%" >nul
echo [+] Archivo %NOMBRE_APP%.py copiado.

REM 4. Cambiar a carpeta de destino
cd /d "%CARPETA%"

REM 5. Crear entorno virtual si no existe (ahorra tiempo si ya existe)
if not exist "venv" (
    echo [i] Creando entorno virtual...
    python -m venv venv
)

REM 6. Activar entorno virtual
call venv\Scripts\activate.bat

REM 7. Instalar dependencias
REM Solo instalamos si no detectamos que ya estén (opcional, pero ahorra tiempo)
echo [i] Verificando e instalando librerias...
pip install --disable-pip-version-check pyinstaller customtkinter

REM 8. Crear .exe con PyInstaller
REM --noconfirm: Sobreescribe si ya existe sin preguntar
REM --clean: Limpia caché de PyInstaller para evitar errores de builds previos
echo [i] Generando ejecutable...
pyinstaller --noconfirm --onefile --windowed --clean --name "%NOMBRE_APP%" "%NOMBRE_APP%.py"

REM 9. Mover .exe y limpiar
if exist "dist\%NOMBRE_APP%.exe" (
    move /Y "dist\%NOMBRE_APP%.exe" . >nul
    echo [+] Ejecutable movido correctamente.
) else (
    echo [ERROR] No se genero el .exe correctamente.
    pause
    exit /b
)

REM Limpieza
rd /s /q build
rd /s /q dist
del "%NOMBRE_APP%.spec"

echo ---------------------------------------------------
echo PROCESO TERMINADO CON EXITO
echo Ejecutable listo en: %CARPETA%\%NOMBRE_APP%.exe
echo ---------------------------------------------------

pause
endlocal