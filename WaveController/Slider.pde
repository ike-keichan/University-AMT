//2019.6.1 
//Keisuke Ikeda
//g1744069

import controlP5.*;

ControlP5 slider;

public void FrequencySlider(){ //周波数の設定バー
  slider = new ControlP5(this);
   slider.addSlider("F0") //設定した値をF0に代入する。
    .setRange(0, 22000)
    .setValue(0)
    .setPosition(900, 290)
    .setSize(250, 50);
}

public void WaveNumberSlider(){  //波の数の設定バー
  slider = new ControlP5(this);
   slider.addSlider("n") //設定した値をnに代入する。
    .setRange(1, 50)
    .setValue(1)
    .setPosition(900, 400)
    .setSize(250, 50);
}
