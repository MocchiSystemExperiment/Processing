public class ellipseIcon extends icon { 

  void checkClick() {
    int dis = (mouseX-(x+size_x/2))*(mouseX-(x+size_x/2)) + (mouseY-(y+size_y/2)) * (mouseY-(y+size_y/2));
    if (dis<= size_x/2*size_x/2) {
      clicked();
    }
  }

  void checkDrag() {
    int dis = (mouseX-(x+size_x/2))*(mouseX-(x+size_x/2)) + (mouseY-(y+size_y/2)) * (mouseY-(y+size_y/2));
    if (dis<= size_x/2*size_x/2) {
      dragged();
    }
  }

  void draw() {

    //if (status==0)return;
    stroke(iconColor[0], iconColor[1], iconColor[2]);
    fill(iconColor[0], iconColor[1], iconColor[2]);


    //rect(x, y, size_x, size_y);

    ellipse(x+size_x/2, y+size_y/2, size_x, size_y);
    image(data[status], x+20, y+20, size_x-40, size_y-40);
  }
}

