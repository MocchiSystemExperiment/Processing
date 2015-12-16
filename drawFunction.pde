public static class drawSetting {
  public static final int TAB_X =50;
  public static final int TAB_Y =20;

  public static final String[] TAB_NAME = {
    "Info", "color", "zone3", "zone6"
  };
  public static final String[] ZONE6_TAB_NAME = {
    "auto", "man"
  };
}


public class drawFunction extends drawSetting {

  PImage star; // for position
  PImage birdEye;//俯瞰図


  drawFunction() {

    birdEye = loadImage("media/image1.png"); 

    star = loadImage("media/star.png");
  }



  public  void drawCurrentPosition(PApplet a) {
    if (zoneNumber==1)a.image(d.star, 265, 33);
    else if (zoneNumber==2)a.image(d.star, 144, 33);
    else if (zoneNumber==3)a.image(d.star, 25, 33);
    else if (zoneNumber==4)a.image(d.star, 22, 231);
    else if (zoneNumber==5)a.image(d.star, 144, 231);
    else if (zoneNumber==6)a.image(d.star, 265, 231);
    else if (zoneNumber==7) {
      a.image(d.star, 357, 231);
      textSize(50);
      fill(0, 255, 0);
      text("GOAL! ", 100, 205);
      noFill();
    } else if (zoneNumber==8) {
      textSize(50);
      fill(0, 255, 255);
      text("Moving", 100, 180);
      noFill();
    } else if (zoneNumber==0) {
      textSize(50);
      fill(0, 255, 0);
      text("NO DATA", 100, 180);
      noFill();
    }
  }





  public  void drawZone6(PApplet a) {


    double startX=width/4;
    double startY=height/2;
    double X,Y;

    stroke(0, 0, 0);
    
    for (int i=2; i<5000-1; i++) {
      if (azimthLog[i]==-1)break;
      if (colorLog[i]==1)    stroke(255, 0, 0);
      else     stroke(0, 0, 255);

      float sum = azimthLog[i]+azimthLog[i-1]+azimthLog[i-2];
      X=3*cos(radians(sum/3));
      Y=3*sin(radians(sum/3));

      line((int)startX, (int)startY, (int)(startX-X), (int)(startY-Y));
      startX-=X;
      startY-=Y;
    }
    
    
    startX=width/4*3;
    startY=height/2;    
    for (int i=2; i<5000-1; i++) {
      if (azimthLog[i]==-1)break;
      if (colorLog[i]==1)    stroke(255, 0, 0);
      else     stroke(0, 0, 255);

      float sum = azimthLog[i]+azimthLog[i-1]+azimthLog[i-2];

      if(zone6AutomationFlag == 1 ){
        if (motorLLog[i] == -motorRLog[i]) {
          X=zone6BarVal2/20*cos(radians(sum/3));
          Y=zone6BarVal2/20*sin(radians(sum/3));
        } else {
          X=zone6BarVal1/20*cos(radians(sum/3));
          Y=zone6BarVal1/20*sin(radians(sum/3));
        }
      }else{
        if (motorLLog[i] == -motorRLog[i]) {
          X=5.0*zone6Rate*cos(radians(sum/3));
          Y=5.0*zone6Rate*sin(radians(sum/3));
        } else {
          X=5.0*cos(radians(sum/3));
          Y=5.0*sin(radians(sum/3));
        }
      
      }

      line((int)startX, (int)startY, (int)(startX-X), (int)(startY-Y));
      startX-=X;
      startY-=Y;
    }
  }
  public  void drawZone6Tab(PApplet a, int view) {
    a.textSize(14);

    a.stroke(0);
    for (int i=0; i<ZONE6_TAB_NAME.length; i++) {
      if (view==i) {
        a.fill(0);
      }else{
        a.fill(255); 
      }
      
      a.rect(width-TAB_X*(i+1), 0, TAB_X, TAB_Y);


      if (view==i) {
        a.fill(255);
        a.stroke(255);
      } else {
        a.fill(0);
        a.stroke(0);
      }


      a.text(ZONE6_TAB_NAME[i], width-TAB_X*(i+1)+5, 13);
      a.stroke(0);
      a.noFill();
    }
  }


