# 🎓 Gestor de Correlatividades Universitarias (Escritorio)

Aplicación de escritorio para gestionar y visualizar el plan de estudios (UTN, UNC, etc.). Permite llevar el control del estado académico, visualizando materias por niveles y verificando automáticamente el estado de las correlatividades.

## 🚀 Características
* **Control de Estado:** Marca materias como *No Cursada, Regular, Cursando* o *Aprobada*.
* **Validación de Correlatividades:** El sistema habilita o bloquea materias automáticamente según si cumples con las correlativas (regulares o aprobadas) necesarias.
* **Persistencia de Datos:** El progreso se guarda automáticamente en un archivo local (`estado_materias.json`), por lo que no pierdes tus datos al cerrar la app.
* **Interfaz Moderna:** Desarrollada con **CustomTkinter** para una apariencia limpia y amigable.
* **Portable:** Se puede compilar en un solo archivo `.exe` que no requiere instalación.

## 🛠 Tecnologías Utilizadas
* **Lenguaje:** Python 3.12+
* **Interfaz Gráfica (GUI):** CustomTkinter
* **Compilación:** PyInstaller (vía script automatizado)
* **Datos:** JSON (Almacenamiento local)

## 📂 Estructura del Proyecto
* `main.py`: Código fuente principal de la aplicación.
* `crear_exe.bat`: Script automatizado para compilar el proyecto a `.exe` en un solo clic.
* `estado_materias.json`: Archivo generado automáticamente donde se guardan tus materias (se crea al usar la app).

## 💿 Como generar el Ejecutable (.exe)

Si descargaste el código fuente y quieres crear tu propio ejecutable para Windows:

1. Asegúrate de tener **Python** instalado (marcando la casilla "Add to PATH").
2. Coloca `main.py` y `crear_exe.bat` en la mi<img width="1359" height="717" alt="App" src="https://github.com/user-attachments/assets/aac15f78-cd1c-460b-964c-af2c533969e6" />
sma carpeta.
3. Haz doble clic en **`crear_exe.bat`**.
4. ¡Listo! El script instalará las dependencias necesarias, compilará el programa y te dejará el archivo `.exe` listo para usar en esa misma carpeta.

## 📋 Requisitos para correr desde código (sin compilar)
Si prefieres ejecutar el script `main.py` directamente desde tu editor:
```bash
pip install customtkinter pyinstaller
python main.py


