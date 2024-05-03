import gifAnimation.*;
Gif gif;

import processing.sound.*;
SoundFile sound;
PImage img;
PImage load1;
PImage load2;
PImage pir;
PImage coca;
float x1 = 26;
float x2 = 1174;
float vx1 = 2;
float vx2 = -2;
float diametroElipse = 500;
float limite;

void setup() {
  fullScreen();
  frameRate(300);

  // Cargar imágenes fuera del bucle setup()
  img = loadImage("EsculturaSinOjos.png");
  load1 = loadImage("EsculturaSoloOjos.png");
  load2 = loadImage("EsculturaSoloOjos.png");
  pir= loadImage("PiramideDelSol.png");
  coca= loadImage("coca.png");

  // Cargar el GIF
  gif = new Gif(this, "axogif.gif");
  gif.loop(); // Iniciar la reproducción del GIF


  limite = width / 4;

  // Cargar el archivo de audio
  sound = new SoundFile(this, "PedroInfanteVW.mp3");

  // Reproducir el archivo de audio
  sound.play();
  sound.loop();

  // Cargar el archivo GIF
  gif = new Gif(this, "axogif.gif");
  gif.play();

  // Mostrar el GIF
}

void draw() {
  smooth();
  background(255, 0, 255);
  // Dibujar el degradado en el fondo
  float l = width / 255;
  for (int i = 0; i < width; i++) {
    stroke(0, 255, 255, 255 - i / l);
    line(0, i, width, i);
  }

  ellipseMode(CENTER);
  noStroke();

  // Configurar relleno con degradado de amarillo a naranja
  int amarillo = color(255, 255, 0); // Color amarillo
  int naranja = color(255, 0, 0); // Color naranja
  for (int y = 0; y < 500; y++) {
    float inter = map(y, 0, 500, 0, 1); // Interpolación lineal entre 0 y 1
    int c = lerpColor(amarillo, naranja, inter); // Interpolar entre amarillo y naranja
    fill(c); // Establecer el color de relleno
    float diametro = map(y, 0, 500, 500, 0); // Calcular el diámetro del elipse en función de la posición vertical
    ellipse(width / 2, height / 2, diametro, diametro); // Dibujar elipse con el degradado
  }

  // Dibujar la imagen de la pirámide una sola vez
  image(pir, 0, 500);

  image(gif, 100, 100);

  x1 += vx1;
  image(load1, x1, 400);
  if (x1 + load1.width > width / 3 || x1 < 5) {
    vx1 = -vx1;
  }

  x2 += vx2;
  image(load2, x2, 400);
  if (x2 + load2.width > width - 5 || x2 < width / 2 + 250) {
    vx2 = -vx2;
  }
  // Mostrar las imágenes fijas
  image(img, 100, 400);
  image(coca, 900, 100);
  image(img, 1100, 400);
}

void mousePressed() {
}
