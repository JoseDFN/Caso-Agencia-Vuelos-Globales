# Introducción

En el mundo actual, el desarrollo de software es fundamental para el funcionamiento eficiente y seguro de una aerolínea. La tecnología ha revolucionado la forma en que las aerolíneas operan, desde la gestión de vuelos y el mantenimiento de aeronaves hasta la experiencia del cliente. En una industria donde la puntualidad, la seguridad y la satisfacción del cliente son cruciales, el software se convierte en un aliado indispensable.

Las aerolíneas se enfrentan a numerosos desafíos que requieren soluciones tecnológicas avanzadas. Estos desafíos incluyen la gestión de una vasta cantidad de datos, la optimización de rutas de vuelo, el mantenimiento predictivo de aeronaves y la mejora de la experiencia del pasajero. Para abordar estos desafíos, las aerolíneas necesitan sistemas de software robustos, integrados y escalables.

# Caso Agencia Vuelos Globales

<img src="C:\Users\developer\Downloads\agencia.webp" alt="agencia" style="zoom:33%;" />

**Vuelos Globales** opera vuelos a nivel internacional y cuenta con una flota de aviones, tripulación variada, múltiples aerolíneas asociadas y una vasta red de aeropuertos y ciudades de destino. La empresa requiere una base de datos robusta para gestionar todos los aspectos de su operación, desde la reserva de vuelos hasta el mantenimiento de los aviones y la administración de la tripulación.

A continuación se suministra una base de datos existente de la agencia la cual debe ser analizada para determinar si se continua usado u se reemplaza por una nueva base de datos.

![airport](C:\Users\developer\Desktop\airport.png)

# Requerimientos de la Base de Datos

1. **Gestión de Aviones y Modelos**:
   - Registrar información sobre los aviones, incluyendo número de matrícula, capacidad, fecha de fabricación, estado, aerolínea, modelo y fabricante.
   - Realizar un seguimiento del historial de revisiones de cada avión.
2. **Mantenimiento y Revisiones**:
   - Mantener un registro detallado de todas las revisiones realizadas a los aviones, incluyendo la fecha, el empleado responsable y los detalles específicos de cada revisión.
3. **Gestión de Tripulación**:
   - Administrar los datos de los empleados, sus roles, fechas de ingreso y asignaciones a aerolíneas y aeropuertos específicos.
   - Gestionar la asignación de la tripulación a diferentes trayectos y escalas.
4. **Gestión de Rutas y Escalas**:
   - Registrar información sobre los trayectos, incluyendo la fecha del trayecto, valor, ciudad de origen y destino.
   - Gestionar las escalas asociadas a cada trayecto, incluyendo el aeropuerto y número de vuelo correspondiente.
5. **Reservas y Clientes**:
   - Gestionar la información de las reservas de vuelos, incluyendo la fecha y trayecto asociado.
   - Mantener un registro detallado de los clientes, sus edades y tipos de documentos.
   - Registrar detalles específicos de cada reserva, incluyendo el cliente, tarifa y valor de la tarifa.
6. **Tarifas y Tipos de Documentos**:
   - Administrar los diferentes tipos de tarifas de vuelo y sus valores asociados.
   - Gestionar los tipos de documentos de identidad aceptados para los clientes.

## Problemas y Desafíos Específicos

- Optimización de consultas SQL para reportes de vuelos, estados de revisión y asignaciones de tripulación.
- Integridad y consistencia de los datos relacionados con las múltiples relaciones entre entidades como aviones, tripulación y rutas.
- Mantenimiento de la seguridad de los datos sensibles de los clientes y la tripulación.
- Escalabilidad de la base de datos para manejar un creciente volumen de datos debido a la expansión de la empresa.

### Objetivos

1. **Desarrollo de Consultas SQL Eficientes**:
   - Crear consultas SQL optimizadas para obtener reportes de estado de aviones, historial de revisiones, asignaciones de tripulación y detalles de reservas.
2. **Mejora de la Estructura de la Base de Datos**:
   - Revisar y mejorar el diseño de la base de datos para asegurar integridad referencial y optimización del rendimiento.
3. **Automatización de Procesos**:
   - Implementar procedimientos almacenados y triggers para automatizar tareas comunes como la actualización de estados de revisión y notificaciones de reservas.
4. **Análisis de Datos**:
   - Desarrollar vistas y reportes que permitan a la administración tomar decisiones informadas sobre la operación y expansión de la empresa.

