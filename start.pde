import processing.serial.*;


Serial port;


int zoneNumber, mode;

int[] green = new int[setting.WINDOW_MAIN_X/10];
int[] red = new int[setting.WINDOW_MAIN_X/10];
int[] blue = new int[setting.WINDOW_MAIN_X/10];

int max_x, max_y, min_x, min_y;
int mx, my, ax, ay, az, azimuth;





int[] sensors = new int[5];
int count;
int[] sensors_p = new int[5];

int view;

subWindow sub1 ;
drawFunction d ;

PImage birdEye;//俯瞰図


public class setting {
  public static final String SERIAL_COM_PORT = "COM3";
  public static final int SERIAL_COM_BAUND_RATE = 57600;



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
  port = new Serial(this, setting.SERIAL_COM_PORT, setting.SERIAL_COM_BAUND_RATE );
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


  textSize(15);
  text("max_x/y = ", 400, 20);
  text(max_x, 550, 20);
  text(max_y, 600, 20);

  text("min_x/y = ", 400, 40);
  text(min_x, 550, 40);
  text(min_y, 600, 40);


  text("acc xyz  = ", 400, 60);
  text(ax, 550, 60);
  text(ay, 600, 60);
  text(az, 650, 60);

  text("mag xy  = ", 400, 80);
  text(mx, 550, 80);
  text(my, 600, 80);


  text("azimth = ", 400, 100);
  text(azimuth, 550, 100);



  text("RGB  = ", 400, 120);
  text(red[count], 550, 120);
  text(green[count], 600, 120);
  text(blue[count], 650, 120);

  text("count  = ", 400, 140);
  text(count, 550, 140);

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
  // Serial port ;//= com.getSerialNumber();
  // if(port!=p)return;

  if ( p.available() >= 26 ) { 
    if ( p.read() == 'H' ) {
      zoneNumber = p.read();
      mode =  p.read();
      red[count] =  p.read();
      green[count] = p.read();
      blue[count] =  p.read();

      ++count;
      if (count>=red.length)count=0;

      //get  max/min values of geomagnetic sensor
      int h = p.read(), l = p.read(); 
      max_x=(int)(h<<8|l); 
      if (max_x > 32767) max_x -= 65536;         
      h = p.read(); 
      l = p.read(); 
      max_y=(int)(h<<8|l); 
      if (max_y > 32767) max_y -= 65536;         
      h = p.read(); 
      l = p.read(); 
      min_x=(int)(h<<8|l); 
      if (min_x > 32767) min_x -= 65536;         
      h = p.read(); 
      l = p.read(); 
      min_y=(int)(h<<8|l); 
      if (min_y > 32767) min_y -= 65536;         
      // get the current sensor values of geomagnetic sensor
      h = p.read(); 
      l = p.read(); 
      mx=(int)(h<<8|l); 
      if (mx > 32767) mx -= 65536;         
      h = p.read(); 
      l = p.read(); 
      my=(int)(h<<8|l); 
      if (my > 32767) my -= 65536;

      h = p.read(); 
      l = p.read();
      ax=(int)(h<<8|l); 
      if (ax > 32767) ax -= 65536;         
      h = p.read(); 
      l = p.read(); 
      ay=(int)(h<<8|l); 
      if (ay > 32767) ay -= 65536;         
      h = p.read(); 
      l = p.read(); 
      az=(int)(h<<8|l); 
      if (az > 32767) az -= 65536;         
      //get the direction      
      h = p.read(); 
      l = p.read(); 
      azimuth=(int)(h<<8|l); 
      if (azimuth > 32767) azimuth -= 65536;

      // print("zone = ");
      // println((int)zoneNumber, (int)mode);
    }

    p.clear(); // 念のためクリア
  }


  //  port.write("A");
}

