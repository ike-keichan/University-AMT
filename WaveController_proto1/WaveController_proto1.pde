import controlP5.*;
import ddf.minim.*;  
import ddf.minim.ugens.*;

Minim minim;
Oscil wave;
AudioOutput out;
ControlP5 Button;
ControlP5 slider;
int F0 = 400;

void setup(){
  size(900, 500);
  smooth();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(F0, 1, Waves.SINE);
  wave.patch(out);
  
  background(#e0ffff);
  PFont font = createFont("ＭＳ Ｐ明朝",20,true);
  textFont(font);
  
  Slider();
  SinButton();
  TriangleButton();
  SquareButton();
  SawtoothButton();
 
}

void draw(){
  Window();
  fill(0); 
  text("波形切り替え", 50, 340);
  text("基本周波数", 530, 340);
}

void Window(){
  fill(0);
  stroke(0);
  rect(50, 0, 800, 300);
  stroke(0, 255, 0);
  line(50, 150, 850, 150);
  for(int i = 0; i < 800; i ++)
  {
    ellipse(i + 50, 150 - out.left.get(i) * 50, 2, 2);
    ellipse(i + 50, 150 - out.right.get(i) * 50, 2, 2);
  }
}

void SinButton(){
  Button = new ControlP5(this);
  Button.addButton("SinMood")
    .setLabel("Sin")
    .setPosition(50, 350)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void TriangleButton(){
  Button = new ControlP5(this);
  Button.addButton("TriangleMood")
    .setLabel("Triangle")
    .setPosition(170, 350)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void SquareButton(){
  Button = new ControlP5(this);
  Button.addButton("SquareMood")
    .setLabel("Square")
    .setPosition(290, 350)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void SawtoothButton(){
  Button = new ControlP5(this);
  Button.addButton("SawtoothMood")
    .setLabel("Sawtooth")
    .setPosition(410, 350)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void Slider(){
  slider = new ControlP5(this);
  slider.addSlider("F0")
    .setRange(0, 22000)
    .setValue(400)
    .setPosition(530, 350)
    .setSize(320, 50);
}

public void SinMood(){
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(F0, 1, Waves.SINE);
  wave.patch(out);
}

public void TriangleMood(){
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(F0, 1, Waves.TRIANGLE);
  wave.patch(out);
}

public void SquareMood(){
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(F0, 1, Waves.SQUARE);
  wave.patch(out);
}

public void SawtoothMood(){
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(F0, 1, Waves.SAW);
  wave.patch(out);
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
