public static class drawFunction {
  public static final int TAB_X =50;
  public static final int TAB_Y =20;

  static String[] TAB_NAME = {
    "main", "sub","sub2"
  };


  public static  void drawTab(PApplet a, int view) {
    a.textSize(14);

    a.stroke(0);

    for (int i=0; i<TAB_NAME.length; i++) {
      if (view==i) {
        a.fill(0);
      }
      a.rect(TAB_X*i, 0, TAB_X , TAB_Y);


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



