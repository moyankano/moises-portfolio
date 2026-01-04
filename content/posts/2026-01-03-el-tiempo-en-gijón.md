---
title: El tiempo en Gijón
date: 2026-01-04T08:02:45.117Z
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