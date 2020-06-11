//2019.6.1 
//Keisuke Ikeda
//g1744069

import ddf.minim.*;  
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;

Minim minim;
Oscil wave;
AudioOutput out;
FFT fft;
int F0 = 0;  //基本周波数
int n =1; //重ね合わせる波の数。第n高調波まで重ねるか。

void setup(){
  size(1200, 750);
  background(#e0ffff);
  smooth();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  fft = new FFT(out.bufferSize(), out.sampleRate()); 
  
  TextSet(); //テキスト
  FrequencySlider(); //周波数の設定バー
  WaveNumberSlider(); //波の数の設定バー
  SinButton(); //正弦波を描くためのボタン
  TriangleButton();  //三角波を描くためのボタン
  SquareButton(); //矩形波（くけいは）を描くためのボタン
  SawtoothButton(); //のこぎり波を描くためのボタン
  ResetButton(); //波の描写をリセットするためのボタン（正確には周波数0の波を描写）
}

void draw(){
  WaveDraw(); //波の描写
  SpectacleDraw(); //スペクトルの描写
}

void stop(){
  out.close(); //出力を止める。
  minim.stop(); 
  super.stop();
}
