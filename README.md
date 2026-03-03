# 🛠️ Mscripts - Utilidades y Automatización

Bienvenido a **Mscripts**, una colección de scripts en Bash diseñados para optimizar el flujo de trabajo en sistemas Linux (especialmente Arch Linux y Ubuntu), facilitando tareas de instalación, monitoreo y organización de archivos.

---

## 📜 Descripción de los Scripts

A continuación se detalla el funcionamiento de cada uno de los scripts contenidos en este repositorio:

### 1. 🔄 `actrepo.sh`
**Propósito:** Automatiza el proceso de actualización de un repositorio Git.
- Verifica si hay cambios locales o commits pendientes.
- Ejecuta `git add .`, solicita un mensaje para el commit y realiza el `push` a la rama actual.
- Útil para mantener al día tus proyectos rápidamente.

### 2. 📅 `datetoday.sh`
**Propósito:** Muestra información rápida del día y el clima.
- Presenta la fecha actual en formato extendido.
- Obtiene y muestra el clima local basándose en tu IP utilizando el servicio `wttr.in`.

### 3. 🔍 `detectar_gpu.sh`
**Propósito:** Identifica de forma sencilla qué fabricante de GPU está presente en el sistema.
- Escanea el bus PCI y devuelve "amd", "intel" o "nvidia" según la detección.

### 4. 📊 `estati.sh`
**Propósito:** Monitor de sistema básico por terminal.
- Muestra el consumo de **RAM**, espacio en **disco** (`/`), dirección **IP**, **temperatura** de CPU, **uptime** y estado de la **batería**.
- Ideal para un vistazo rápido a la salud del sistema.

### 5. 🌐 `instPaketTracer822.sh`
**Propósito:** Instalación simplificada de Cisco Packet Tracer.
- Clona el repositorio de AUR y compila el paquete utilizando `makepkg`. (Específico para Arch Linux).

### 6. 📐 `inst_matlab_ubuntu.sh`
**Propósito:** Instalador automatizado para MATLAB R2025a en Ubuntu.
- Descarga la herramienta `mpm` (MATLAB Package Manager).
- Instala MATLAB y Simulink de forma desatendida.
- Crea automáticamente un acceso directo (`.desktop`) con su respectivo icono.

### 7. 🖥️ `inst_niri_nocatalia.sh`
**Propósito:** Instalador completo del entorno visual Niri + NoctaliaShell.
- Detecta la GPU para instalar los drivers correctos.
- Instala un conjunto de herramientas modernas para Wayland (Wayland protocols, clipboard, rofi, alacritty, etc.).
- Configura GDM y despliega NoctaliaShell desde su repositorio oficial.

### 8. ⌨️ `inst_openrazer.sh`
**Propósito:** Configura dispositivos Razer en Linux.
- Instala el demonio de OpenRazer y la interfaz gráfica Polychromatic.

### 9. 🐚 `inst_zsh_star_opti.sh`
**Propósito:** Instalador de Zsh optimizado con Starship.
- Instala Zsh y la fuente JetBrainsMono Nerd Font.
- Configura plugins esenciales: `autosuggestions`, `syntax-highlighting`, `history-substring-search` y `z` (navegación rápida).
- Configura un archivo `.zshrc` robusto con alias personalizados.

### 10. 📦 `instyay.sh`
**Propósito:** Instalador automático de `yay` (AUR Helper).
- Prepara las dependencias y compila `yay` desde el código fuente para sistemas Arch Linux.

### 11. 🛡️ `instzsh.sh` y `instzshstarship.sh`
**Propósito:** Instaladores alternativos para la shell Zsh.
- `instzsh.sh`: Configura Oh My Zsh de forma estándar con temas clásicos.
- `instzshstarship.sh`: Variación que integra Starship como prompt principal sobre Oh My Zsh.

### 12. 📂 `organizar_descargas.sh`
**Propósito:** Mantiene la carpeta de `~/Downloads` impecable.
- Clasifica automáticamente los archivos en subcarpetas: *Imagenes, Videos, Documentos, Programacion, Audio, Comprimidos e Instaladores*.
- Cuenta con lógica para evitar la sobreescritura si existen archivos con el mismo nombre.

### 13. 🖼️ `renombrar_imagenes.sh`
**Propósito:** Renombramiento masivo de imágenes en un directorio.
- Permite establecer un prefijo (ej: `vacaciones_`) y un número inicial.
- Renombra todos los archivos JPG, PNG, WebP, etc., de forma secuencial.

---

## � Subdirectorios Especiales

### 🛠️ `m_configs/`
Contiene scripts para aplicar configuraciones personalizadas (dotfiles) de aplicaciones específicas:
- `conf_alacritty.sh`: Despliega la configuración para el terminal Alacritty.
- `conf_fastfetch.sh`: Personaliza la apariencia de la información del sistema en `fastfetch`.
- `conf_niri.sh`: Configuración detallada para el compositor Niri.
- `conf_nvim.sh`: Setup inicial para el editor Neovim.

### 📚 `linuxEssentials/`
Una serie de scripts educativos o de prueba para conceptos básicos de Linux:
- `loops.sh`: Ejemplos de estructuras de ciclos en Bash.
- `test.sh`: Scripts de prueba para validaciones rápidas.

---

## �🚀 Cómo usar los scripts

Para ejecutar cualquier script, primero asegúrate de darle permisos de ejecución:

```bash
chmod +x nombre_del_script.sh
./nombre_del_script.sh
```

O si prefieres no descargarlo y ejecutarlo directamente desde este repositorio (usando `curl`):

```bash
bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/main/nombre_del_script.sh)
```

---
*Desarrollado con ❤️ por **jguerra***
