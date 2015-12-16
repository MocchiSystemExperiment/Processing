import javax.swing.*; 
import java.awt.Dimension;
import javax.swing.JFrame;

class subWindow  extends PApplet {
  JFrame frame;
  PApplet main;

  subWindow(PApplet applet) {
    main = applet;

    frame = new JFrame(main.frame.getTitle());
    frame.setIconImages(main.frame.getIconImages());
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setResizable(false);
    size(200, 200);
    frame.add(this);
    frame.setVisible(true);
    init();
    noLoop();
  }



  void size(int w, int h) {
    super.resize(w, h);
    frame.getContentPane().setPreferredSize(new Dimension(w,h));
    frame.pack();
  }

  void setup() {
  }

  void draw() {
  }
}

