Table table;
int[] refills;

void setup() {
  size(600, 820);
  
  table = loadTable("TotalRefillPerDay.csv", "header");
  int rows = table.getRowCount();
  refills = new int[rows];
  for (int i = 0; i < rows; i++) {
    refills[i] = table.getInt(i, "Total refill per day");
  } 
}


void draw() {
  background(240);
  drawBottles();
  fill(0);
  textSize(24);
  text("My daily Water Intake", width / 2-107, 40);
  
 
}


void drawBottles(){
  background(240);
  int i = 0;
  for(float yPos= 70; yPos< height - 50; yPos+=150){
    for(float xPos= 100; xPos< width - 50; xPos+=100){
      // Cap
      fill(50, 100, 200);
      rect(xPos - 15, yPos, 30, 12);
      
      // Track the filling bottle's body as it made of a neck, shoulder, three rectangles and a bottom
      // Grey means that I missed a part of my daily water income while blue means that I reached it
      int grey = 0;
      if(refills[i] >= 5){
        grey = 0;
      }else if ( refills[i] >= 3){
        grey = 1;
      }else if (refills[i] >= 1){
        grey = 2;
      }
      
      // Track the shoulder and neck fill levels
      if(grey == 0){
        fill(220, 235, 255);
      }else{
        fill(198);
      }
      // Neck 
      rect(xPos - 10, yPos + 12, 20, 19);
       
      // Shoulder 
      noStroke();
      ellipse(xPos+0.5, yPos + 40, 65, 20);
      
      // Track the three rectangles fill levels 
      float yRectPos = yPos + 40;
       for (int x = 0; x<3;x++){
        if( x < grey ){
          fill(198);
        }else{
          fill(220, 235, 255);
        }
          rect(xPos - 32, yRectPos, 65, 30); 
          yRectPos += 30 ;
       }
       
       // Bottom, which always follows the last rectangle's filling state
       ellipse(xPos, yPos + 125, 65, 13);
       i++;  
       if (i >= refills.length) break;
    }
  }
}
