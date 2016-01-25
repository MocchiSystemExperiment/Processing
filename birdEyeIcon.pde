class birdEyeIcon {
  int x, y;
  int size_x =70;
  int size_y = 70;

  //background color RGB 
  int[] iconColor;

  //0== not active 1==active
  int status;

  //1==menu->zumo0
  int type;

  birdEyeIcon () {
    x=0;
    y=0; 
    status=0;
    iconColor = new int[3];
    for (int i=0; i<3; i++)iconColor[i]=255;
  }
  void init(int t) {
    if (t==1) {
      iconColor[0]=100;
      iconColor[1]=100;
      iconColor[2]=100;
    }
  }
  void setBackground(int r, int g, int b) {
    iconColor[0] = r;
    iconColor[1] = g;
    iconColor[2] = b;
  }
  void setPosition(int X, int Y) {
    x=X;
    y=Y;
  }

  void draw(PApplet p) {
    
    //if (status==0)return;
    stroke(iconColor[0], iconColor[1], iconColor[2]);
    fill(iconColor[0], iconColor[1], iconColor[2]);
    
    rect(x, y, size_x, size_y);
  }
}

