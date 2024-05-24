import processing.sound.*;
SoundFile sound;

import gifAnimation.*;
PImage taco;

boolean changeColor = false;
boolean changeSun = false;

//Valores de VAPORWAVEMEXA
Gif vapor;
float vaporWidth;
float vaporHeight;
float vaporX;
float vaporY;
float offsetVX;
float offsetVY;

boolean draggingV=false;

//valores de piramides
PImage pirS;
PImage pirL;
float pirX= width/2;
float pirY= 550;
boolean showingPiramide = true;

PImage err;

//Valores de Simi
PImage simi1;
PImage simi2;
float simiX = 500;
float simiY = 500;
boolean draggingSimi = false;
float offsetSmX;
float offsetSmY;
boolean showingSimi = true;

//valores de PixilFrame
PImage pix;
PImage pyx;
float pixX = 150;
float pixY = 150;
boolean draggingPx = false;
float offsetPxX, offsetPxY;
boolean showingFirstImagePx = true;

//Valores de palmeras
PImage plm1;
PImage plm2;
float plmx1L = 20;
float plmy1L = height*3;
float plmx2L = 200;
float plmy2L = height*4;
float plmx1R = 900;
float plmy1R = height*4;
float plmx2R = 1100;
float plmy2R = height*3;

boolean showingPalm1 = true;
boolean showingPalm2 = true;
boolean showingPalm3 = true;
boolean showingPalm4 = true;

//Valores de Oxxo
PImage oxxo1;
PImage oxxo2;
float oxxoX = 800;
float oxxoY = 450;
boolean showingFirstImageOx = true;

//valores de Chalchihutlicue
PImage cha1;
PImage cha2;
float x1 = 26;
float x2 = 1174;
float vx1 = 2;
float vx2 = -2;
float offsetChX1;
float offsetChX2;

boolean draggingCh1= false;
boolean draggingCh2= false;

//valores de Quetzalcoatl
PImage ray1;
PImage ray2;

float angle1 = 0;
float angle2 = 0;
float radius = 50;
float centerX1 = 100;
float centerY1 = 100;
float centerX2= 300;
float centerY2 = 100;
boolean pauseRay1 = false;
boolean pauseRay2 = false;

//valores de AxoGif
Gif axo;

float axoX = 50;
float axoY = 50;
float offsetAxX;
float offsetAxY;

boolean draggingAx= false;

//valores de CocaColaGif
Gif coca;

float cocaX = 1200;
float cocaY = 50;
float offsetCoX;
float offsetCoY;

boolean draggingCoca= false;

void setup() {
  fullScreen();
  frameRate(300);

  cha1 = loadImage("ChalCuerpo.png");
  cha2= loadImage("ChalOjos.png");
  pirS= loadImage("PiramideDelSol.png");
  pirL= loadImage("PiramideDeLaLuna.png");
  ray1 = loadImage("Quetz1.png");
  ray2 = loadImage("Quetz2.png");
  err = loadImage("Error.png");
  pix = loadImage("PixilFrame.png");
  pyx = loadImage("CalacasChidasPaint.png");
  oxxo1 = loadImage("oxxo1.png");
  oxxo2 = loadImage("oxxo2.png");
  plm1 = loadImage("PalmTree1.png");
  plm2 = loadImage ("PalmTree2.png");
  simi1 = loadImage("simi1.png");
  simi2 = loadImage("simi2.png");
  taco = loadImage("taco.png");

  cursor(taco);

  axo = new Gif(this, "axogif.gif");
  axo.play();

  coca = new Gif(this, "cocamov.gif");
  coca.play();

  vapor = new Gif(this, "VaporwaveMexaTxt.gif");
  vapor.play();

  vaporWidth = vapor.width;
  vaporHeight = vapor.height;
  vaporX = (width - vaporWidth) / 2;
  vaporY = (height - vaporHeight) / 6;

  sound = new SoundFile(this, "PedroInfanteVW.mp3");
  sound.play();
  sound.loop();
}

