public static class drawSetting {
  public static final int TAB_X =50;
  public static final int TAB_Y =20;

  public static final String[] TAB_NAME = {
    "main", "sub", "sub2"
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
      fill(0,255,0);
      text("GOAL! ", 100, 205);
      noFill();
      
    } else if (zoneNumber==8) {
      textSize(50);
      fill(0,255,255);
      text("Moving", 100, 180);
      noFill();
    } else if (zoneNumber==0){
      textSize(50);
      fill(0,255,0);
      text("NO DATA", 100, 180);
      noFill();
    }
  }



  public  void drawColorLineGraph(PApplet a) {

    float y_p, y;

    for (int i=1; i<setting. WINDOW_MAIN_X/10; i++) {

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
}

