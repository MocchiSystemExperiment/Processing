class birdEye {
  final static int birdEyeIconNum = 5;
  birdEyeIcon icon[];
  birdEye() {
    icon =  new birdEyeIcon[birdEyeIconNum];
    for (int i=0; i<birdEyeIconNum; i++) {
      icon[i] = new birdEyeIcon();
      icon[i].init(i);
      icon[i].setBackground(134, 226, 213);
      icon[i].setPosition(100*i, 100);
    }
  }
  
  void draw(PApplet p){
    for(int i=0;i<birdEyeIconNum;i++){
      icon[i].draw(p);
    }
  }
}

