/**
* ImageNumberizer converts given images to an ASCII art like graphic
* using the brightness values of the given input
* 
* Matthias Jäger, Graz 2018
*/

// Image Data input
PImage img;
String imgUrl = "JohnvonNeumann-LosAlamos.jpg";

// The image is split in cells
ArrayList<Cell> cells = new ArrayList<Cell>(); 

// Dimension settings
int graphWidth = 30;  
int graphHeight = 40; 
int graphSize = 30;

int patternSize = 20;

// Mapping brightness     0    1    2    3    4    5    6    7    8    9    
String[] tonalSymbols = {"*", "%", "$", ")", "(", "<", ">", ".", " ", " "};        

// String[] tonalSymbols = {"W", "O", "R", "L", "D"};        


void settings() 
{
  size(graphWidth * graphSize, graphHeight * graphSize);
}

void setup() 
{
  background(255);
  fill(0);

  img = loadImage(imgUrl);
  img.resize(width, height);

  for (int i = 0; i < width; i+= patternSize) 
  {
    for (int j = 0; j < height; j+= patternSize) 
    {
      cells.add(new Cell(i, j));
    }
  }
}

void draw() 
{
  noLoop();
  
  for (Cell c : cells) 
    c.render();
  
  save("portrait.jpg");
  exit();
}