void draw() {
  smooth();
  background(255, 0, 255);

  float l = width /255;
  for (int i = 0; i < width; i++) {
    if (changeColor) {
      stroke(0, 255, 255, 255 - i / l);
    } else {
      stroke(0, 0, 255, 255-i/l);
    }
    line(0, i, width, i);
  }

  if (changeSun) {
    ellipse(width/2, height/2, 600, 600);
    fill(255, random(200), random(255));
    noStroke();
  } else {
    ellipse(width/2, height/2, 600, 600);
    fill(random(255), 255, 255);
    noStroke();
  }
  //valores de PixilFrame
  if (showingFirstImagePx) {
    image(pix, pixX, pixY);
  } else {
    image(pyx, pixX, pixY);
  }

  //valores de VAPORWAVEMEXA
  image(vapor, vaporX, vaporY);

  //Valores de piramides
  if (showingPiramide) {
    image(pirS, pirX, pirY);
  } else {
    image(pirL, pirX, pirY);
  }

  //valores de Oxxo
  if (showingFirstImageOx) {
    image(oxxo1, oxxoX, oxxoY);
  } else {
    image(oxxo2, oxxoX, oxxoY);
  }

  //valores de Palmas
  if (showingPalm1) {
    image (plm1, plmx1L, plmy1L);
  } else {
    image (plm2, plmx1L, plmy1L);
  }

  if (showingPalm2) {
    image (plm1, plmx2L, plmy2L);
  } else {
    image (plm2, plmx2L, plmy2L);
  }

  if (showingPalm3) {
    image(plm2, plmx1R, plmy1R);
  } else {
    image (plm1, plmx1R, plmy1R);
  }

  if (showingPalm4) {
    image(plm2, plmx2R, plmy2R);
  } else {
    image(plm1, plmx2R, plmy2R);
  }

  //valores de Chalchihutlicue
  x1 += vx1;
  image(cha2, x1, 500);
  if (x1 + cha2.width > width / 3 || x1 < 5) {
    vx1 = -vx1;
  }

  x2 += vx2;
  image(cha2, x2, 500);
  if (x2 + cha2.width > width - 5 || x2 < width / 2 + 250) {
    vx2 = -vx2;
  }

  image (cha1, 100, 500);
  image (cha1, 1100, 500);

  //Valores de AxoGif
  image(axo, axoX, axoY);

  //Valores de CocaColaGif
  image(coca, cocaX, cocaY);

  //valores de Quetzalcoatl
  float rayx1 = centerX1 + cos(angle1) * radius;
  float rayy1 = centerY1 + sin(angle1) * radius;
  pushMatrix();
  translate(width / 2, height/2);
  rotate(angle1);
  image(ray2, rayx1, rayy1);
  popMatrix();
  angle1 += 0.05;

  float rayx2 = centerX2 + cos(angle2) * radius;
  float rayy2 = centerY2 + sin(angle2) * radius;
  pushMatrix();
  translate(width/2, height/2);
  rotate(-angle2);
  image(ray1, rayx2, rayy2);
  popMatrix();
  angle2 += 0.05;

  //valores de Simi
  if (showingSimi) {
    image(simi1, simiX, simiY);
  } else {
    image(simi2, simiX, simiY);
  }
}

void mousePressed() {
  image(err, mouseX, mouseY);

  //Valores de gardiente
  changeColor = !changeColor;
  
  //valores de ellipse
  changeSun = !changeSun;
  // Valores de VAPORWAVEMEXA
  if (mouseX > vaporX && mouseX < vaporX + vaporWidth && mouseY > vaporY && mouseY < vaporY + vaporHeight) {
    // Calcular el desplazamiento del mouse
    offsetVX = mouseX - vaporX;
    offsetVY = mouseY - vaporY;
    draggingV = true;
  }

  //Valores de piramide
  if ((showingPiramide && mouseX > pirX && mouseX < pirX + pirS.width && mouseY > pirY && mouseY < pirY + pirS.height) ||
    (!showingPiramide && mouseX > pirX && mouseX < pirX + pirL.width && mouseY > pirY && mouseY < pirY + pirL.height)) {
    showingPiramide = !showingPiramide; // Cambiar de imagen
  }

  //Valores de Chalchihutlicue
  image(cha2, x1, 500);
  if (mouseX > x1 && mouseX < x1 + cha2.width && mouseY > 500 && mouseY < 500 + cha2.height) {
    draggingCh1 = true;
    offsetChX1 = mouseX - x1;
  }
  image(cha2, x2, 500);
  if (mouseX > x2 && mouseX < x2 + cha2.width && mouseY > 500 && mouseY < 500 + cha2.height) {
    draggingCh2 = true;
    offsetChX2 = mouseX - x2;
  }

  //valores de Oxxo
  if ((showingFirstImageOx && mouseX > oxxoX && mouseX < oxxoX + oxxo1.width && mouseY > oxxoY && mouseY < oxxoY + oxxo1.height) ||
    (!showingFirstImageOx && mouseX > oxxoX && mouseX < oxxoX + oxxo2.width && mouseY > oxxoY && mouseY < oxxoY + oxxo2.height)) {
    showingFirstImageOx = !showingFirstImageOx;
  }

  //valores de Palmas
  if ((showingPalm1 && mouseX > plmx1L && mouseX < plmx1L + plm1.width && mouseY > plmy1L && mouseY < plmy1L + plm1.height) ||
    (!showingPalm1 && mouseX > plmx1L && mouseX < plmx1L + plm1.width && mouseY > plmy1L && mouseY < plmy1L + plm1.height)) {
    showingPalm1 = !showingPalm1;
  }
  if ((showingPalm2 && mouseX > plmx2L && mouseX < plmx2L + plm1.width && mouseY > plmy2L && mouseY < plmy2L + plm1.height) ||
    (!showingPalm2 && mouseX > plmx2L && mouseX < plmx2L + plm1.width && mouseY > plmy2L && mouseY < plmy2L + plm1.height)) {
    showingPalm2 = !showingPalm2;
  }
  if ((showingPalm3 && mouseX > plmx1R && mouseX < plmx1R + plm2.width && mouseY > plmy1R && mouseY < plmy1R + plm2.height) ||
    (!showingPalm3 && mouseX > plmx1R && mouseX < plmx1R + plm2.width && mouseY > plmy1R && mouseY < plmy1R + plm2.height)) {
    showingPalm3 = !showingPalm3;
  }
  if ((showingPalm4 && mouseX > plmx2R && mouseX < plmx2R + plm2.width && mouseY > plmy2R && mouseY < plmy2R + plm2.height) ||
    (!showingPalm4 && mouseX > plmx2R && mouseX < plmx2R + plm2.width && mouseY > plmy2R && mouseY < plmy2R + plm2.height)) {
    showingPalm4 = !showingPalm4;
  }

  //valores de axoGif
  if (mouseX > axoX && mouseX < axoX + axo.width && mouseY > axoY && mouseY < axoY + axo.height) {
    draggingAx = true;
    offsetAxX = mouseX - axoX;
    offsetAxY = mouseY - axoY;
  }

  //valores de CocaColaGif
  if (mouseX > cocaX && mouseX < cocaX + coca.width && mouseY > cocaY && mouseY < cocaY + coca.height) {
    draggingCoca = true;
    offsetCoX = mouseX - cocaX;
    offsetCoY = mouseY - cocaY;
  }

  //Valores de PixilFrame
  if (mouseX > pixX && mouseX < pixX + pix.width && mouseY > pixY && mouseY < pixY + pix.height) {
    draggingPx = true;
    offsetPxX = mouseX - pixX;
    offsetPxY = mouseY - pixY;
    showingFirstImagePx = !showingFirstImagePx;
  }

  //Valores de Simi
  if (mouseX > simiX && mouseX < simiX + simi2.width && mouseY > simiY && mouseY < simiY + simi1.height) {
    draggingSimi = true;
    offsetSmX = mouseX - simiX;
    offsetSmY = mouseY - simiY;
    showingSimi = !showingSimi;
  }
}

