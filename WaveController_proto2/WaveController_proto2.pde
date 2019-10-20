import controlP5.*;
import ddf.minim.*;  
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;

Minim minim;
Oscil wave;
AudioOutput out;
FFT fft;
ControlP5 Button;
ControlP5 slider;
int F0 = 0;

void setup(){
  size(1200, 750);
  smooth();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
   fft = new FFT(out.bufferSize(), out.sampleRate());
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
  
  AddSinButton();
  AddTriangleButton();
  AddSquareButton();
  AddSawtoothButton();
 
}

void draw(){
  Window1();
  Window2();
  fill(0); 
  text("音波の表示",  50, 30);
  text("スペクトル表示", 50, 380);
  text("波形切り替え", 900, 70);
  text("基本周波数(0~22000Hz)", 900, 300);
  text("波形合成", 900, 430);
}

void Window1(){
  fill(0);
  stroke(0);
  rect(50, 50, 800, 300);
  stroke(0, 255, 0);
  line(50, 200, 850, 200);
  for(int i = 0; i < 800; i ++)
  {
    ellipse(i + 50, 200 - out.left.get(i) * 50, 2, 2);
    ellipse(i + 50, 200 - out.right.get(i) * 50, 2, 2);
  }
}

void Window2 (){
  fill(0);
  stroke(0);
  rect(50, 400, 800, 300);
  stroke(0, 255, 0);
  line(50, 350, 850, 350);
  fft.forward(out.mix);
  for (int i = 0; i < fft.specSize(); i++) {
    float x = map(i, 0, fft.specSize(), 0, width);
    if(x < 800){
      float y = 700 - fft.getBand(i) *8;
      if(y < 400){
        y = 400;
      }
      line(x + 50,  700, x + 50,  y);
    }
  }
}

void SinButton(){
  Button = new ControlP5(this);
  Button.addButton("SinMood")
    .setLabel("Sin")
    .setPosition(900, 100)
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
    .setPosition(1050, 100)
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
    .setPosition(900, 180)
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
    .setPosition(1050, 180)
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
    .setValue(0)
    .setPosition(900, 330)
    .setSize(250, 50);
}

void AddSinButton(){
  Button = new ControlP5(this);
  Button.addButton("AddSin")
    .setLabel("Sin")
    .setPosition(900, 450)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void AddTriangleButton(){
  Button = new ControlP5(this);
  Button.addButton("AddTriangle")
    .setLabel("Triangle")
    .setPosition(1050, 450)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void AddSquareButton(){
  Button = new ControlP5(this);
  Button.addButton("AddSquare")
    .setLabel("Square")
    .setPosition(900, 530)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void AddSawtoothButton(){
  Button = new ControlP5(this);
  Button.addButton("AddSawtooth")
    .setLabel("Sawtooth")
    .setPosition(1050, 530)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
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

public void AddSin(){
   wave = new Oscil(F0, 1, Waves.SINE);
   wave.patch(out);
}

public void AddTriangle(){
   wave = new Oscil(F0, 1, Waves.TRIANGLE);
   wave.patch(out);
}

public void AddSquare(){
   wave = new Oscil(F0, 1, Waves.SQUARE);
   wave.patch(out);
}

public void AddSawtooth(){
   wave = new Oscil(F0, 1, Waves.SAW);
   wave.patch(out);
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}
