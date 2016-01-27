
int a, val;
int x, y, z;
int[][] iro = {{0,0,0,0,0,0,0},{0,1,2,3,1,2,0},{0,5,5,5,5,5,0},{0,5,5,5,5,5,0},{0,5,5,5,5,5,0,},{0,5,5,5,5,5,0},{0,0,0,0,0,0,0}}; 
int[] patern = {1,2,3}; 
int AcountFlag = 0;
int BcountFlag = 0;

int pos3x=100;
int pos3y=100;

void find(){
  for(int i = 1; i < 6; i++){
    
    for(int j = 1; j < 6; j++){
      
      if(iro[i][j] == patern[0]){ //find1
        
        //up          
        i--;
        if(i == 0){
        }
        
        else if(iro[i][j] == patern[1]){ //find2
                
          j--;//left
          if(j == 0){
          }
          else if(iro[i][j] == patern[2]){ //find3-1
            z++;
          }
          j++;          
          
          
          i--;//up
          if(i == 0){
          }
        else if(iro[i][j] == patern[2]){// find3-2
            y++;
          }
          i++;    
    
          j++;//right
          if(j == 6){
          }
          
          else if(iro[i][j] == patern[2]){//find3-3
            x++;
          }
          j--;
          
        }
        i++;
        
        
        //right
        j++;
        if(j == 6){
        }
        else if(iro[i][j] == patern[1]){//find2
        
          i--;//up
          if(i == 0){
          }
          else if(iro[i][j] == patern[2]){//find3-1
            z++;
          }
          i++;
                          
          j++;//right
          if(j == 6){
          }
          else if(iro[i][j] == patern[2]){//find3-2
            y++;
          }
          j--;
                          
          i++;//down
          if(i == 6){
          }
          else if(iro[i][j] == patern[2]){
            x++;
          }
          i--;
          
        } 
        j--; 
               
        
        //down    
        i++;
        if(i == 6){
        }
        else if(iro[i][j] == patern[1]){//find2
          
          j++;//right
          if(j == 6){
          }
          else if(iro[i][j] == patern[2]){//find3-1
            z++;
          }
          j--;
                  
          i++;//down
          if(i == 6){
          }
          else if(iro[i][j] == patern[2]){//find3-2
            y++;
          }
          i--;
    
          j--;//left
          if(j == 0){
          }
          else if(iro[i][j] == patern[2]){//find3-3
            x++;
          }
          j++;
                                      
        }
        i--;
        

        //left              
        j--;
        if(j == 0){
        }
        else if(iro[i][j] == patern[1]){//find2
          
          i++;//down
          if(i == 6){
          }
          else if(iro[i][j] == patern[2]){//find3-1
            z++;
          }
          i--;                  
          
          j--;//left
          if(j == 0){
          }
          if(iro[i][j] == patern[2]){//find3-2
            y++;
          }
          j++;
                                        
          i--;//up
          if(i == 0){
          }
          else if(iro[i][j] == patern[2]){//find3-3
            x++;
          }
          i++;
                                     
        }
        j++;
        
      }      
    }
  }         
}



void drawZone3(){
  
  find();
  int i,j,k;
  fill(100,100,100);
  stroke(100,100,100);
  noFill();
  quad(8+pos3x, 100+pos3y, 692+pos3x, 100+pos3y, 692+pos3x, 380+pos3y, 8+pos3x, 380+pos3y);
  line(230+pos3x, 100+pos3y, 230+pos3x, 380+pos3y);
  line(460+pos3x, 100+pos3y, 460+pos3x, 380+pos3y);
  textSize(20);
  text("5x5", 15+pos3x, 90+pos3y);
  text("patern", 235+pos3x, 90+pos3y);
  text("quad", 470+pos3x, 90+pos3y);
  text(x, 237+pos3x, 330+pos3y);
  text(y, 325+pos3x, 330+pos3y);
  text(z, 373+pos3x, 330+pos3y);
  x=0;y=0;z=0;
 
  for(i=1; i<6; i++){
    
    for(j=1; j<6; j++){
      
      if(iro[i][j] == 1){
        fill(255, 0, 0);
     }
      else if(iro[i][j] == 2){
        fill(0, 255, 0);
     }
      else if(iro[i][j] == 3){
        fill(0, 0, 255);
     }
      else{
        fill(0);
        noFill();
     }
      quad(19-40 + j*40+pos3x, 140-40 + i*40+pos3y, 59-40 + j*40+pos3x, 140-40 + i*40+pos3y, 59-40 + j*40+pos3x, 180-40 + i*40+pos3y, 19-40 + j*40+pos3x, 180-40 + i*40+pos3y);
    }
  }
  
  for(k=0; k<3; k++){
    if(patern[k] == 1){
      fill(255,0,0);
    }
    else if(patern[k] == 2){
      fill(0,255,0);
    }
    else if(patern[k] == 3){
      fill(0,0,255);
    }
    else{
      noFill();
    }
    
    if(k == 0){
      quad(277+pos3x,270+pos3y, 317+pos3x,270+pos3y, 317+pos3x,310+pos3y, 277+pos3x,310+pos3y);
      quad(325+pos3x,270+pos3y, 365+pos3x,270+pos3y, 365+pos3x,310+pos3y, 325+pos3x,310+pos3y);
      quad(373+pos3x,270+pos3y, 413+pos3x,270+pos3y, 413+pos3x,310+pos3y, 373+pos3x,310+pos3y);
    }
    else if(k == 1){
      quad(237+pos3x,270+pos3y, 277+pos3x,270+pos3y, 277+pos3x,310+pos3y, 237+pos3x,310+pos3y);
      quad(325+pos3x,230+pos3y, 365+pos3x,230+pos3y, 365+pos3x,270+pos3y, 325+pos3x,270+pos3y);
      quad(413+pos3x,270+pos3y, 453+pos3x,270+pos3y, 453+pos3x,310+pos3y, 413+pos3x,310+pos3y);
    }
    else if(k == 2){
      quad(237+pos3x,230+pos3y, 277+pos3x,230+pos3y, 277+pos3x,270+pos3y, 237+pos3x,270+pos3y);
      quad(325+pos3x,190+pos3y, 365+pos3x,190+pos3y, 365+pos3x,230+pos3y, 325+pos3x,230+pos3y);
      quad(413+pos3x,230+pos3y, 453+pos3x,230+pos3y, 453+pos3x,270+pos3y, 413+pos3x,270+pos3y);
    }    
  }


}
