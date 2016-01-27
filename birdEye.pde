class birdEye {
  final static int birdEyeIconNum = 8;
  birdEyeIcon icon[];
  birdEye() {
    icon =  new birdEyeIcon[birdEyeIconNum];
    for (int i=0; i<birdEyeIconNum; i++) {
      icon[i] = new birdEyeIcon();
      icon[i].init(i);
      
      icon[i].setPosition(100*i, 100);
    }
    icon[0].setBackground(93*255/100, 88*255/100, 55*255/100);//zone1
    icon[1].setBackground(77*255/100,  29*255/100,  25*255/100);//zone2
    icon[2].setBackground(49*255/100, 81*255/100, 88*255/100);//zone3
    icon[3].setBackground(73*255/100, 40*255/100, 58*255/100);//zone4
    icon[4].setBackground(37*255/100, 65*255/100, 36*255/100);//zone5
    icon[5].setBackground( 26*255/100, 30*255/100, 57*255/100);//zone6
    icon[6].setBackground(34*255/100, 40*255/100, 71*255/100);//finish
    icon[7].setBackground(70*255/100, 70*255/100, 70*255/100);//highspeed-linetrace
    icon[0].setPosition(200*1, 120);
    icon[1].setPosition(200*2, 120);
    icon[2].setPosition(200*3, 120);
    icon[7].setPosition(200*2, 320);
    
    icon[3].setPosition(200*1, 520);
    icon[4].setPosition(200*2, 520);
    icon[5].setPosition(200*3, 520);
    icon[6].setPosition(200*4, 520);

  }
  
  void draw(PApplet p){
    stroke(200,200,200);
    strokeWeight(10);
    line(200+75,120+75,200*3+75,120+75);
    
    line(200*3+75,120+75+200,200*3+75,120+75);
    
    
    line(200+75,120+75+200,200*3+75,120+75+200);
    
    line(200*1+75,120+75+200,200*1+75,120+75+400);
    
    line(200+75,120+75+400,200*4+75,120+75+400);
    strokeWeight(1);
    for(int i=0;i<birdEyeIconNum;i++){
      icon[i].draw(p);
    }
  }
}

