import processing.serial.*;

boolean DEBUG_MODE = true;

public class setting {
  //zumo
  public static final String SERIAL_COM_PORT = "COM18";
  public static final int SERIAL_COM_BAUND_RATE = 9600;

  //othre arduino  
  public static final String SERIAL_COM_PORT_2 = "COM1";
  public static final int SERIAL_COM_BAUND_RATE_2 = 57600;

  //screen size 1366x768
  public static final int WINDOW_MAIN_X = 1366;
  public static final int WINDOW_MAIN_Y = 768;
}




Serial port;//zumo
Serial port2;//other arduino



//program stats
//0:not connect
//1:connect
//2:disconnect
int status=0;
float lastConnectedTime=0;


int zoneNumber, mode;//Arduino's variables

int[] green = new int[setting.WINDOW_MAIN_X/10];
int[] red = new int[setting.WINDOW_MAIN_X/10];
int[] blue = new int[setting.WINDOW_MAIN_X/10];

int max_x, max_y, min_x, min_y;
int mx, my, ax, ay, az, azimuth;

long intervalTime;

int motorR=0, motorL=0;

int[] motorRLog = new int[5000];
int[] motorLLog = new int[5000];
int[] azimthLog = new int[5000];
int[] colorLog = new int[5000];
int motorCount=0;


int[] sensors = new int[5];
int count;
int[] sensors_p = new int[5];

int view;

float zone6BarVal1;
float zone6BarVal2;
int zone6AutomationFlag=0;
double zone6Rate=0.5;


//subWindow sub1 ;
drawFunction d ;

//PImage birdEye;//俯瞰図



//for zone1

int  zone1_point[] = new int[5];

HScrollbar hs1, hs2;
ellipseIcon[] ic;


void setup() {
  //make instances
  d= new drawFunction();
  hs1 = new HScrollbar(800, height-50, width, 16, 16);
  hs2 = new HScrollbar(1000, height-50, width, 16, 16);

  //ic = new icon[drawSetting.ICON_NUM];
  ic = new ellipseIcon[5];


  for (int i=0; i<5; i++) {
    ic[i] = new ellipseIcon();
    ic[i].init(i+1);
  }
  ic[0].setBackground(134, 226, 213);
  ic[0].setPosition(0, 0);

  ic[1].setBackground(134, 226, 213);
  ic[1].setPosition(110, 0);

  ic[2].setBackground(134, 226, 213);
  ic[2].setPosition(220, 0);

  ic[3].setBackground(134, 226, 213);
  ic[3].setPosition(330, 0);

  ic[4].setBackground(134, 226, 213);
  ic[4].setPosition(440, 0);



  size(setting.WINDOW_MAIN_X, setting.WINDOW_MAIN_Y);
  background(255);



  //initialize variables
  view=0;
  for (int i=0; i<red.length; i++) {
    red[i]=0;
    green[i]=0;
    blue[i]=0;
  }

  for (int i=0; i<5000; i++) {
    motorLLog[i]=-1;
    motorRLog[i]=-1;
    azimthLog[i]=-1;
    colorLog[i]=-1;
  }


  count = 0;
  intervalTime=0;

  //port = new Serial(this, setting.SERIAL_COM_PORT, setting.SERIAL_COM_BAUND_RATE );
}

void draw() {
  background(255);




  // d.drawTab(this, view);


  ic[0].draw();
  ic[1].draw();
  ic[2].draw();
  ic[3].draw();
  ic[4].draw();

  switch(view) {
  case 0://main

    //image(d.birdEye, 0, d.TAB_Y);
    d.birdeye.draw(this);

    d.drawCurrentPosition(this);


    d.drawInfo(this, 800);




    break;
  case 1://line grapg
    d.drawColorLineGraph(this);
    break;
  case 2://zone3
    drawZone3();
    break;
  case 3://zone6

    if (zone6AutomationFlag==1) {
      noStroke();
      hs1.update();
      hs1.display();
      hs2.update();
      hs2.display();



      zone6BarVal1 = hs1.getPos()-953.30;
      text(zone6BarVal1, 800, 33);
      zone6BarVal2 = hs2.getPos()-1191.590;
      text(zone6BarVal2, 1000, 33);
    } else {
      d.drawZone6CalcBotton(this);
    }


    d.drawZone6(this);
    d.drawZone6Tab(this, zone6AutomationFlag) ;
    break;

  case 4: //zone1


    break;
  }



  /*
  red = map(sensors[2],0, 100, 0, 255);
   green = map(sensors[3],0, 100, 0, 255);
   blue = map(sensors[4],0, 100, 0, 255);
   fill(red, green, blue);
   ellipse(count*10, 20, 10, 10 );
   */







  if ( count == 120 ) {
    count = 0;
    background(255);
  }
}
void mouseDragged() {
  /*ic[0].checkDrag();
   ic[1].checkDrag();
   ic[2].checkDrag();
   ic[3].checkDrag();
   ic[4].checkDrag();*/
}
void mousePressed() {

  ic[0].checkClick();
  ic[1].checkClick();
  ic[2].checkClick();
  ic[3].checkClick();
  ic[4].checkClick();



  //menu select tab
  if (mouseY<drawFunction.TAB_Y) {
    for (int i=0; i < drawFunction.TAB_NAME.length; i++) {
      if (mouseX<drawFunction.TAB_X*(i+1)) {
        view=i;
        return;
      }
    }
  }



  //tab for zone 6
  if (view==3 && mouseY<drawFunction.TAB_Y) {
    for (int i=0; i < drawFunction.ZONE6_TAB_NAME.length; i++) {
      if (mouseX>width-drawFunction.TAB_X*(i+1)) {
        zone6AutomationFlag=i;
        return;
      }
    }
  }

  if (view==3 && zone6AutomationFlag == 0 && mouseX>width-drawFunction.TAB_X && mouseY<drawFunction.TAB_Y) {
    calcZone6();
  }
}


