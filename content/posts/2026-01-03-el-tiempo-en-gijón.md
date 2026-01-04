---
title: El tiempo en Gijón
date: 2026-01-04T08:35:54.915Z
draft: true
tags:
  - pantalla_tactil
  - html
  - netlify
---
## Cómo crear un Kiosk en Ubuntu Core para Raspberry Pi con pantalla táctil

La Raspberry Pi es una de las plataformas más utilizadas para proyectos de **kiosk**, paneles interactivos y señalización digital. Combinada con **Ubuntu Core** y una **pantalla táctil**, se convierte en una solución robusta, segura y fácil de mantener.

En este artículo veremos cómo instalar y configurar un **sistema kiosk en una Raspberry Pi**, utilizando una **pantalla táctil oficial o compatible**, y arrancando directamente una aplicación a pantalla completa.

## Escenario del proyecto

**Hardware utilizado:**

* Raspberry Pi 4 (recomendado, aunque también funciona en Pi 3)
* Pantalla táctil oficial de Raspberry Pi o pantalla HDMI + USB táctil
* Tarjeta microSD (16 GB o superior)
* Conexión a Internet

Software:

* Ubuntu Core 22
* Ubuntu Frame (servidor gráfico)
* Navegador web en modo kiosk (WPE WebKit)

El objetivo es que, al encender la Raspberry Pi, el sistema muestre **una aplicación web a pantalla completa**, con soporte táctil, sin acceso al escritorio.

## Paso 1: Instalar Ubuntu Core en la Raspberry Pi

1. Descarga la imagen de **Ubuntu Core para Raspberry Pi** desde el sitio oficial de Ubuntu.
2. Graba la imagen en la microSD usando **Raspberry Pi Imager** o dd.
3. Inserta la microSD en la Raspberry Pi y enciéndela.

Durante el primer arranque:

* Configura la red (Wi-Fi o Ethernet)
* Inicia sesión con tu cuenta de Ubuntu One
* Registra tu clave SSH

> Ubuntu Core no incluye entorno gráfico tradicional, todo se gestiona mediante snaps y servicios.

## Paso 2: Conectar y verificar la pantalla táctil

La mayoría de pantallas táctiles para Raspberry Pi funcionan de forma plug & play:

* Pantalla oficial: conexión DSI + alimentación
* Pantalla HDMI: video por HDMI y táctil por USB

Ubuntu Core detecta automáticamente:

* Resolución
* Entrada táctil
* Orientación básica

No es necesario instalar drivers adicionales en la mayoría de los casos.

## Paso 3: Instalar Ubuntu Frame (servidor gráfico)

Ubuntu Frame es el servidor gráfico recomendado para entornos kiosk en Ubuntu Core.

Instálalo con:

```
sudo snap install ubuntu-frame
```

Este componente se encarga de:

* Mostrar gráficos en pantalla
* Gestionar el input táctil
* Ejecutar aplicaciones en modo pantalla completa

## Paso 4: Instalar el navegador en modo Kiosk

Para un kiosk táctil, una de las mejores opciones es WPE WebKit, optimizado para dispositivos embebidos.

Instálalo con:

```
sudo snap install wpe-webkit-mir-kiosk
```

Este snap está diseñado para ejecutarse directamente sobre Ubuntu Frame.

![](/images/blog_1_captura-de-pantalla-2026-01-02-061929.png)

![](/images/blog_2_captura-de-pantalla-2026-01-02-062006.png)

## Paso 5: Conectar permisos necesarios

Para que el navegador pueda mostrar gráficos y usar aceleración, conecta las interfaces requeridas:

```
sudo snap connect wpe-webkit-mir-kiosk:wayland
sudo snap connect wpe-webkit-mir-kiosk:opengl
```

Estas conexiones permiten:

* Salida gráfica
* Soporte táctil
* Mejor rendimiento visual

## Paso 6: Configurar la URL del Kiosk

Define la página web que se mostrará al iniciar el sistema:

```
sudo snap set wpe-webkit-mir-kiosk url=https://mi-aplicacion-web.com
```

También puedes usar:

* Una IP local
* Un servidor interno
* Una aplicación web progresiva (PWA)

## Paso 7: Ajustar orientación de la pantalla (opcional)

Si tu pantalla táctil está montada en vertical o invertida, puedes configurar la rotación:

```
sudo snap set ubuntu-frame display="rotate=90"
```

Valores comunes:

* 0 → horizontal
* 90 → vertical
* 180 → invertido
* 270 → vertical inverso

## Paso 8: Reiniciar y probar el Kiosk

Reinicia la Raspberry Pi:

```
sudo reboot
```

Tras el arranque:

* Ubuntu Core inicia automáticamente
* Ubuntu Frame levanta el servidor gráfico
* El navegador se ejecuta a pantalla completa
* La interfaz responde al tacto

El usuario no tiene acceso al sistema operativo ni a un escritorio tradicional.

Por defecto tendremos la siguiente vista:

![](/images/img_20260102_062040.jpg)

## Ventajas de esta solución

* 🔒 Alta seguridad: sistema inmutable y aislamiento por snaps
* 🔄 Actualizaciones automáticas
* 👆 Soporte táctil nativo
* 🚀 Arranque rápido
* 🧩 Ideal para producción y despliegues masivos

## Conclusión

Implementar un kiosk táctil con Raspberry Pi y Ubuntu Core es una solución profesional y estable para proyectos de:

* Paneles informativos interactivos
* Sistemas de autoservicio
* Control industrial
* Señalización digital

Gracias a Ubuntu Frame y WPE WebKit, es posible construir un sistema limpio, seguro y enfocado únicamente en la aplicación final.

## Configuración del Kiosk con una aplicación web desplegada en Netlify

