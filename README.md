
# Sistema Comercial - Gestión Integral (Python + Tkinter)

Este es un proyecto de aplicación de escritorio desarrollado en Python con la librería Tkinter para la interfaz gráfica. 
El sistema permite una gestión integral de clientes, productos, categorías y empleados, interactuando con una base de datos MySQL.

El principal objetivo de esta versión es la implementación de la arquitectura **Modelo-Vista-Controlador (MVC)** para lograr un código más 
limpio, organizado, escalable y fácil de mantener.

1-) Características Principales

* **Gestión CRUD completa:** Creación, lectura, actualización y eliminación para las cuatro entidades principales del sistema.
* **Interfaz Gráfica Intuitiva:** Desarrollada con Tkinter y sus widgets `ttk` para una apariencia moderna.
* **Temas de Interfaz:** Soporte para modo claro y oscuro.
* **Gestión de Imágenes:** Carga, previsualización y aplicación de filtros básicos para productos y categorías.
* **Exportación de Datos:** Generación de reportes en formatos **Excel (.xlsx)** y **PDF**.
* **Base de Datos Robusta:** Uso de **procedimientos almacenados** en MySQL para una interacción segura y eficiente con los datos.
* **Validaciones de Formularios:** Verificación en tiempo real de campos numéricos, decimales, email, etc.

---

2-) Estructura del Proyecto (Arquitectura MVC)

El proyecto está organizado siguiendo el patrón Modelo-Vista-Controlador para separar las responsabilidades del código.

```
sistema_comercial_mvc/
├── assets/               # Archivos estáticos como el ícono de la aplicación
├── controllers/          # Controladores: La lógica de la aplicación
├── models/               # Modelos: La lógica de interacción con la base de datos
├── views/                # Vistas: La interfaz de usuario (UI)
├── utils/                # Clases de utilidad (validaciones, exportador, etc.)
├── main.py               # Punto de entrada de la aplicación
└── README.md             # Este archivo
```

* **`models/` (Modelo):** Contiene las clases que se comunican exclusivamente con la base de datos. No saben nada sobre la interfaz de usuario. Su única tarea es obtener, insertar, actualizar o eliminar datos. (Ej: `cliente_model.py`).
* **`views/` (Vista):** Contiene las clases que construyen la interfaz gráfica que el usuario ve. Definen las ventanas, botones y formularios, pero no contienen ninguna lógica de negocio. (Ej: `cliente_view.py`).
* **`controllers/` (Controlador):** Actúa como el intermediario. Escucha las acciones del usuario en la Vista (ej. un clic en un botón), procesa la información y le pide al Modelo que realice las operaciones necesarias en la base de datos. Luego, toma la respuesta del Modelo y actualiza la Vista. Es el cerebro de la aplicación. (Ej: `cliente_controller.py`).

---

3-) Tecnologías y Librerías

* **Lenguaje:** Python 3
* **Base de Datos:** MySQL
* **Interfaz Gráfica:** Tkinter (ttk)
* **Conector MySQL:** `mysql-connector-python`
* **Manejo de Imágenes:** `Pillow`
* **Calendario:** `tkcalendar`
* **Exportación a Excel:** `openpyxl`
* **Exportación a PDF:** `reportlab`

---

4-) Instalación y Puesta en Marcha

Sigue estos pasos para ejecutar el proyecto en tu máquina local.

- Prerrequisitos
* Tener instalado **Python 3**.
* Tener un servidor de **MySQL** en funcionamiento (como XAMPP, WAMP o MySQL Community Server).

- Configuración de la Base de Datos
* Abre tu gestor de base de datos (phpMyAdmin, MySQL Workbench, etc.).
* Crea una nueva base de datos llamada `sistema_comercial`.
* Ejecuta las siguientes consultas SQL para crear las tablas necesarias:

```sql
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `codigo_sku` varchar(50) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

```

### 3. Clonar el Repositorio
```bash
git clone <URL_DEL_REPOSITORIO>
cd MVC-entregable3
```

5-) Configurar el Entorno Virtual e Instalar Dependencias
Se recomienda encarecidamente usar un entorno virtual.

```bash
# Crear un entorno virtual
python -m venv .venv

# Activar el entorno virtual
# En Windows:
.venv\Scripts\activate
# En macOS/Linux:
source .venv/bin/activate

# Instalar las librerías necesarias
pip install mysql-connector-python Pillow tkcalendar openpyxl reportlab
```

### 5. Ejecutar la Aplicación
Una vez que el entorno esté activado y las dependencias instaladas, ejecuta el archivo principal:
```bash
python main.py
```

La aplicación debería iniciarse y conectarse a la base de datos. Los procedimientos almacenados se crearán automáticamente en el primer arranque.
````