void serialEvent(Serial p) { // p is anonymous  
  // Serial port ;//= com.getSerialNumber();
  // if(port!=p)return;
  int h, l;
  if ( p.available() >= 34 ) {
    lastConnectedTime=millis();

    int f=p.read();
    if (f  == 'Z' ) {
      int point = p.read();
      if (point == '1') {
        zone1_point[0]=1;
      } else if (point== '2') {
        zone1_point[1]=1;
      } else if (point== '3') {
        zone1_point[2]=1;
      } else if (point== '4') {
        zone1_point[3]=1;
      } else if (point== '5') {
        zone1_point[4]=1;
      }
      return;
    } else if ( f == 'H' ) {
      zoneNumber = p.read();
      mode =  p.read();

      for (int i=0; i<red.length-1; i++) {
        red[i]=red[i+1];
        green[i]=green[i+1];
        blue[i]=blue[i+1];
      }
      red[red.length-1] =  p.read();
      green[green.length-1] = p.read();
      blue[blue.length-1] =  p.read();

      ++count;
      if (count>=red.length)count=0;



      intervalTime = ((((((p.read()<<8)+p.read())<<8)+p.read())<<8)+p.read());

      h = p.read(); 
      l = p.read(); 
      motorR=(int)(h<<8|l); 
      if ( motorR> 32767) motorR -= 65536;


      h = p.read(); 
      l = p.read(); 
      motorL=(int)(h<<8|l); 
      if ( motorL> 32767) motorL -= 65536;

      //get the direction      
      h = p.read(); 
      l = p.read(); 
      azimuth=(int)(h<<8|l); 
      if (azimuth > 32767) azimuth -= 65536;



      //for zone6
      if (zoneNumber==6 && mode>=3 ) {

        motorLLog[motorCount]=motorL;
        motorRLog[motorCount]=motorR;
        azimthLog[motorCount]=azimuth;
        if (red[red.length-1]>blue[red.length-1] && blue[red.length-1] < 40) {
          colorLog[motorCount]=1;
        } else {
          colorLog[motorCount]=0;
        }
        motorCount++;
        if (motorCount==5000)motorCount=0;
      }
    } else if ( f == 'D' ) {

      //get  max/min values of geomagnetic sensor
      h = p.read();
      l = p.read(); 
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
    } else if ( f == 'M' ) {
      // get the current sensor values of geomagnetic sensor
      h = p.read(); 
      l = p.read(); 
      mx=(int)(h<<8|l); 
      if (mx > 32767) mx -= 65536;         
      h = p.read(); 
      l = p.read(); 
      my=(int)(h<<8|l); 
      if (my > 32767) my -= 65536;
    } else if ( f == 'A' ) {
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


      //p.clear(); // 念のためクリア
    }
  }


  //  port.write("A");
}



void calcZone6() {
  double dis=99999, j, k, minJ=0.5;

  for (j=0; j<=1; j+=0.05) {
    double startX=0;
    double startY=0;
    double X, Y;

    for (int i=2; i<5000-1; i++) {
      if (azimthLog[i]==-1)break;


      float sum = azimthLog[i]+azimthLog[i-1]+azimthLog[i-2];

      if (motorLLog[i] == -motorRLog[i]) {
        X=j*cos(radians(sum/3));
        Y=j*sin(radians(sum/3));
      } else {
        X=cos(radians(sum/3));
        Y=sin(radians(sum/3));
      }
      startX-=X;
      startY-=Y;
    }


    double _tmp = startX*startX+startY*startY;
    if (dis>_tmp) {
      dis=_tmp;
      minJ=j;
    }
  }

  zone6Rate = minJ;
}

