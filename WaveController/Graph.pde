//2019.6.1 
//Keisuke Ikeda
//g1744069

void WaveDraw (){ //波形とウインドウの描写
  fill(0);
  stroke(0);
  rect(50, 50, 800, 300);
  stroke(0, 255, 0);
  line(50, 200, 850, 200);
  for(int i = 0; i < 800; i ++){
    line(i + 50,  200 - out.left.get(i) * 50,  i + 51, 200 - out.left.get(i+1) * 50);
    line(i + 50,   200 - out.right.get(i) * 50, i + 51, 200 - out.right.get(i+1) * 50);
  }
}

void SpectacleDraw (){ //スペクトルとウインドウの描写
  fill(0);
  stroke(0);
  rect(50, 400, 800, 300);
  stroke(0, 255, 0);
  line(50, 350, 850, 350);
  fft.forward(out.mix);
  for (int i = 0; i < fft.specSize(); i++) {
    float x = map(i, 0, fft.specSize(), 0, width);
    if(x < 1600){
      float y = 700 - fft.getBand(i) *8;
      if(y < 400){
        y = 400;
      }
      line(x/1.5 + 50,  700, x/1.5 + 50,  y);
    }
  }
}