## Soluciones Propuestas

- **Normalización de Datos**: Asegurar que la base de datos esté correctamente normalizada para evitar redundancias y mejorar la eficiencia.
- **Índices y Claves Foráneas**: Implementar índices adecuados y claves foráneas para mejorar el tiempo de respuesta de las consultas.
- **Seguridad**: Implementar medidas de seguridad para proteger los datos sensibles, incluyendo cifrado y control de acceso basado en roles.

**Vuelos Globales** espera que con estas mejoras en su sistema de base de datos, puedan operar de manera más eficiente, segura y escalable, asegurando un servicio de alta calidad a sus clientes y un manejo óptimo de sus recursos. La agencia desea crear una aplicación que le permita a los diferentes usuarios administrar la agencia; a continuación se relacionan los diferentes casos de uso requeridos por los usuarios:

# Casos de uso

## Caso de Uso 1: Registrar Avión

**Descripción:** Permite registrar un nuevo avión en el sistema con todos sus detalles.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Registrar Avión" en el menú principal.
  2. El sistema solicita al administrador ingresar los detalles del avión: matrícula, capacidad, fecha de fabricación, estado, aerolínea, modelo.
  3. El administrador ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda el nuevo avión en la base de datos.
  6. El sistema confirma el registro exitoso del avión.
- **Postcondiciones:** El avión es registrado y almacenado en la base de datos.
- **Excepciones:**
  - Si la matrícula del avión ya existe, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 2: Asignar Tripulación a Trayecto

**Descripción:** Permite asignar empleados a un trayecto específico.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Asignar Tripulación" en el menú principal.
  2. El sistema muestra una lista de trayectos disponibles.
  3. El administrador selecciona un trayecto.
  4. El sistema muestra una lista de empleados disponibles.
  5. El administrador selecciona los empleados a asignar al trayecto.
  6. El sistema guarda la asignación en la base de datos.
  7. El sistema confirma la asignación exitosa de la tripulación.
- **Postcondiciones:** Los empleados seleccionados son asignados al trayecto en la base de datos.
- **Excepciones:**
  - Si el trayecto seleccionado no existe, el sistema muestra un mensaje de error.
  - Si no hay empleados disponibles, el sistema muestra un mensaje de error.

## Caso de Uso 3: Crear Reserva de Vuelo

**Descripción:** Permite crear una nueva reserva de vuelo para un cliente.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Crear Reserva" en el menú principal.
  2. El sistema solicita al agente ingresar los detalles de la reserva: cliente, trayecto, fecha, tarifa.
  3. El agente ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda la nueva reserva en la base de datos.
  6. El sistema confirma la creación exitosa de la reserva.
- **Postcondiciones:** La reserva es registrada y almacenada en la base de datos.
- **Excepciones:**
  - Si el cliente no está registrado, el sistema muestra un mensaje de error.
  - Si el trayecto seleccionado no existe, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 4: Registrar Revisión de Mantenimiento

**Descripción:** Permite registrar una revisión de mantenimiento para un avión.

- **Actor Principal:** Técnico de Mantenimiento
- **Precondiciones:** El usuario debe tener privilegios de técnico de mantenimiento.
- **Flujo Principal:**
  1. El técnico selecciona la opción "Registrar Revisión" en el menú principal.
  2. El sistema solicita al técnico ingresar los detalles de la revisión: avión, fecha, descripción, empleado responsable.
  3. El técnico ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda la nueva revisión en la base de datos.
  6. El sistema confirma el registro exitoso de la revisión.
- **Postcondiciones:** La revisión es registrada y almacenada en la base de datos.
- **Excepciones:**
  - Si el avión seleccionado no existe, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 5: Consultar Información de Cliente

**Descripción:** Permite consultar la información de un cliente registrado.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Consultar Cliente" en el menú principal.
  2. El sistema solicita al agente ingresar el identificador del cliente.
  3. El agente ingresa el identificador del cliente.
  4. El sistema busca la información del cliente en la base de datos.
  5. El sistema muestra la información del cliente.
- **Postcondiciones:** La información del cliente es mostrada al agente.
- **Excepciones:**
  - Si el cliente no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 6: Consultar Reserva de Vuelo

**Descripción:** Permite consultar las reservas de vuelo de un cliente o de un trayecto específico.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Consultar Reserva" en el menú principal.
  2. El sistema solicita al agente ingresar el identificador del cliente o del trayecto.
  3. El agente ingresa el identificador solicitado.
  4. El sistema busca las reservas en la base de datos.
  5. El sistema muestra las reservas encontradas.
