# 🎓 Gestor de Correlatividades Universitarias (Python)

Aplicación de escritorio y móvil desarrollada para gestionar y visualizar el plan de estudios de Ingeniería en Sistemas. Permite filtrar materias y verificar correlatividades de forma gráfica.

## 🚀 Características
* **Multiplataforma:** Código base único que se compila para **Windows (.exe)** y **Android (.apk)**.
* **Interfaz Gráfica:** Desarrollada con **Python** y librerías gráficas (Kivy/Tkinter).
* **Persistencia de Datos:** Guarda el progreso del alumno localmente.

## 🛠 Tecnologías Utilizadas
* **Lenguaje:** Python 3.
* **GUI:** Kivy / Tkinter.
* **Build Tools:**
    * **Google Colab + Buildozer:** Para la compilación de la versión Android (APK).
    * **PyInstaller:** Para la versión de escritorio (EXE).

## 📂 Estructura del Repositorio
* `main.py`: Código fuente principal de la aplicación.
* `Generador_APK.ipynb`: Notebook de Google Colab utilizado para el pipeline de compilación en Android.
