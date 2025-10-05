# main.py
from models.database import conectar_bd
from views.main_view import MainView
from utils.configuracion import Configuracion

# --- IMPORTAR TODOS LOS MODELOS ---
from models.cliente_model import ClienteModel
from models.producto_model import ProductoModel
from models.categoria_model import CategoriaModel
from models.empleado_model import EmpleadoModel

# --- IMPORTAR TODOS LOS CONTROLADORES ---
from controllers.cliente_controller import ClienteController
from controllers.producto_controller import ProductoController
from controllers.categoria_controller import CategoriaController
from controllers.empleado_controller import EmpleadoController


if __name__ == "__main__":
    # 1. Conectar a la base de datos
    conexion = conectar_bd()

    if conexion:
        # 2. Crear instancias de configuración y la vista principal
        config = Configuracion()
        app_view = MainView(config)

        # 3. Crear modelos (pasando la conexión)
        cliente_model = ClienteModel(conexion)
        producto_model = ProductoModel(conexion)
        categoria_model = CategoriaModel(conexion)
        empleado_model = EmpleadoModel(conexion)

        # 4. Crear controladores (pasando modelo y la vista de la pestaña correspondiente)
        cliente_controller = ClienteController(cliente_model, app_view.cliente_tab)

        # El controlador de producto necesita el modelo de categoría para el dropdown
        producto_controller = ProductoController(producto_model, categoria_model, app_view.producto_tab)

        categoria_controller = CategoriaController(categoria_model, app_view.categoria_tab)
        empleado_controller = EmpleadoController(empleado_model, app_view.empleado_tab)

        # 5. Iniciar la aplicación
        app_view.main()