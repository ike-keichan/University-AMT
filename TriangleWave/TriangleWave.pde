import ddf.minim.*;  
import ddf.minim.ugens.*;

Minim minim;
Oscil triangle;
AudioOutput out;

void setup(){
  size(600, 400);
  smooth();
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  triangle = new Oscil(440, 1, Waves.TRIANGLE);
  triangle.patch(out);
  
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
