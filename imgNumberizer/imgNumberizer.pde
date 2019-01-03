/**
* ImageNumberizer converts given images to an ASCII art like graphic
* using the brightness values of the given input
* 
* Matthias Jäger, Graz 2018
*/

// Data in
PImage img;
String imgUrl = "JohnvonNeumann-LosAlamos.jpg";

// Dimension settings
int graphWidth = 30;  
int graphHeight = 40; 
int graphSize = 30;
int screenWidth = graphWidth * graphSize;
int screenHeight = graphHeight * graphSize;
int patternSize = 20;

// Mapping brightness     0    1    2    3    4    5    6    7    8    9    
String[] tonalSymbols = {"*", "%", "$", ")", "(", "<", ">", ".", " ", " "};        


void settings() 
{
  size(screenWidth, screenHeight);
}

void setup() 
{
  background(255);
  fill(0);
  textSize(patternSize);

  img = loadImage(imgUrl);
  img.resize(width, height);

  for (int i = 0; i < width; i+= patternSize) 
  {
    for (int j = 0; j < height; j+= patternSize) 
    {
      color currentColor = img.get(i, j);
      float imgBrightness = brightness(currentColor);
      float mappedBightness = map(imgBrightness, 0, 255, 0, tonalSymbols.length-1);
      int indexSymbols = int(mappedBightness);
      pushMatrix();
      translate(i, j);
      noFill();
      stroke(0, 10);
      rect(0, 0, patternSize, patternSize);
      translate(patternSize/2, patternSize/2);
      fill(0);
      textAlign(CENTER, CENTER);
      text(tonalSymbols[indexSymbols], 0, 0);
      popMatrix();
    }
  }
}

void draw() 
{
  noLoop();
  save("portrait.jpg");
  exit();
}
