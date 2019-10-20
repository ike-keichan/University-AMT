//2019.6.1 
//Keisuke Ikeda
//g1744069

import controlP5.*;

ControlP5 Button;

void SinButton(){ //正弦波を描くためのボタン
  Button = new ControlP5(this);
  Button.addButton("SinMood") //関数SinMoodの呼び出し
    .setLabel("Sin")
    .setPosition(900, 100)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void TriangleButton(){ //三角波を描くためのボタン
  Button = new ControlP5(this);
  Button.addButton("TriangleMood") //関数TriangleMoodの呼び出し
    .setLabel("Triangle")
    .setPosition(1050, 100)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void SquareButton(){ //矩形波（くけいは）を描くためのボタン
  Button = new ControlP5(this);
  Button.addButton("SquareMood") //関数SquareMoodの呼び出し
    .setLabel("Square")
    .setPosition(900, 180)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void SawtoothButton(){ //のこぎり波を描くためのボタン
  Button = new ControlP5(this);
  Button.addButton("SawtoothMood") //関数SawtoothMoodの呼び出し
    .setLabel("Sawtooth")
    .setPosition(1050, 180)
    .setSize(100, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}

void ResetButton(){ //波の描写をリセットするためのボタン（正確には周波数0の正弦波を描写）
  Button = new ControlP5(this);
  Button.addButton("Reset") //関数Resetの呼び出し
    .setLabel("Reset")
    .setPosition(900, 510)
    .setSize(250, 50)
    .setColorActive(#66cdaa)
    .setColorBackground(#7fffd4) 
    .setColorForeground(#66cdaa) 
    .setColorCaptionLabel(color(0));  
}
