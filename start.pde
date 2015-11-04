import processing.serial.*;


int zoneNumber, mode;

int[] green = new int[setting.WINDOW_MAIN_X/10];
int[] red = new int[setting.WINDOW_MAIN_X/10];
int[] blue = new int[setting.WINDOW_MAIN_X/10];
int[] sensors = new int[5];
int count;
int[] sensors_p = new int[5];

int view;

subWindow sub1 ;
drawFunction d ;

PImage birdEye;//俯瞰図


public class setting {
  public static final String SERIAL_COM_PORT = "COM7";
  public static final int SERIAL_COM_BAUND_RATE = 9600;



  public static final int WINDOW_MAIN_X = 1200;
  public static final int WINDOW_MAIN_Y = 400;
}


void setup() {

  d= new drawFunction();


  birdEye = loadImage("media/image1.png"); 
  view=0;
  size(setting.WINDOW_MAIN_X, setting.WINDOW_MAIN_Y);
  background(255);


  for (int i=0; i<red.length; i++) {
    red[i]=0;
    green[i]=0;
    blue[i]=0;
  }

  /*
  sub1 = new subWindow(this);
   sub1.size(1000,300);
   sub1.background(255);
   */



  count = 0;
  //  println(Serial.list());
  // String arduinoPort = Serial.list()[1];
  // port = new Serial(this, arduinoPort, 9600 );
  //zoneNumber = 0;
  /*
  red_p = 0; 
   green_p = 0; 
   blue_p = 0;
   */
}

void draw() {
  background(255);

  d.drawTab(this, view);
  switch(view) {
  case 0://main

    image(birdEye, 0, d.TAB_Y);
    break;
  case 1://line grapg
    d.drawColorLineGraph(this);
    break;

  }


  /*
  red = map(sensors[2],0, 100, 0, 255);
   green = map(sensors[3],0, 100, 0, 255);
   blue = map(sensors[4],0, 100, 0, 255);
   fill(red, green, blue);
   ellipse(count*10, 20, 10, 10 );
   */

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

void mousePressed() {
  //select tab
  if (mouseY<drawFunction.TAB_Y) {
    for (int i=0; i < drawFunction.TAB_NAME.length; i++) {
      if (mouseX<drawFunction.TAB_X*(i+1)) {
        view=i;
        return;
      }
    }
  }


  //ellipse(mouseX, mouseY, 60, 60);
}


void serialEvent(Serial p) { // p is anonymous  
  Serial port ;//= com.getSerialNumber();
  // if(port!=p)return;

  if ( p.available() >= 6 ) { 
    if ( p.read() == 'H' ) {

      // red_p = red;
      // green_p = green;
      // blue_p = blue;


      zoneNumber = p.read();
      mode =  p.read();
      red[count] =  p.read();
      green[count] = p.read();
      blue[count] =  p.read();
      p.clear(); // 念のためクリア

      // print("zone = ");
      // println((int)zoneNumber, (int)mode);
      ++count;
      if (count>=red.length)count=0;
    }
  }

  //  port.write("A");
}

