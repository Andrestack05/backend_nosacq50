# 🏗️ NOSACQ-50 GAME

Un proyecto interactivo basado en el cuestionario NOSACQ-50, diseñado para evaluar el nivel de cultura de seguridad en el trabajo a través de un videojuego educativo.

## 📋 Descripción

El sistema está compuesto por dos partes principales:

- 🎮 **Juego** (GameMaker Studio 2): Donde los usuarios responden preguntas dentro de un entorno gamificado.
- ⚙️ **Backend** (FastAPI): Encargado de recibir, almacenar y administrar los resultados de cada partida.

## 🚀 Estructura del Proyecto

```
NOSACQ-50_GAME/
│
├── backend/          # API desarrollada con FastAPI
│   ├── main.py      # Punto de entrada del servidor
│   ├── models/      # Modelos y esquemas de datos
│   └── database/    # Conexión y estructura de base de datos
│
└── game/            # Archivos del videojuego
    └── NOSACQ_50_GAME.exe
```

## 🌐 Despliegue en Render

El backend está desplegado en Render para permitir el registro remoto de los resultados.

### Enlaces importantes:

- 🔗 Servidor: [https://backend-nosacq50.onrender.com](https://backend-nosacq50.onrender.com)
- 📊 Resultados: [https://backend-nosacq50.onrender.com/results_table](https://backend-nosacq50.onrender.com/results_table)

## 💻 Ejecución Local

### 1. Clonar el repositorio

```bash
git clone https://github.com/Andrestack05/backend_nosacq50.git
cd backend_nosacq50/NOSACQ-50_GAME/backend
```

### 2. Crear y activar entorno virtual

```bash
python -m venv venv
source venv/Scripts/activate  # En Windows
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 4. Ejecutar el servidor

```bash
uvicorn main:app --reload
```

### 5. Acceder a la documentación

Visita [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

### 6. Configuración del juego

En el archivo de GameMaker donde se envían los datos, configura la URL del servidor:

```javascript
// Para modo local:
var api_url = "http://127.0.0.1:8000/results_table";

// Para modo en producción:
var api_url = "https://backend-nosacq50.onrender.com/results_table";
```

## 🧩 Características

- ✅ Guardado automático de respuestas
- 🎨 Interfaz visual y dinámica
- 🔄 Compatible con despliegue local o remoto
- 📊 Visualización de resultados en `/results_table`

## 🛠️ Tecnologías Utilizadas

| Componente           | Tecnología         |
| -------------------- | ------------------ |
| Backend              | FastAPI (Python)   |
| Base de datos        | SQLite             |
| Juego                | GameMaker Studio 2 |
| Despliegue           | Render             |
| Control de versiones | Git & GitHub       |

## 👤 Autor

**Andrés Suárez**

- 📧 Email: pablosuar505@gmail.com
- 🌐 GitHub: [@Andrestack05](https://github.com/Andrestack05)