- **Postcondiciones:** Las reservas son mostradas al agente.
- **Excepciones:**
  - Si no se encuentran reservas, el sistema muestra un mensaje de error.

## Caso de Uso 7: Registrar Cliente

**Descripción:** Permite registrar un nuevo cliente en el sistema.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Registrar Cliente" en el menú principal.
  2. El sistema solicita al agente ingresar los detalles del cliente: nombre, edad, tipo de documento, número de documento.
  3. El agente ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda el nuevo cliente en la base de datos.
  6. El sistema confirma el registro exitoso del cliente.
- **Postcondiciones:** El cliente es registrado y almacenado en la base de datos.
- **Excepciones:**
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 8: Consultar Información de Avión

**Descripción:** Permite consultar la información de un avión registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Consultar Avión" en el menú principal.
  2. El sistema solicita al administrador ingresar la matrícula del avión.
  3. El administrador ingresa la matrícula del avión.
  4. El sistema busca la información del avión en la base de datos.
  5. El sistema muestra la información del avión.
- **Postcondiciones:** La información del avión es mostrada al administrador.
- **Excepciones:**
  - Si el avión no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 9: Consultar Información de Trayecto

**Descripción:** Permite consultar la información de un trayecto específico.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Consultar Trayecto" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador del trayecto.
  3. El administrador ingresa el identificador del trayecto.
  4. El sistema busca la información del trayecto en la base de datos.
  5. El sistema muestra la información del trayecto.
- **Postcondiciones:** La información del trayecto es mostrada al administrador.
- **Excepciones:**
  - Si el trayecto no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 10: Registrar Aeropuerto

**Descripción:** Permite registrar un nuevo aeropuerto en el sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Registrar Aeropuerto" en el menú principal.
  2. El sistema solicita al administrador ingresar los detalles del aeropuerto: ID, nombre, ciudad, país.
  3. El administrador ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda el nuevo aeropuerto en la base de datos.
  6. El sistema confirma el registro exitoso del aeropuerto.
- **Postcondiciones:** El aeropuerto es registrado y almacenado en la base de datos.
- **Excepciones:**
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 11: Consultar Información de Aeropuerto

**Descripción:** Permite consultar la información de un aeropuerto registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Consultar Aeropuerto" en el menú principal.
  2. El sistema solicita al administrador ingresar el ID del aeropuerto.
  3. El administrador ingresa el ID del aeropuerto.
  4. El sistema busca la información del aeropuerto en la base de datos.
  5. El sistema muestra la información del aeropuerto.
- **Postcondiciones:** La información del aeropuerto es mostrada al administrador.
- **Excepciones:**
  - Si el aeropuerto no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 12: Consultar Historial de Revisiones de Avión

**Descripción:** Permite consultar el historial de revisiones de mantenimiento de un avión específico.

- **Actor Principal:** Técnico de Mantenimiento
- **Precondiciones:** El usuario debe tener privilegios de técnico de mantenimiento.
- **Flujo Principal:**
  1. El técnico selecciona la opción "Consultar Historial de Revisiones" en el menú principal.
  2. El sistema solicita al técnico ingresar la matrícula del avión.
  3. El técnico ingresa la matrícula del avión.
  4. El sistema busca el historial de revisiones en la base de datos.
  5. El sistema muestra el historial de revisiones del avión.
- **Postcondiciones:** El historial de revisiones del avión es mostrado al técnico.
- **Excepciones:**
  - Si el avión no tiene revisiones registradas, el sistema muestra un mensaje de error.

## Caso de Uso 13: Actualizar Información de Cliente

**Descripción:** Permite actualizar la información de un cliente registrado.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Actualizar Cliente" en el menú principal.
  2. El sistema solicita al agente ingresar el identificador del cliente.
  3. El agente ingresa el identificador del cliente.
  4. El sistema muestra la información actual del cliente.
  5. El agente ingresa los nuevos detalles del cliente.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del cliente en la base de datos.
  8. El sistema confirma la actualización exitosa del cliente.
- **Postcondiciones:** La información del cliente es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el cliente no está registrado, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 14: Eliminar Reserva de Vuelo

**Descripción:** Permite eliminar una reserva de vuelo existente.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Eliminar Reserva" en el menú principal.
  2. El sistema solicita al agente ingresar el identificador de la reserva.
  3. El agente ingresa el identificador de la reserva.
  4. El sistema valida la existencia de la reserva.
  5. El sistema elimina la reserva de la base de datos.
  6. El sistema confirma la eliminación exitosa de la reserva.
