# Traffic-Control-FPGA

## Descripción

Este proyecto implementa un **Sistema de Gestión de Tráfico en FPGA** para controlar el flujo de tráfico en una rotonda con 4 semáforos para vehículos y 4 semáforos para peatones. Utiliza una **máquina de estados** para gestionar el cambio de semáforos y garantizar la seguridad en la rotonda. El proyecto también incluye un **modo de emergencia**, que activa todos los semáforos en rojo para permitir el paso de vehículos prioritarios, como ambulancias.

**Características principales:**
- **Control de semáforos**: Gestión de semáforos para vehículos y peatones mediante una máquina de estados.
- **Modo de emergencia**: Todos los semáforos se ponen en rojo en caso de emergencia (ejemplo: paso de ambulancia).
- **Visualización en tiempo real**: Estado de los semáforos representado gráficamente en un monitor utilizando gráficos de pixel art.
- **Pantalla VGA**: Salida VGA para mostrar el estado de los semáforos y la máquina de estados.
- **Sincronización de píxeles**: Utilización de un **VGA sync** para controlar la visualización de los píxeles en la pantalla.

## Tecnologías usadas

- **Hardware:** FPGA DE10-Lite
- **Lenguaje de programación:** Verilog
- **Simulación:** Active HDL
- **Compilación:** Quartus Prime
- **Visualización:** VGA, gráficos de pixel art

## Instalación

Para simular y cargar el proyecto en el FPGA, sigue estos pasos:

1. **Simulación en Active HDL:**
   - Abre el proyecto Verilog en **Active HDL** y simula el comportamiento de la máquina de estados.
   
2. **Compilación en Quartus Prime:**
   - Abre **Quartus Prime** e importa el proyecto Verilog.
   - Compila el diseño para cargarlo en el **FPGA DE10-Lite**.

3. **Conexión a la pantalla VGA:**
   - Conecta el FPGA a un monitor mediante un cable VGA.
   - Los semáforos y el estado de la máquina de estados se mostrarán en la pantalla.

**Notas técnicas:**
- En Verilog, **el uso de `initial begin` no es compatible con la mayoría de los FPGA**, ya que esta función se utiliza principalmente para simulaciones. Sin embargo, con el FPGA **DE10-Lite** se ha logrado compilar correctamente utilizando esta sintaxis, pero asegúrate de verificar las restricciones de tu FPGA si trabajas en otro modelo.

## Uso

- **Máquina de estados**: El proyecto gestiona el tráfico de una rotonda con 4 semáforos para vehículos y 4 para peatones. Los semáforos cambian de color según el estado actual de la máquina de estados.
- **Visualización**: Los semáforos se muestran en pantalla mediante gráficos de pixel art. Además, se incluye un semáforo más grande a la derecha que refleja el color de los semáforos y el estado de la máquina (por ejemplo, "01", "02", "EM" para emergencia).
- **Emergencia**: Cuando se detecta una emergencia, todos los semáforos se ponen en rojo, y después de un breve período, el sistema vuelve al estado que estaba ejecutando antes del evento de emergencia.

**Nota:** No se puede proporcionar una captura de pantalla del proyecto en ejecución debido a las limitaciones del FPGA y la salida VGA.

## Contribución

Este proyecto fue desarrollado por los siguientes compañeros de clase:
- **Ricardo Villalobos Castillo**
- **Bruno Tarango Garay**
- **Diego Flores Martínez** (yo)

## Licencia

Este proyecto no tiene licencia específica. Si deseas contribuir o utilizar el código, asegúrate de dar el crédito apropiado a los autores mencionados.
