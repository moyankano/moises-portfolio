---
title: Juego del 20
date: 2023-05-28T17:58:17.862Z
description: "#Android"
tags: ['Android']
image: img/juegocartas20_googleplay.png
---
El juego se ha desarrollado en Android y Kotlin en el entorno de Android Studio.

Juego de cartas donde gana quien obtiene el número 20 cuando se giran 3 de las 5 cartas. En la parte superior se muestra un número que representa la suma total de las cartas en cada partida. En la parte inferior se muestra el número de partidas ganadas y un cronómetro. Cuando se ganan tres partidas el cronómetro se para.

![IconoIT](img/iconoit.png "IconoIT")

```kotlin
package myxt.android.juegodecartas

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.random.Random

class MainActivity : AppCompatActivity() {

    var count = 1
    var pressed = false
    var pressed2 = false
    var pressed3 = false
    var pressed4 = false
    var pressed5 = false
    var total = 0
    var partidasGanadas = 0

    var nextValues = MutableList(5) { Random.nextInt(1, 13) }

    var nombreCarta = "carta" + nextValues.get(0)
    var nombreCarta2 = "carta" + nextValues.get(1)
    var nombreCarta3 = "carta" + nextValues.get(2)
    var nombreCarta4 = "carta" + nextValues.get(3)
    var nombreCarta5 = "carta" + nextValues.get(4)

    var drawableResourceId = 0
    var drawableResourceId2 = 0
    var drawableResourceId3 = 0
    var drawableResourceId4 = 0
    var drawableResourceId5 = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onStart() {
        super.onStart()
        chronometer1.start()
        drawableResourceId =
            this.resources.getIdentifier(nombreCarta, "drawable", this.packageName)
        drawableResourceId2 =
            this.resources.getIdentifier(nombreCarta2, "drawable", this.packageName)
        drawableResourceId3 =
            this.resources.getIdentifier(nombreCarta3, "drawable", this.packageName)
        drawableResourceId4 =
            this.resources.getIdentifier(nombreCarta4, "drawable", this.packageName)
        drawableResourceId5 =
            this.resources.getIdentifier(nombreCarta5, "drawable", this.packageName)

        imageView.setOnClickListener {
            if (count <= 3 && !pressed) {
                imageView.setImageResource(drawableResourceId)
                total += nextValues.get(0)
                editText5.setText(total.toString())
                count++
                pressed = true
            } else if (count <= 3 && pressed) {
                Log.d("onClickListener",
                    "Valores: count = $count y pressed = $pressed. No se realiza acción alguna"
                )
            } else if (count > 3 && !pressed) {
                checkAndShowFinalResult()
                restart()
            } else {
                checkAndShowFinalResult()
                restart()
            }
        }
        imageView2.setOnClickListener {

            if (count <= 3 && !pressed2) {
                imageView2.setImageResource(drawableResourceId2)
                total += nextValues.get(1)
                editText5.setText(total.toString())
                count++
                pressed2 = true
            } else if (count <= 3 && pressed2) {
                Log.d("onClickListener2",
                    "Valores: count = $count y pressed = $pressed. No se realiza acción alguna"
                )
            } else if (count > 3 && !pressed2) {
                checkAndShowFinalResult()
                restart()
            } else {
                checkAndShowFinalResult()
                restart()
            }
        }
        imageView3.setOnClickListener {
            if (count <= 3 && !pressed3) {
                imageView3.setImageResource(drawableResourceId3)
                total += nextValues.get(2)
                editText5.setText(total.toString())
                count++
                pressed3 = true
            } else if (count <= 3 && pressed3) {
                Log.d("onClickListener3",
                    "Valores: count = $count y pressed = $pressed. No se realiza acción alguna"
                )
            } else if (count > 3 && !pressed3) {
                checkAndShowFinalResult()
                restart()
            } else {
                checkAndShowFinalResult()
                restart()
            }
        }
        imageView4.setOnClickListener {
            if (count <= 3 && !pressed4) {
                imageView4.setImageResource(drawableResourceId4)
                total += nextValues.get(3)
                editText5.setText(total.toString())
                count++
                pressed4 = true
            } else if (count <= 3 && pressed4) {
                Log.d("onClickListener4",
                    "Valores: count = $count y pressed = $pressed. No se realiza acción alguna"
                )
            } else if (count > 3 && !pressed4) {
                checkAndShowFinalResult()
                restart()
            } else {
                checkAndShowFinalResult()
                restart()
            }
        }
        imageView5.setOnClickListener {
            if (count <= 3 && !pressed5) {
                imageView5.setImageResource(drawableResourceId5)
                total += nextValues.get(4)
                editText5.setText(total.toString())
                count++
                pressed5 = true
            } else if (count <= 3 && pressed5) {
                Log.d("onClickListener5",
                    "Valores: count = $count y pressed = $pressed. No se realiza acción alguna"
                )
            } else if (count > 3 && !pressed5) {
                checkAndShowFinalResult()
                restart()
            } else {
                checkAndShowFinalResult()
                restart()
            }
        }
    }

    private fun restart() {
        //val intent = Intent(this, MainActivity::class.java)
        //this.startActivity(intent)
        count = 1
        pressed = false
        pressed2 = false
        pressed3 = false
        pressed4 = false
        pressed5 = false
        total = 0

        nextValues = MutableList(5) { Random.nextInt(1, 13) }

        nombreCarta = "carta" + nextValues.get(0)
        nombreCarta2 = "carta" + nextValues.get(1)
        nombreCarta3 = "carta" + nextValues.get(2)
        nombreCarta4 = "carta" + nextValues.get(3)
        nombreCarta5 = "carta" + nextValues.get(4)

        drawableResourceId =
            this.resources.getIdentifier(nombreCarta, "drawable", this.packageName)
        drawableResourceId2 =
            this.resources.getIdentifier(nombreCarta2, "drawable", this.packageName)
        drawableResourceId3 =
            this.resources.getIdentifier(nombreCarta3, "drawable", this.packageName)
        drawableResourceId4 =
            this.resources.getIdentifier(nombreCarta4, "drawable", this.packageName)
        drawableResourceId5 =
            this.resources.getIdentifier(nombreCarta5, "drawable", this.packageName)

        imageView.setImageResource(R.drawable.cruz)
        imageView2.setImageResource(R.drawable.cruz)
        imageView3.setImageResource(R.drawable.cruz)
        imageView4.setImageResource(R.drawable.cruz)
        imageView5.setImageResource(R.drawable.cruz)

        editText5.setText("0")
        if(partidasGanadas==3)
            chronometer1.stop()
    }

    private fun checkAndShowFinalResult() {
        if (total < 20) {
            imageView6.setImageResource(R.drawable.ganador)
        }
        else if (total==20) {
            imageView6.setImageResource(R.drawable.loading)
            partidasGanadas++
            editText.setText(partidasGanadas.toString())
        }
        else
            imageView6.setImageResource(R.drawable.perdedor)
    }
}
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="horizontal">

        <EditText
            android:id="@+id/editText5"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_gravity="center_horizontal"
            android:layout_weight="1"
            android:autofillHints="@string/marcador"
            android:ems="10"
            android:hint="@string/marcador"
            android:inputType="number"
            android:text="@string/cero"
            android:textAlignment="center" />

    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <ImageView
            android:id="@+id/imageView"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:contentDescription="@string/carta1"
            app:srcCompat="@drawable/cruz" />

        <ImageView
            android:id="@+id/imageView2"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            app:srcCompat="@drawable/cruz"
            android:contentDescription="@string/carta2"/>

        <ImageView
            android:id="@+id/imageView3"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            app:srcCompat="@drawable/cruz"
            android:contentDescription="@string/carta3"/>

        <ImageView
            android:id="@+id/imageView4"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            app:srcCompat="@drawable/cruz"
            android:contentDescription="@string/carta4"/>

        <ImageView
            android:id="@+id/imageView5"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            app:srcCompat="@drawable/cruz"
            android:contentDescription="@string/carta5"/>
    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:layout_weight="1"
        android:orientation="vertical"
        tools:layout_editor_absoluteX="123dp"
        >

        <ImageView
            android:id="@+id/imageView6"
            android:layout_width="100dp"
            android:layout_height="0dp"
            android:layout_gravity="center_horizontal"
            android:layout_weight="1"
            android:animateLayoutChanges="false"
            android:contentDescription="@string/resultado"
            android:textAlignment="center"
            android:visibility="invisible"
            app:srcCompat="@drawable/ganador" />

        <EditText
            android:id="@+id/editText"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_gravity="center_horizontal"
            android:layout_weight="0.1"
            android:autofillHints="@string/marcador"
            android:ems="10"
            android:enabled="false"
            android:hint="@string/marcador"
            android:inputType="number"
            android:text="@string/cero"
            android:textAlignment="center" />

        <Chronometer
            android:id="@+id/chronometer1"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center_horizontal"
            />

    </LinearLayout>

</androidx.constraintlayout.widget.ConstraintLayout>
```