- **Postcondiciones:** La reserva es eliminada de la base de datos.
- **Excepciones:**
  - Si la reserva no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 15: Actualizar Información de Avión

**Descripción:** Permite actualizar la información de un avión registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Avión" en el menú principal.
  2. El sistema solicita al administrador ingresar la matrícula del avión.
  3. El administrador ingresa la matrícula del avión.
  4. El sistema muestra la información actual del avión.
  5. El administrador ingresa los nuevos detalles del avión.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del avión en la base de datos.
  8. El sistema confirma la actualización exitosa del avión.
- **Postcondiciones:** La información del avión es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el avión no está registrado, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 16: Eliminar Avión

**Descripción:** Permite eliminar un avión del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Avión" en el menú principal.
  2. El sistema solicita al administrador ingresar la matrícula del avión.
  3. El administrador ingresa la matrícula del avión.
  4. El sistema valida la existencia del avión.
  5. El sistema elimina el avión de la base de datos.
  6. El sistema confirma la eliminación exitosa del avión.
- **Postcondiciones:** El avión es eliminado de la base de datos.
- **Excepciones:**
  - Si el avión no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 17: Asignar Aeronave a Trayecto

**Descripción:** Permite asignar una aeronave a un trayecto específico.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Asignar Aeronave a Trayecto" en el menú principal.
  2. El sistema muestra una lista de trayectos disponibles.
  3. El administrador selecciona un trayecto.
  4. El sistema muestra una lista de aeronaves disponibles.
  5. El administrador selecciona una aeronave para el trayecto.
  6. El sistema guarda la asignación en la base de datos.
  7. El sistema confirma la asignación exitosa de la aeronave.
- **Postcondiciones:** La aeronave es asignada al trayecto en la base de datos.
- **Excepciones:**
  - Si el trayecto seleccionado no existe, el sistema muestra un mensaje de error.
  - Si no hay aeronaves disponibles, el sistema muestra un mensaje de error.

## Caso de Uso 18: Actualizar Información de Trayecto

**Descripción:** Permite actualizar la información de un trayecto registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Trayecto" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador del trayecto.
  3. El administrador ingresa el identificador del trayecto.
  4. El sistema muestra la información actual del trayecto.
  5. El administrador ingresa los nuevos detalles del trayecto.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del trayecto en la base de datos.
  8. El sistema confirma la actualización exitosa del trayecto.
- **Postcondiciones:** La información del trayecto es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el trayecto no está registrado, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 19: Eliminar Trayecto

**Descripción:** Permite eliminar un trayecto del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Trayecto" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador del trayecto.
  3. El administrador ingresa el identificador del trayecto.
  4. El sistema valida la existencia del trayecto.
  5. El sistema elimina el trayecto de la base de datos.
  6. El sistema confirma la eliminación exitosa del trayecto.
- **Postcondiciones:** El trayecto es eliminado de la base de datos.
- **Excepciones:**
  - Si el trayecto no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 20: Actualizar Información de Aeropuerto

**Descripción:** Permite actualizar la información de un aeropuerto registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Aeropuerto" en el menú principal.
  2. El sistema solicita al administrador ingresar el ID del aeropuerto.
  3. El administrador ingresa el ID del aeropuerto.
  4. El sistema muestra la información actual del aeropuerto.
  5. El administrador ingresa los nuevos detalles del aeropuerto.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del aeropuerto en la base de datos.
  8. El sistema confirma la actualización exitosa del aeropuerto.
- **Postcondiciones:** La información del aeropuerto es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el aeropuerto no está registrado, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 21: Eliminar Aeropuerto

**Descripción:** Permite eliminar un aeropuerto del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Aeropuerto" en el menú principal.
  2. El sistema solicita al administrador ingresar el ID del aeropuerto.
  3. El administrador ingresa el ID del aeropuerto.
  4. El sistema valida la existencia del aeropuerto.
  5. El sistema elimina el aeropuerto de la base de datos.
  6. El sistema confirma la eliminación exitosa del aeropuerto.
- **Postcondiciones:** El aeropuerto es eliminado de la base de datos.
- **Excepciones:**
  - Si el aeropuerto no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 22: Actualizar Información de Cliente

**Descripción:** Permite actualizar la información de un cliente registrado.

