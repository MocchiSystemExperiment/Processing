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

    if (t==1) {//zumo

      data = new PImage[3];
      data[0] = loadImage("media/zumo0.png");
      data[1] = loadImage("media/zumo1.png");
      data[2] = loadImage("media/zumo2.png");
    }
    else if (t==2){// colorsensor
       data = new PImage[1];
      data[0] = loadImage("media/color0.png");    
    }
   else if (t==3){// zone6
       data = new PImage[1];
      data[0] = loadImage("media/zone6.png");    
    }
   else if (t==4){// zone3
       data = new PImage[1];
      data[0] = loadImage("media/zone3.png");    
    }
   else if (t==5){// zone1
       data = new PImage[1];
      data[0] = loadImage("media/zone1.png");    
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
    if(mouseX>x && mouseX<= x+size_x && mouseY > y && mouseY <= y+size_y){
      clicked();    
      
    }
  }
  
  
  
  void checkDrag() {
    if(mouseX>x && mouseX<= x+size_x && mouseY > y && mouseY <= y+size_y){
      dragged();    
      
    }
  }

  void clicked(){
    //iconColor[0]=0;
    if(type==1)view=0;//top
    else if(type==2)view=1;//colorgraph
    else if(type==3)view=3;//zone6
    else if(type==4)view=2;//zone3
      else if(type==5)view=4;//zone1
  
  }

  void dragged(){
    x+=mouseX-pmouseX;
    y+=mouseY-pmouseY;
  }

  void draw() {

    //if (status==0)return;
    stroke(iconColor[0], iconColor[1], iconColor[2]);
    fill(iconColor[0], iconColor[1], iconColor[2]);
    
    
    //rect(x, y, size_x, size_y);
    
    ellipse(x+size_x/2,y+size_y/2,size_x,size_y);
    image(data[status], x+20, y+20, size_x-40, size_y-40);
  }
}

