void setup(){
 fullScreen();
  smooth();
  background(0,255,255);
  float l = width/255;
  for(int i = 0; i< width; i++) {
  stroke(207,52,118,255-i/(l));
  line(0,i, width, i);
}

}