- **Actor Principal:** Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de agente de ventas.
- **Flujo Principal:**
  1. El agente de ventas selecciona la opción "Actualizar Cliente" en el menú principal.
  2. El sistema solicita al agente ingresar el identificador del cliente.
  3. El agente ingresa el identificador del cliente.
  4. El sistema muestra la información actual del cliente.
  5. El agente ingresa los nuevos detalles del cliente.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del cliente en la base de datos.
  8. El sistema confirma la actualización exitosa del cliente.
- **Postcondiciones:** La información del cliente es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el cliente no está registrado, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 23: Consultar Información de Vuelo

**Descripción:** Permite consultar la información de un vuelo específico.

- **Actor Principal:** Administrador del Sistema, Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de administrador o agente de ventas.
- **Flujo Principal:**
  1. El usuario selecciona la opción "Consultar Vuelo" en el menú principal.
  2. El sistema solicita al usuario ingresar el número de vuelo.
  3. El usuario ingresa el número de vuelo.
  4. El sistema busca la información del vuelo en la base de datos.
  5. El sistema muestra la información del vuelo.
- **Postcondiciones:** La información del vuelo es mostrada al usuario.
- **Excepciones:**
  - Si el vuelo no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 24: Actualizar Información de Revisión

**Descripción:** Permite actualizar la información de una revisión de mantenimiento.

- **Actor Principal:** Técnico de Mantenimiento
- **Precondiciones:** El usuario debe tener privilegios de técnico de mantenimiento.
- **Flujo Principal:**
  1. El técnico selecciona la opción "Actualizar Revisión" en el menú principal.
  2. El sistema solicita al técnico ingresar el identificador de la revisión.
  3. El técnico ingresa el identificador de la revisión.
  4. El sistema muestra la información actual de la revisión.
  5. El técnico ingresa los nuevos detalles de la revisión.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información de la revisión en la base de datos.
  8. El sistema confirma la actualización exitosa de la revisión.
- **Postcondiciones:** La información de la revisión es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si la revisión no está registrada, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 25: Eliminar Revisión de Mantenimiento

**Descripción:** Permite eliminar una revisión de mantenimiento del sistema.

- **Actor Principal:** Técnico de Mantenimiento
- **Precondiciones:** El usuario debe tener privilegios de técnico de mantenimiento.
- **Flujo Principal:**
  1. El técnico selecciona la opción "Eliminar Revisión" en el menú principal.
  2. El sistema solicita al técnico ingresar el identificador de la revisión.
  3. El técnico ingresa el identificador de la revisión.
  4. El sistema valida la existencia de la revisión.
  5. El sistema elimina la revisión de la base de datos.
  6. El sistema confirma la eliminación exitosa de la revisión.
- **Postcondiciones:** La revisión es eliminada de la base de datos.
- **Excepciones:**
  - Si la revisión no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 26: Consultar Asignación de Tripulación

**Descripción:** Permite consultar la asignación de tripulación para un trayecto específico.

- **Actor Principal:** Administrador del Sistema, Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de administrador o agente de ventas.
- **Flujo Principal:**
  1. El usuario selecciona la opción "Consultar Asignación de Tripulación" en el menú principal.
  2. El sistema solicita al usuario ingresar el identificador del trayecto.
  3. El usuario ingresa el identificador del trayecto.
  4. El sistema busca las asignaciones de tripulación en la base de datos.
  5. El sistema muestra la información de la tripulación asignada al trayecto.
- **Postcondiciones:** La información de la tripulación asignada es mostrada al usuario.
- **Excepciones:**
  - Si el trayecto no tiene tripulación asignada, el sistema muestra un mensaje de error.

## Caso de Uso 27: Consultar Escalas de un Trayecto

**Descripción:** Permite consultar las escalas asociadas a un trayecto específico.

- **Actor Principal:** Administrador del Sistema, Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de administrador o agente de ventas.
- **Flujo Principal:**
  1. El usuario selecciona la opción "Consultar Escalas de un Trayecto" en el menú principal.
  2. El sistema solicita al usuario ingresar el identificador del trayecto.
  3. El usuario ingresa el identificador del trayecto.
  4. El sistema busca las escalas asociadas en la base de datos.
  5. El sistema muestra la información de las escalas asociadas al trayecto.
- **Postcondiciones:** La información de las escalas asociadas es mostrada al usuario.
- **Excepciones:**
  - Si el trayecto no tiene escalas registradas, el sistema muestra un mensaje de error.

