🏗️ NOSACQ-50 GAME

Un proyecto interactivo basado en el cuestionario NOSACQ-50, diseñado para evaluar el nivel de cultura de seguridad en el trabajo a través de un videojuego educativo.
El sistema está compuesto por dos partes principales:

🎮 Juego (GameMaker Studio 2): donde los usuarios responden preguntas dentro de un entorno gamificado.

⚙️ Backend (FastAPI): encargado de recibir, almacenar y administrar los resultados de cada partida.

🚀 Estructura del Proyecto
NOSACQ-50_GAME/
│
├── backend/          # API desarrollada con FastAPI
│   ├── main.py       # Punto de entrada del servidor
│   ├── models/       # Modelos y esquemas de datos
│   └── database/     # Conexión y estructura de base de datos
│
└── game/             # Archivos del videojuego exportado desde GameMaker
    └── NOSACQ_50_GAME.exe

🌐 Despliegue en Render

El backend está desplegado en Render para permitir el registro remoto de los resultados.

Ingresar al siguiente enlace del servidor:
👉 https://backend-nosacq50.onrender.com

Para verificar que está activo, abre:

https://backend-nosacq50.onrender.com/results_table


Allí se mostrarán los resultados almacenados de las partidas.

💻 Ejecución Local

Si deseas ejecutar el sistema localmente:

Clona el repositorio

git clone https://github.com/Andrestack05/backend_nosacq50.git
cd backend_nosacq50/NOSACQ-50_GAME/backend


Crea un entorno virtual y activa

python -m venv venv
source venv/Scripts/activate  # En Windows


Instala las dependencias

pip install -r requirements.txt


Ejecuta el servidor

uvicorn main:app --reload


Accede en tu navegador

http://127.0.0.1:8000/docs


Configura el juego
En el archivo de GameMaker donde se envían los datos (por ejemplo, el script send_results), cambia la URL del servidor:

// Para modo local:
var api_url = "http://127.0.0.1:8000/results_table";

// Para modo en producción:
var api_url = "https://backend-nosacq50.onrender.com/results_table";

🧩 Características

Guardado automático de respuestas de los jugadores.

Interfaz visual y dinámica.

Compatible con despliegue local o remoto.

Visualización de resultados en /results_table.

🧠 Tecnologías Utilizadas
Componente	Tecnología
Backend	FastAPI (Python)
Base de datos	SQLite
Juego	GameMaker Studio 2
Despliegue	Render
Control de versiones	Git & GitHub

🧑‍💼 Autor

Andrés Suárez
📧 contacto: pablosuar505@gmail.com
🌐 GitHub: Andrestack05