  public  void drawZone6CalcBotton(PApplet a) {
      a.stroke(0);
      a.fill(255);

      a.rect(width-TAB_X, TAB_Y, TAB_X, TAB_Y);

      a.fill(0);
      a.stroke(0);


      a.text("Calc", width-TAB_X+5, TAB_Y+13);
      a.stroke(0);
      a.noFill();
  }


  public  void drawColorLineGraph(PApplet a) {

    float y_p, y;

    for (int i=1; i<red.length; i++) {

      y_p = map(red[i-1], 0, 100, height*0.9, height*0.1);
      y = map(red[i], 0, 100, height*0.9, height*0.1);
      stroke(255, 0, 0);
      line(i*10, y_p, (i+1)*10, y );

      y_p = map(green[i-1], 0, 100, height*0.9, height*0.1);
      y = map(green[i], 0, 100, height*0.9, height*0.1);
      stroke(0, 255, 0);
      line(i*10, y_p, (i+1)*10, y );


      y_p = map(blue[i-1], 0, 100, height*0.9, height*0.1);
      y = map(blue[i], 0, 100, height*0.9, height*0.1);
      stroke(0, 0, 255);
      line(i*10, y_p, (i+1)*10, y );
    }
  }



  public  void drawTab(PApplet a, int view) {
    a.textSize(14);

    a.stroke(0);

    for (int i=0; i<TAB_NAME.length; i++) {
      if (view==i) {
        a.fill(0);
      }else{
        a.fill(255); 
      }
      
      a.rect(TAB_X*i, 0, TAB_X, TAB_Y);


      if (view==i) {
        a.fill(255);
        a.stroke(255);
      } else {
        a.fill(0);
        a.stroke(0);
      }


      a.text(TAB_NAME[i], i*TAB_X+5, 13);
      a.stroke(0);
      a.noFill();
    }
  }


  public void drawInfo(PApplet a, int x) {
    a.stroke(255);
    a.fill(255);
    a.textSize(50);
    a.fill(0);
    a.text("zone = ", 10, height-10);
    a.text((int)zoneNumber, 200, height-10);
    a.text(", ", 225, height-10);
    a.text((int)mode, 250, height-10);


    a.textSize(15);
    a.text("max_x/y = ", x, 20);
    a.text(max_x, x+150, 20);
    a.text(max_y, x+200, 20);

    a.text("min_x/y = ", x, 40);
    a.text(min_x, x+150, 40);
    a.text(min_y, x+200, 40);


    a.text("acc xyz  = ", x, 60);
    a.text(ax, x+150, 60);
    a.text(ay, x+200, 60);
    a.text(az, x+250, 60);

    a.text("mag xy  = ", x, 80);
    a.text(mx, x+150, 80);
    a.text(my, x+200, 80);


    a.text("azimth = ", x, 100);
    a.text(azimuth, x+150, 100);





    a.text("RGB  = ", x, 120);
    a.text(red[red.length-1], x+150, 120);
    a.text(green[red.length-1], x+200, 120);
    a.text(blue[red.length-1], x+250, 120);

    a.text("count  = ", x, 140);
    a.text(count, x+150, 140);

    a.text("intervalTime  = ", x, 160);
    a.text( intervalTime, x+150, 160);


    a.text("mouse  = ", x, 180);
    a.text(mouseX, x+150, 180);
    a.text(mouseY, x+200, 180);


    a.text("motor  = ", x, 200);
    a.text(motorR, x+150, 200);
    a.text(motorL, x+200, 200);
    a.text(motorCount, x+250, 200);

    a.text("zone1  = ", x, 220);
    a.text(zone1_point[0], x+150, 220);
    a.text(zone1_point[1], x+180, 220);
    a.text(zone1_point[2], x+210, 220); 
    a.text(zone1_point[3], x+240, 220);
    a.text(zone1_point[4], x+270, 220);

    a.noFill();
  }
}