## Caso de Uso 28: Actualizar Información de Escala

**Descripción:** Permite actualizar la información de una escala registrada.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Escala" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador de la escala.
  3. El administrador ingresa el identificador de la escala.
  4. El sistema muestra la información actual de la escala.
  5. El administrador ingresa los nuevos detalles de la escala.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información de la escala en la base de datos.
  8. El sistema confirma la actualización exitosa de la escala.
- **Postcondiciones:** La información de la escala es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si la escala no está registrada, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 29: Eliminar Escala

**Descripción:** Permite eliminar una escala del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Escala" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador de la escala.
  3. El administrador ingresa el identificador de la escala.
  4. El sistema valida la existencia de la escala.
  5. El sistema elimina la escala de la base de datos.
  6. El sistema confirma la eliminación exitosa de la escala.
- **Postcondiciones:** La escala es eliminada de la base de datos.
- **Excepciones:**
  - Si la escala no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 30: Registrar Tarifa de Vuelo

**Descripción:** Permite registrar una nueva tarifa de vuelo en el sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Registrar Tarifa de Vuelo" en el menú principal.
  2. El sistema solicita al administrador ingresar los detalles de la tarifa: descripción, valor.
  3. El administrador ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda la nueva tarifa en la base de datos.
  6. El sistema confirma el registro exitoso de la tarifa.
- **Postcondiciones:** La tarifa es registrada y almacenada en la base de datos.
- **Excepciones:**
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 31: Actualizar Información de Tarifa de Vuelo

**Descripción:** Permite actualizar la información de una tarifa de vuelo registrada.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Tarifa de Vuelo" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador de la tarifa.
  3. El administrador ingresa el identificador de la tarifa.
  4. El sistema muestra la información actual de la tarifa.
  5. El administrador ingresa los nuevos detalles de la tarifa.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información de la tarifa en la base de datos.
  8. El sistema confirma la actualización exitosa de la tarifa.
- **Postcondiciones:** La información de la tarifa es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si la tarifa no está registrada, el sistema muestra un mensaje de error.
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 32: Eliminar Tarifa de Vuelo

**Descripción:** Permite eliminar una tarifa de vuelo del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Tarifa de Vuelo" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador de la tarifa.
  3. El administrador ingresa el identificador de la tarifa.
  4. El sistema valida la existencia de la tarifa.
  5. El sistema elimina la tarifa de la base de datos.
  6. El sistema confirma la eliminación exitosa de la tarifa.
- **Postcondiciones:** La tarifa es eliminada de la base de datos.
- **Excepciones:**
  - Si la tarifa no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 33: Consultar Tarifa de Vuelo

**Descripción:** Permite consultar la información de una tarifa de vuelo específica.

- **Actor Principal:** Administrador del Sistema, Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de administrador o agente de ventas.
- **Flujo Principal:**
  1. El usuario selecciona la opción "Consultar Tarifa de Vuelo" en el menú principal.
  2. El sistema solicita al usuario ingresar el identificador de la tarifa.
  3. El usuario ingresa el identificador de la tarifa.
  4. El sistema busca la información de la tarifa en la base de datos.
  5. El sistema muestra la información de la tarifa.
- **Postcondiciones:** La información de la tarifa es mostrada al usuario.
- **Excepciones:**
  - Si la tarifa no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 34: Registrar Tipo de Documento

**Descripción:** Permite registrar un nuevo tipo de documento en el sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Registrar Tipo de Documento" en el menú principal.
  2. El sistema solicita al administrador ingresar los detalles del tipo de documento: nombre.
  3. El administrador ingresa los detalles solicitados.
  4. El sistema valida la información ingresada.
  5. El sistema guarda el nuevo tipo de documento en la base de datos.
  6. El sistema confirma el registro exitoso del tipo de documento.
- **Postcondiciones:** El tipo de documento es registrado y almacenado en la base de datos.
- **Excepciones:**
  - Si el campo obligatorio no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 35: Actualizar Tipo de Documento

**Descripción:** Permite actualizar la información de un tipo de documento registrado.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Actualizar Tipo de Documento" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador del tipo de documento.
  3. El administrador ingresa el identificador del tipo de documento.
  4. El sistema muestra la información actual del tipo de documento.
  5. El administrador ingresa los nuevos detalles del tipo de documento.
  6. El sistema valida la información ingresada.
  7. El sistema actualiza la información del tipo de documento en la base de datos.
  8. El sistema confirma la actualización exitosa del tipo de documento.
