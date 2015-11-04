public static class drawSetting {
  public static final int TAB_X =50;
  public static final int TAB_Y =20;

  public static final String[] TAB_NAME = {
    "main", "sub", "sub2"
  };  
}


public class drawFunction extends drawSetting{



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

    stroke(255);
    fill(255);
    rect(0, height-50, 300, 50);
    textSize(50);
    fill(0);
    text("zone = ", 10, height-10);
    text((int)zoneNumber, 200, height-10);
    text(", ", 225, height-10);
    text((int)mode, 250, height-10);
    noFill();


    if ( count == 120 ) {
      count = 0;
      background(255);
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

