# MiCaja Plus

Sistema de gestión para tiendas de barrio: una **app Android** con asistente de chat y voz, un **backend REST en Flask** y un **panel web** para analizar el negocio. Permite registrar ventas, gastos, costos, inventario, clientes, créditos (fiados) y abonos con frases tan simples como *"vendí 4 arroz Diana de 5 libras"*.

> Proyecto académico en equipo, presentado en la **Cámara de Comercio de Buga**, donde los asistentes probaron la aplicación en vivo.

![Android](https://img.shields.io/badge/Android-API%2024%2B-3DDC84?logo=android&logoColor=white)
![Kotlin](https://img.shields.io/badge/Kotlin-7F52FF?logo=kotlin&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-3.1-000000?logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)

## Problema

En las tiendas de barrio las cuentas suelen llevarse en un cuaderno o de memoria: no hay control claro de lo que entra y sale, ni de quién debe cuánto. Eso genera errores, pérdidas y desconocimiento de la utilidad real.

MiCaja Plus centraliza esa información y reduce cada operación a un mensaje escrito o dictado, pensado para tenderos que necesitan rapidez al atender.

## Funcionalidades

**App móvil**
- Registro e inicio de sesión (cédula + teléfono).
- Apertura y cierre de tienda con registro de la **base** de caja.
- **Asistente conversacional** por texto o voz (`SpeechRecognizer` de Android) con flujos guiados paso a paso.
- Ventas de contado, gastos, costos (compras a proveedores), créditos y abonos.
- Inventario: alta y edición de productos, con categorías y sugerencias.
- Clientes: alta, búsqueda y edición.
- Consulta de balance por rango de fechas: ventas, costos, gastos, fiados y utilidad.
- Ventana de ayuda con palabras clave y variantes de cada comando.

**Panel web**
- Dashboard con ventas, costos, gastos, fiados y utilidad.
- Filtro por rango de fechas e historial de transacciones.

## Arquitectura

```
┌─────────────────────┐                  ┌──────────────────────────┐      ┌─────────┐
│  App Android        │   HTTP / JSON    │  API REST · Flask        │ ───► │  MySQL  │
│  Kotlin · MVVM      │ ───────────────► │  (Python)                │ ◄─── │         │
│  Retrofit + Gson    │ ◄─────────────── │  + Panel web (Jinja/JS)  │      └─────────┘
└─────────────────────┘                  └──────────────────────────┘
```

| Capa | Tecnología |
|---|---|
| App móvil | Kotlin, Material Components, ViewModel, Retrofit 2 + Gson, `compileSdk` 36 / `minSdk` 24 |
| Backend | Python, Flask 3, Flask-CORS, `mysql-connector`, sesiones de Flask |
| Base de datos | MySQL |
| Panel web | HTML, CSS y JavaScript servidos por Flask |

**Estructura de la app** (`app/src/main/java/com/example/micaja`)

```
Adapter/            Adaptadores de RecyclerView
ConexionService/    Interfaz Retrofit con los endpoints del backend
Operaciones/        Lógica de ventas, gastos, costos y productos
models/             Modelos de datos
viewmodel/          ViewModels (operaciones y tendero)
utils/              Manejo de sesión y utilidades
```

**Modelo de datos**: `tendero` (propietario de la tienda) → `cliente`, `inventario`, `ventas`, `gastos`, `costos`, `apertura` (base diaria) y `abonos`; `creditos` enlaza una venta con un cliente. El catálogo (`categorias`, `productos`, `diccionarioproductos`) aporta el reconocimiento de productos por sinónimos.

**Estructura del backend**: `routes/` (endpoints por módulo), `models/` (acceso a datos), `templates/` y `static/` (panel web), `conexion.py` (conexión a MySQL), `app.py` (arranque).

## Repositorios

| Componente | Repositorio |
|---|---|
| App Android | [AFVIVAS/Front-end-Mi-caja-plus](https://github.com/AFVIVAS/Front-end-Mi-caja-plus) |
| Backend + panel web | [AFVIVAS/Backend-Mi-caja-plus](https://github.com/AFVIVAS/Backend-Mi-caja-plus) |

## Ejecución local

### 1. Backend

Requisitos: Python 3.11+ y un servidor MySQL.

```bash
git clone https://github.com/AFVIVAS/Backend-Mi-caja-plus.git
cd Backend-Mi-caja-plus
python -m venv .venv
.venv\Scripts\activate        # Linux/macOS: source .venv/bin/activate
pip install -r requirements.txt
```

1. Crea la base de datos e importa el esquema ([docs/schema.sql](docs/schema.sql): 12 tablas y el catálogo base de ~450 productos con sus sinónimos):
   ```bash
   mysql -u <usuario> -p -e "CREATE DATABASE micajapus CHARACTER SET utf8mb4;"
   mysql -u <usuario> -p micajapus < docs/schema.sql
   ```
2. Ajusta host, usuario, contraseña y nombre de la base de datos en `conexion.py`.
3. Inicia el servidor:
   ```bash
   python app.py                # escucha en el puerto 4000
   ```
4. El panel web queda disponible en `http://localhost:4000`.

### 2. App Android

Requisitos: Android Studio reciente y un emulador o dispositivo con Android 7.0 (API 24) o superior.

1. Clona e importa el repositorio en Android Studio y espera la sincronización de Gradle.
2. En [ConexionServiceTienda.kt](app/src/main/java/com/example/micaja/ConexionService/ConexionServiceTienda.kt) configura `BASE_URL` con el puerto del backend:
   - Emulador: `http://10.0.2.2:4000`
   - Dispositivo físico: `http://<IP-de-tu-PC>:4000` (misma red Wi-Fi)
3. Ejecuta la app (`Run ▶`).

> El servidor de producción usado en la presentación ya no está disponible, por lo que el backend debe ejecutarse de forma local.

## Uso del asistente

Todas las operaciones se inician con una palabra clave, escrita o dictada. El asistente pide los datos faltantes paso a paso.

| Operación | Palabras clave | Flujo |
|---|---|---|
| Abrir tienda | `abrir tienda` | Pide la base inicial del día |
| Venta | `venta` | `vendí 4 arroz Diana de 5 libras` → `fin` |
| Gasto | `gasto` | `gasté 5000 en salchipapa` → `fin` |
| Costo (compra) | `compra` | Producto → cantidad → precio total → proveedor → confirmación |
| Crédito (fiado) | `crédito` | Cédula del cliente → productos → `fin` |
| Abono | `abono` | Cédula → monto → confirmación |
| Nuevo cliente | `nuevo cliente` | Cédula → nombre y teléfono |
| Agregar producto | `agregar producto` | Abre el formulario de inventario |
| Cerrar tienda | `cerrar tienda` | Cierra la jornada |

## API

Todos los endpoints son `POST` con cuerpo JSON.

| Módulo | Endpoints |
|---|---|
| Tenderos | `/login`, `/addtendero`, `/consultaCedulaTendero`, `/agregarBase` |
| Operaciones | `/crearventas`, `/creargasto`, `/crearcosto`, `/operacionesInventario` |
| Productos | `/agregarProducto`, `/editarProducto`, `/verificarproducto`, `/sugerirProductos` |
| Clientes y crédito | `/insertar_cliente`, `/buscar_cliente`, `/consultarcliente`, `/actualizar_cliente`, `/registrar_credito`, `/abonos` |
| Reportes | `/consultarEstadisticas`, `/consultarTenderoFecha` |

## Capturas de pantalla

| Inicio de sesión | Venta por chat | Crédito (fiado) |
|:---:|:---:|:---:|
| <img src="docs/login.png" width="220" alt="Inicio de sesión"> | <img src="docs/chat-venta.png" width="220" alt="Venta por chat"> | <img src="docs/chat-credito.png" width="220" alt="Crédito por chat"> |

| Abono | Estado de la tienda |
|:---:|:---:|
| <img src="docs/chat-abono.png" width="220" alt="Abono por chat"> | <img src="docs/balance.png" width="220" alt="Balance por fechas"> |

Guía completa de uso: [Manual de usuario](docs/manual-de-usuario.md).

## Equipo

Proyecto desarrollado de forma colaborativa; todos los integrantes participaron en el desarrollo full-stack (app, backend y base de datos).

- Andrés Velásquez
- Andrés Felipe Vivas
- Jhan Carlos Luna
- Luis Miguel Acevedo
- Julio Arango
- Santiago Torres