- **Postcondiciones:** La información del tipo de documento es actualizada y almacenada en la base de datos.
- **Excepciones:**
  - Si el tipo de documento no está registrado, el sistema muestra un mensaje de error.
  - Si el campo obligatorio no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 36: Eliminar Tipo de Documento

**Descripción:** Permite eliminar un tipo de documento del sistema.

- **Actor Principal:** Administrador del Sistema
- **Precondiciones:** El usuario debe tener privilegios de administrador.
- **Flujo Principal:**
  1. El administrador selecciona la opción "Eliminar Tipo de Documento" en el menú principal.
  2. El sistema solicita al administrador ingresar el identificador del tipo de documento.
  3. El administrador ingresa el identificador del tipo de documento.
  4. El sistema valida la existencia del tipo de documento.
  5. El sistema elimina el tipo de documento de la base de datos.
  6. El sistema confirma la eliminación exitosa del tipo de documento.
- **Postcondiciones:** El tipo de documento es eliminado de la base de datos.
- **Excepciones:**
  - Si el tipo de documento no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 37: Consultar Tipo de Documento

**Descripción:** Permite consultar la información de un tipo de documento específico.

- **Actor Principal:** Administrador del Sistema, Agente de Ventas
- **Precondiciones:** El usuario debe tener privilegios de administrador o agente de ventas.
- **Flujo Principal:**
  1. El usuario selecciona la opción "Consultar Tipo de Documento" en el menú principal.
  2. El sistema solicita al usuario ingresar el identificador del tipo de documento.
  3. El usuario ingresa el identificador del tipo de documento.
  4. El sistema busca la información del tipo de documento en la base de datos.
  5. El sistema muestra la información del tipo de documento.
- **Postcondiciones:** La información del tipo de documento es mostrada al usuario.
- **Excepciones:**
  - Si el tipo de documento no está registrado, el sistema muestra un mensaje de error.

## Caso de Uso 38: Buscar Vuelos

**Descripción:** Permite a los clientes buscar vuelos disponibles según sus criterios de búsqueda.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe estar registrado en el sistema.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Buscar Vuelos" en el menú principal.
  2. El sistema solicita al cliente ingresar los criterios de búsqueda: ciudad de origen, ciudad de destino, fecha de salida, fecha de regreso (opcional).
  3. El cliente ingresa los criterios de búsqueda.
  4. El sistema busca los vuelos disponibles en la base de datos.
  5. El sistema muestra una lista de vuelos que coinciden con los criterios de búsqueda.
- **Postcondiciones:** Se muestra una lista de vuelos disponibles al cliente.
- **Excepciones:**
  - Si no se encuentran vuelos disponibles, el sistema muestra un mensaje de error.

## Caso de Uso 39: Seleccionar Vuelo

**Descripción:** Permite a los clientes seleccionar un vuelo de la lista de resultados de búsqueda.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe haber realizado una búsqueda de vuelos.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Seleccionar Vuelo" de la lista de vuelos disponibles.
  2. El sistema muestra los detalles del vuelo seleccionado.
  3. El cliente confirma la selección del vuelo.
- **Postcondiciones:** El vuelo es seleccionado y almacenado en la sesión del cliente.
- **Excepciones:**
  - Si el vuelo seleccionado ya no está disponible, el sistema muestra un mensaje de error.

## Caso de Uso 40: Añadir Pasajeros

**Descripción:** Permite a los clientes añadir los datos de los pasajeros que viajarán en el vuelo seleccionado.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe haber seleccionado un vuelo.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Añadir Pasajeros".
  2. El sistema solicita al cliente ingresar los datos de los pasajeros: nombre, edad, tipo de documento, número de documento.
  3. El cliente ingresa los datos de los pasajeros.
  4. El sistema valida la información ingresada.
  5. El sistema guarda los datos de los pasajeros en la sesión del cliente.
- **Postcondiciones:** Los datos de los pasajeros son guardados en la sesión del cliente.
- **Excepciones:**
  - Si alguno de los campos obligatorios no es ingresado, el sistema muestra un mensaje de error.

## Caso de Uso 41: Seleccionar Asientos

**Descripción:** Permite a los clientes seleccionar los asientos para los pasajeros en el vuelo seleccionado.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe haber añadido los datos de los pasajeros.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Seleccionar Asientos".
  2. El sistema muestra un mapa de asientos disponibles para el vuelo seleccionado.
  3. El cliente selecciona los asientos para cada pasajero.
  4. El sistema valida la disponibilidad de los asientos seleccionados.
  5. El sistema guarda la selección de asientos en la sesión del cliente.
