
global.show_start_form = false; // ocultar form
show_debug_message(" ID: " + string(global.player_id));
audio_play_sound(snd_music, 1, true);

global.questions = [
"La dirección anima a los empleados a trabajar de acuerdo con las reglas de seguridad- incluso cuando los tiempos de trabajo son ajustados",
"La dirección se asegura de que todos reciban la información necesaria sobre seguridad",
"La dirección hace la vista gorda cuando alguien es poco cuidadoso con la seguridad",
"La dirección valora la seguridad más que la producción",
"La dirección acepta que los empleados aquí se arriesgen cuando los tiempos de trabajo son ajustados",
"Quienes trabajamos aquí tenemos confianza en la capacidad de la dirección para manejar la seguridad",
"La dirección se asegura de que todos los problemas de seguridad que se detectan durante las inspecciones son corregidos inmediatamente",
"Cuando se detecta un riesgo, la dirección lo ignora y no hace nada",
"La dirección no tiene la capacidad de manejar la seguridad adecuadamente",
"La dirección se esfuerza para diseñar rutinas de seguridad que son significativas y que realmente funcionan",
"La dirección se asegura de que todos y cada uno puedan influir en la seguridad en su trabajo",
"La dirección anima a los empleados aquí a participar en las decisiones que afectan su seguridad",
"La dirección nunca tiene en cuenta las sugerencias de los empleados sobre la seguridad",
"La dirección se esfuerza para que todo el mundo en el lugar de trabajo tenga un alto nivel de competencia respeto a la seguridad y los riesgos",
"La dirección nunca pide a los empleados sus opiniones antes de tomar decisiones sobre la seguridad",
"La dirección involucra a los empleados en las decisiones sobre la seguridad",
"La dirección recoge información precisa en las investigaciones sobre accidentes",
"El miedo a las sanciones (consecuencias negativas) de la dirección desanima a los empleados aquí de informar sobre hechos que casi han provocado accidentes",
"La dirección escucha atentamente a todos los que han estado involucrados en un accidente",
"La dirección busca las causas, no a las personas culpables, cuando ocurre un accidente",
"La dirección siempre culpa de los accidentes a los empleados",
"La dirección trata a los empleados involucrados en un accidente de manera justa",
"Quienes trabajamos aquí nos esforzamos conjuntamente en alcanzar un alto nivel de seguridad",
"Quienes trabajamos aquí aceptamos conjuntamente la responsibilidad de asegurar que nuestro lugar de trabajo siempre esté ordenado",
"A quienes trabajamos aquí no nos importa la seguridad de los demás",
"Quienes trabajamos aquí evitamos combatir los riesgos detectados",
"Quienes trabajamos aquí nos ayudamos mutuamente a trabajar seguros",
"Quienes trabajamos aquí no aceptamos ninguna responsabilidad por la seguridad de los demás",
"Quienes trabajamos aquí vemos los riesgos como algo inevitable",
"Quienes trabajamos aquí consideramos los accidentes menores como una parte normal de nuestro trabajo diario",
"Quienes trabajamos aquí aceptamos los comportamientos de riesgo mientras no hayan accidentes",
"Quienes trabajamos aquí infringimos las reglas de seguridad para poder terminar el trabajo a tiempo",
"Quienes trabajamos aquí nunca aceptamos correr riesgos incluso cuando los tiempos de trabajo son ajustados",
"Quienes trabajamos aquí consideramos que nuestro trabajo no es adecuado para los cobardes",
"Quienes trabajamos aquí aceptamos correr riesgos en el trabajo",
"Quienes trabajamos aquí intentamos encontrar una solución si alguién nos indica un problema en la seguridad",
"Quienes trabajamos aquí nos sentimos seguros cuando trabajamos juntos",
"Quienes trabajamos aquí tenemos mucha confianza en nuestra mutua capacidad de garantizar la seguridad",
"Quienes trabajamos aquí aprendemos de nuestras experiencias para prevenir los accidentes",
"Quienes trabajamos aquí tomamos muy en serio las opiniones y sugerencias de los demás sobre la seguridad",
"Quienes trabajamos aquí raramente hablamos sobre la seguridad",
"Quienes trabajamos aquí siempre hablamos de temas de seguridad cuando éstos surgen",
"Quienes trabajamos aquí podemos hablar libre y abiertamente sobre la seguridad",
"Quienes trabajamos aquí consideramos que un buen representante de seguridad juega un papel importante en la prevención de accidentes",
"Quienes trabajamos aquí consideramos que las revisiones de seguridad no influyen en la seguridad en absoluto",
"Quienes trabajamos aquí consideramos que la formación en seguridad es buena para prevenir accidentes",
"Quienes trabajamos aquí consideramos que la planificación temprana de la seguridad no tiene sentido",
"Quienes trabajamos aquí considermos que las revisiones de seguridad ayudan a detectar serios riesgos",
"Quienes trabajamos aquí consideramos que la formación en seguridad no tiene sentido",
"Quienes trabajamos aquí consideramos que es importante que haya objetivos de seguridad claros",
];

// --- Secciones según rango ---
global.sections = [
    "1. Management safety priority and ability",
    "2. Management safety empowerment",
    "3. Management safety justice",
    "4. Workers' safety commitment",
    "5. Workers safety priority and risk non-acceptance",
    "6. Safety communication, learning and trust in co-workers safety competence",
    "7. Workers trust in efficiency of safety systems"
];

// --- Respuestas numéricas (1–4) ---
global.answers = array_create(50, 0);

// --- Control del flujo ---
global.current_question = -1;
global.show_question = false;