En este proyecto, el kiosk muestra la aplicación web **eltiempoengijon.netlify.app**, una interfaz desarrollada para visualizar información meteorológica y **alojada en un repositorio Git público**, cuyo despliegue se realiza automáticamente mediante **Netlify**.

La Raspberry Pi no ejecuta el código directamente, sino que actúa como cliente, cargando la aplicación web desde Internet en modo pantalla completa.

## Paso 1: Definir la URL del Kiosk

Para que el navegador del kiosk cargue la aplicación correcta al arrancar, configura la URL del snap `wpe-webkit-mir-kiosk` con el dominio de Netlify:

```
sudo snap set wpe-webkit-mir-kiosk url=https://eltiempoengijon.netlify.app
```

![](/images/blog_3_captura-de-pantalla-2026-01-02-062130.png)

A partir de este momento, cada vez que la Raspberry Pi se inicie, el sistema mostrará directamente la aplicación meteorológica en pantalla completa y con soporte táctil.

## Paso 2: Código alojado en un repositorio Git público

La aplicación web que se muestra en el kiosk:

* Está versionada en un repositorio Git público
* Utiliza un flujo de integración continua con Netlify
* Se despliega automáticamente cada vez que se realiza un push al repositorio

Esto permite:

* Actualizar el contenido del kiosk sin tocar el dispositivo
* Gestionar cambios de forma segura y trazable
* Escalar el sistema a múltiples Raspberry Pi sin reconfiguración adicional

## Paso 3: Configurar la variable de entorno en Netlify

La aplicación utiliza la **API de OpenWeatherMap** para obtener los datos meteorológicos.

Por razones de seguridad, la clave de la API **no debe incluirse directamente en el código**, sino que se define como una **variable de entorno en Netlify**.

Variable requerida

```
VITE_OPENWEATHER_KEY
```

Pasos para añadirla en Netlify

1. Accede al panel de control de Netlify
2. Selecciona el sitio eltiempoengijon
3. Ve a Site settings → Environment variables
4. Añade una nueva variable:

   * Key: VITE_OPENWEATHER_KEY
   * Value: TU_API_KEY_DE_OPENWEATHERMAP
5. Guarda los cambios
6. Lanza un nuevo despliegue (redeploy)

Netlify inyectará automáticamente esta variable durante el proceso de build.

> Al tratarse de un proyecto basado en Vite, todas las variables de entorno que deban ser accesibles desde el frontend deben comenzar por VITE_.

## Paso 4: Verificar el funcionamiento en el Kiosk

Una vez redeplegado el sitio en Netlify:

* La aplicación cargará correctamente los datos meteorológicos
* No es necesario modificar nada en la Raspberry Pi
* El kiosk reflejará los cambios automáticamente al recargar la página

Esto hace que el mantenimiento del sistema sea sencillo y completamente remoto.

![](/images/img_20260102_062327.jpg)

Ventaja de este enfoque

* 🌐 Separación total entre hardware y aplicación
* 🔐 Claves de API protegidas mediante variables de entorno
* 🔄 Actualizaciones inmediatas sin intervención física
* 📦 Ideal para entornos kiosk en producción

## Diagrama de flujo: de Git al Kiosk en la Raspberry Pi

El siguiente diagrama muestra el flujo completo desde el código fuente hasta su visualización en el kiosk táctil de la Raspberry Pi.

```
┌──────────────────────────┐
│  Repositorio Git Público │
│  (Código fuente)         │
└─────────────┬────────────┘
              │
              │ push / commit
              ▼
┌──────────────────────────┐
│        Netlify           │
│  Build & Deploy          │
│                          │
│  Variables de entorno:   │
│  - VITE_OPENWEATHER_KEY  │
└─────────────┬────────────┘
              │
              │ Despliegue automático
              ▼
┌──────────────────────────┐
│ Aplicación Web Pública   │
│ https://eltiempoengijon. │
│ netlify.app              │
└─────────────┬────────────┘
              │
              │ Petición HTTPS
              ▼
┌─────────────────────────┐
│ Raspberry Pi            │
│ Ubuntu Core             │
│                         │
│ ┌────────────────────┐  │
│ │ Ubuntu Frame       │  │
│ │ (Servidor gráfico) │  │
│ └─────────┬──────────┘  │
│           │             │
│ ┌─────────▼──────────┐  │
│ │ WPE WebKit Kiosk   │  │
│ │ Navegador táctil   │  │
│ └─────────┬──────────┘  │
│           │             │
│ ┌─────────▼──────────┐  │
│ │ Pantalla táctil    │  │
│ │ Raspberry Pi       │  │
│ └────────────────────┘  │
└─────────────────────────┘
```

## Explicación del flujo

1. **Repositorio Git público**

   Contiene el código fuente de la aplicación meteorológica.
2. **Netlify**

   * Detecta automáticamente los cambios en el repositorio.
   * Ejecuta el proceso de build.
   * Inyecta la variable de entorno `VITE_OPENWEATHER_KEY`.
   * Publica la aplicación.
3. **Aplicación web en Netlify**

   Queda accesible públicamente mediante HTTPS.
4. **Raspberry Pi con Ubuntu Core**

   * Ubuntu Frame gestiona la salida gráfica.
   * WPE WebKit carga la URL configurada.
   * La aplicación se muestra en **modo kiosk y pantalla completa**.
5. **Pantalla táctil**

   El usuario interactúa directamente con la aplicación sin acceso al sistema operativo.

## Por qué este flujo es ideal para entornos Kiosk

* 🧱 **Aislamiento total** entre sistema y aplicación
* 🔄 **Actualizaciones continuas** sin tocar el hardware
* 🔐 **Gestión segura de claves API**
* 🚀 **Escalabilidad**: una sola app para múltiples kiosks