PImage img;
String imgUrl = "JohnvonNeumann-LosAlamos.jpg";

// Prep for 30 x 40 canvas assuming 10px scaler
int graphWidth = 30;  
int graphHeight = 40; 
int graphSize = 30;

// Defining the screen size based on the canvas 
int screenWidth = graphWidth * graphSize;
int screenHeight = graphHeight * graphSize;

// Styling the pattern
int patternSize = 20;

void settings() {
  size(1133, 1511);
}

void setup() {
  background(255);
  fill(0);
  textSize(patternSize);
  
  img = loadImage(imgUrl);
  img.resize(width, height);
  for (int i = 0; i < width; i+= patternSize) {
    for (int j = 0; j < height; j+= patternSize) {
      int imgBrightness = int(brightness(img.get(i, j)));
      int angelAdams = int(map(imgBrightness, 0, 255, 0, 9));
      String letter = "";
      
      switch (angelAdams) {
        case 0:
          letter = "*";        
          break;
        case 1:
          letter = "%";        
          break;
        case 2:
          letter = "$";        
          break;
        case 3:
          letter = ")";        
          break;
        case 4:
          letter = "(";        
          break;
        case 5:
          letter = "<";        
          break;
        case 6:
          letter = ">";        
          break;
        case 7:
          letter = ".";        
          break;
        case 8:
          letter = " ";        
          break;
        case 9:
          letter = " ";        
          break;
      }
      pushMatrix();
      translate(i, j);
      noFill();
      stroke(0, 10);
      rect(0, 0, patternSize, patternSize);
      translate(patternSize/2, patternSize/2);
      fill(0);
      textAlign(CENTER, CENTER);
      text(letter, 0, 0);
      popMatrix();
    }
  }
}

void draw() {
  //background(img);
  noLoop();
  save("portrait.jpg");
}
