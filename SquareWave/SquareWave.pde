import ddf.minim.*;  
import ddf.minim.ugens.*;

Minim minim;
Oscil sine;
AudioOutput out;

void setup(){
  size(600, 400);
  smooth();
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new Oscil(440, 0.5, Waves.SQUARE);
  sine.patch(out);
  
}

void draw(){
  background(0);
  stroke(0, 255, 0);
  line(0, 200, 600, 200);
  for(int i = 0; i < out.bufferSize() -  1; i ++)
  {
    point(i, 200 - out.left.get(i) * 50);
    point(i, 200 - out.right.get(i) * 50);
  }
  
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