- **Postcondiciones:** Los asientos seleccionados son guardados en la sesión del cliente.
- **Excepciones:**
  - Si los asientos seleccionados ya no están disponibles, el sistema muestra un mensaje de error.

## Caso de Uso 42: Realizar Pago

**Descripción:** Permite a los clientes realizar el pago para confirmar la reserva del vuelo.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe haber seleccionado los asientos.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Realizar Pago".
  2. El sistema solicita al cliente ingresar los detalles de pago: método de pago, información de tarjeta de crédito/débito.
  3. El cliente ingresa los detalles de pago.
  4. El sistema valida la información de pago y procesa la transacción.
  5. El sistema confirma el pago exitoso y guarda la reserva en la base de datos.
  6. El sistema envía un correo electrónico de confirmación al cliente con los detalles de la reserva.
- **Postcondiciones:** La reserva del vuelo es confirmada y almacenada en la base de datos.
- **Excepciones:**
  - Si el pago no es exitoso, el sistema muestra un mensaje de error.

## Caso de Uso 43: Consultar Reserva de Vuelo

**Descripción:** Permite a los clientes consultar los detalles de sus reservas de vuelo.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe tener una reserva de vuelo confirmada.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Consultar Reserva de Vuelo" en el menú principal.
  2. El sistema solicita al cliente ingresar el identificador de la reserva.
  3. El cliente ingresa el identificador de la reserva.
  4. El sistema busca la información de la reserva en la base de datos.
  5. El sistema muestra los detalles de la reserva al cliente.
- **Postcondiciones:** La información de la reserva es mostrada al cliente.
- **Excepciones:**
  - Si la reserva no está registrada, el sistema muestra un mensaje de error.

## Caso de Uso 44: Cancelar Reserva de Vuelo

**Descripción:** Permite a los clientes cancelar una reserva de vuelo existente.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe tener una reserva de vuelo confirmada.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Cancelar Reserva de Vuelo" en el menú principal.
  2. El sistema solicita al cliente ingresar el identificador de la reserva.
  3. El cliente ingresa el identificador de la reserva.
  4. El sistema busca la reserva en la base de datos.
  5. El sistema solicita confirmación de cancelación al cliente.
  6. El cliente confirma la cancelación.
  7. El sistema cancela la reserva y actualiza el estado en la base de datos.
  8. El sistema envía un correo electrónico de confirmación al cliente.
- **Postcondiciones:** La reserva es cancelada y el estado actualizado en la base de datos.
- **Excepciones:**
  - Si la reserva no está registrada, el sistema muestra un mensaje de error.
  - Si la reserva no es cancelable según la política de la aerolínea, el sistema muestra un mensaje de error.

## Caso de Uso 45: Modificar Reserva de Vuelo

**Descripción:** Permite a los clientes modificar los detalles de una reserva de vuelo existente.

- **Actor Principal:** Cliente
- **Precondiciones:** El cliente debe tener una reserva de vuelo confirmada.
- **Flujo Principal:**
  1. El cliente selecciona la opción "Modificar Reserva de Vuelo" en el menú principal.
  2. El sistema solicita al cliente ingresar el identificador de la reserva.
  3. El cliente ingresa el identificador de la reserva.
  4. El sistema busca la reserva en la base de datos.
  5. El sistema muestra los detalles de la reserva al cliente.
  6. El cliente selecciona los detalles a modificar (e.g., fecha, pasajeros, asientos).
  7. El sistema valida y actualiza la información en la base de datos.
  8. El sistema confirma la modificación y envía un correo electrónico de confirmación al cliente.
- **Postcondiciones:** Los detalles de la reserva son actualizados en la base de datos.
- **Excepciones:**
  - Si la reserva no está registrada, el sistema muestra un mensaje de error.
  - Si la reserva no es modificable según la política de la aerolínea, el sistema muestra un mensaje de error.

# Requerimientos de entrega

1. Implementar Arquitectura hexagonal y vertical Slicing
2. Publicar el desarrollo del proyecto en un repositorio
3. El repositorio debe tener Readme donde se explique las tecnologías usadas en el desarrollo de la solución.
4. El repositorio debe contener los archivos sql de creación de la base de datos e inserciones de parametros necesarias para el funcionamiento de la aplicación.