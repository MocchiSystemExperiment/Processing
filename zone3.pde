
int i, j, k, a, val;
int x, y, z;
int[][] iro = {{0,0,0,0,0,0,0},{0,5,5,5,5,5,0},{0,5,5,5,5,5,0},{0,5,5,5,5,5,0},{0,5,5,5,5,5,0,},{0,5,5,5,5,5,0},{0,0,0,0,0,0,0}}; 
int[] patern = {0,0,0}; 
int AcountFlag = 0;
int BcountFlag = 0;



void find(){
  for(i = 1; i < 6; i++){
    
    for(j = 1; j < 6; j++){
      
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
   fill(0);
  noFill();
  quad(8, 100, 692, 100, 692, 380, 8, 380);
  line(230, 100, 230, 380);
  line(460, 100, 460, 380);
  textSize(20);
  text("5x5", 15, 90);
  text("seikainopatern", 235, 90);
  text("sikakkei", 470, 90);
  text(x, 237, 330);
  text(y, 325, 330);
  text(z, 373, 330);
 
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
      quad(19-40 + j*40, 140-40 + i*40, 59-40 + j*40, 140-40 + i*40, 59-40 + j*40, 180-40 + i*40, 19-40 + j*40, 180-40 + i*40);
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
      quad(277,270, 317,270, 317,310, 277,310);
      quad(325,270, 365,270, 365,310, 325,310);
      quad(373,270, 413,270, 413,310, 373,310);
    }
    else if(k == 1){
      quad(237,270, 277,270, 277,310, 237,310);
      quad(325,230, 365,230, 365,270, 325,270);
      quad(413,270, 453,270, 453,310, 413,310);
    }
    else if(k == 2){
      quad(237,230, 277,230, 277,270, 237,270);
      quad(325,190, 365,190, 365,230, 325,230);
      quad(413,230, 453,230, 453,270, 413,270);
    }    
  }
  find();


}
