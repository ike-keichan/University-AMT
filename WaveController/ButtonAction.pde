//2019.6.1 
//Keisuke Ikeda
//g1744069

public void SinMood(){ //正弦波を描くための処理
    out.close();
    out = minim.getLineOut(Minim.STEREO);
    wave = new Oscil(F0, 0.2, Waves.SINE);
    wave.patch(out);
}

public void TriangleMood(){ //三角波を描くための処理
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  for(int i = 0; i < n; i++){
    int odd = 2 * i +1; //奇数
    float amplitude = 0.2 / (odd * odd); //振幅
    if(i % 2 == 1){
       amplitude = - 0.2 / (odd * odd); //偶数回目に足し合わせる波形の振幅を負の数にする。
    }
    wave = new Oscil(F0 * odd,  amplitude, Waves.SINE);
    wave.patch(out);
  }
}

public void SquareMood(){ //矩形波（くけいは）を描くための処理
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  for(int i = 0; i < n; i++){
    int odd = 2 * i +1; //奇数
    float amplitude = 0.2 / odd; //振幅
    wave = new Oscil(F0 * odd,  amplitude, Waves.SINE);
    wave.patch(out);
  }
}

public void SawtoothMood(){ //のこぎり波を描くための処理
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  for(int i = 1; i < n+1; i++){
    wave = new Oscil(F0 * i,  0.2 / i, Waves.SINE);
    wave.patch(out);
  }
}

void Reset(){ //波の描写のリセット（正確には周波数0の正弦波を描写）
  out.close();
  out = minim.getLineOut(Minim.STEREO);
  wave = new Oscil(0, 1, Waves.SINE);
  wave.patch(out);
}
