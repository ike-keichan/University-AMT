//2019.6.1 
//Keisuke Ikeda
//g1744069

void TextSet(){  //テキスト
  PFont font = createFont("ＭＳ Ｐ明朝",20,true);
  textFont(font);
  fill(0); 
  text("音波の表示",  50, 30);
  text("スペクトル表示", 50, 380);
  text("波形切り替え", 900, 70);
  text("基本周波数F0(0~22000Hz)", 900, 280);
  text("合成波形数n(1~50)", 900, 390);
  text("リセットボタン", 900, 500);
  
  PFont descriptionFont = createFont("ＭＳ Ｐ明朝",17,true);
  textFont( descriptionFont);
  text("〜〜〜〜〜〜使い方〜〜〜〜〜〜", 900, 600);
  text("①周波数を設定。", 920, 620);
  text("②合成波形数を設定。", 920, 640);
  text("③表示波形を設定。", 920, 660);
  text("〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜", 900, 680);
};