void mouseDragged() {
  //Valores de VAPORWAVEMEXA
  if (draggingV) {
    vaporX = mouseX - offsetVX;
    vaporY = mouseY - offsetVY;
  }

  //Valores de Chalchihutlicue
  if (draggingCh1) {
    x1 = mouseX - offsetChX1;
  }

  if (draggingCh2) {
    x2 = mouseX - offsetChX2;
  }

  //valores de AxoGif
  if (draggingAx) {
    axoX = mouseX - offsetAxX;
    axoY = mouseY - offsetAxY;
  }

  //valores de CocaColaGif
  if (draggingCoca) {
    cocaX = mouseX - offsetCoX;
    cocaY = mouseY - offsetCoY;
  }

  //Valores de PixilFrame
  if (draggingPx) {
    pixX = mouseX - offsetPxX;
    pixY = mouseY - offsetPxY;
  }

  //valores de Simi)
  if (draggingSimi) {
    simiX = mouseX - offsetSmX;
    simiY = mouseY - offsetSmY;
  }
}

void mouseReleased() {
  //Valores de VAPORWAVEMEXA
  draggingV=false;

  //valores de Chalchihutlicue
  draggingCh1 = false;
  draggingCh2 = false;

  // Solo se deben verificar estas condiciones si se ha presionado la tecla del mouse dentro de la zona de interés
  if (mousePressed) {
    if (mouseX > x1 && mouseX < x1 + cha2.width && mouseY > 500 && mouseY < 500 + cha2.height) {
      vx1 = (vx1 == 2) ? 2 : vx1;
    }

    if (mouseX > x2 && mouseX < x2 + cha2.width && mouseY > 500 && mouseY < 500 + cha2.height) {
      vx2 = (vx2 == -2) ? -2 : vx2;
    }
  }

  //valores de AxoGif
  draggingAx = false;

  //valores de CocaColaGif
  draggingCoca = false;

  //Valores de PixilFrame
  draggingPx = false;

  //valores de Simi
  draggingSimi = false;
}

void keyPressed() {

  if (key == ' ') {

    // Restablecer los valores de VAPORWAVEMEXA
    vaporX = (width - vaporWidth) / 2;
    vaporY = (height - vaporHeight) / 6;

    // Restablecer los valores de piramides
    showingPiramide = true;

    // Restablecer los valores de Chalchihutlicue
    x1 = 26;
    x2 = 1174;
    vx1 = 2;
    vx2 = -2;

    // Restablecer los valores de las palmeras
    showingPalm1 = true;
    showingPalm2 = true;
    showingPalm3 = true;
    showingPalm4 = true;

    // Restablecer los valores de AxoGif
    axoX = 100;
    axoY = 100;

    // Restablecer los valores de CocaColaGif
    cocaX = 1100;
    cocaY = 90;

    // Restablecer los valores de PixilFrame
    pixX = 200;
    pixY = 200;
    showingFirstImagePx = true;

    // Restablecer los valores de Simi
    simiX = 500;
    simiY = 500;
    showingSimi = true;
  }
}
