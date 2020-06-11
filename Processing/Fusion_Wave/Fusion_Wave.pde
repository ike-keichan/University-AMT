import ddf.minim.*;  
import ddf.minim.ugens.*;

Minim minim;
Oscil wave1, wave2, wave3, wave4, wave5;
AudioOutput out1, out2, out3, out4, out5;

void setup(){
  size(600, 400);
  smooth();
  minim = new Minim(this);
  out1 = minim.getLineOut(Minim.STEREO);
  out2 = minim.getLineOut(Minim.STEREO);
  out3 = minim.getLineOut(Minim.STEREO);
  out4 = minim.getLineOut(Minim.STEREO);
  out5 = minim.getLineOut(Minim.STEREO);
   
      
   wave1 = new Oscil(440 , 1, Waves.SINE);
   wave1.patch(out1);
    wave2 = new Oscil(440 * 3, 1/3, Waves.SINE);
    wave2.patch(out2);
    wave3 = new Oscil(440 * 5,  1/5, Waves.SINE);
    wave3.patch(out3);
     wave4 = new Oscil(440 * 7, 1/7, Waves.SINE);
     wave4.patch(out4);
     wave5 = new Oscil(440 * 9,  1/9, Waves.SINE);
     wave5.patch(out5);
   
}

void draw(){
  background(0);
  stroke(0, 255, 0);
  line(0, 200, 600, 200);
 
  for(int i = 0; i < 600 -  1;  i ++)
  {
    line(i, 200 - (out1.left.get(i) + out2.left.get(i) + out3.left.get(i) + out4.left.get(i) + out5.left.get(i) )* 50, i, 200 - (out1.left.get(i+1) + out2.left.get(i+1) + out3.left.get(i+1) + out4.left.get(i+1) + out5.left.get(i+1)  ) * 50 );
    //line(i, 200 - (out1.right.get(i) + out1.right.get(i) + out1.right.get(i) )* 50, i, 200 - (out1.right.get(i) + out1.right.get(i) + out1.right.get(i) ) * 50 );
  }
  
}
