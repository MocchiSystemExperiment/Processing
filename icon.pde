public class icon { 
  int x, y;
  int size_x = 100;
  int size_y = 100;

  //background color RGB 
  int[] iconColor;

  //0== not active 1==active
  int status;

  //1==menu->zumo0
  int type;

  PImage[] data;

  icon() {
    x=0;
    y=0; 
    status=0;
    iconColor = new int[3];
    for (int i=0; i<3; i++)iconColor[i]=255;
  }
  void init(int t) {
    type=t;

    if (t==1) {//zumo RIPTIDE

      data = new PImage[3];
      data[0] = loadImage("media/zumo0.png");
      data[1] = loadImage("media/zumo1.png");
      data[2] = loadImage("media/zumo2.png");
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

  void setSize(int X, int Y) {
    size_x=X;
    size_y=Y;
  }
  void checkClick() {
  }



  void draw() {

    //if (status==0)return;
    stroke(iconColor[0], iconColor[1], iconColor[2]);
    fill(iconColor[0], iconColor[1], iconColor[2]);
    rect(x, y, size_x, size_y);
    image(data[status], x+20, y+20, size_x-40, size_y-40);
  }
}

