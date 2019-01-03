/**
* ImageNumberizer converts given images to an ASCII art like graphic
* using the brightness values of the given input
* 
* Matthias Jäger, Graz 2018
*/

// Image Data input
PImage img;
String imgUrl = "JohnvonNeumann-LosAlamos.jpg";

Cell[] cells; 
Cell[] buffer; 

// Dimension settings
int graphWidth = 30;  
int graphHeight = 40; 
int graphSize = 30;
int patternSize = 20;
int index = 0;

// Mapping brightness     0    1    2    3    4    5    6    7    8    9    
String[] tonalSymbols = {"*", "%", "$", ")", "(", "<", ">", ".", " ", " "};        

void settings() 
{
  size(graphWidth * graphSize, graphHeight * graphSize);
}

void setup() 
{
  background(255);
  fill(0);
  
  float rows = width / patternSize;
  float cols = height / patternSize;
  int totalCells = int(rows * cols);
  
  cells = new Cell[totalCells];
  buffer = new Cell[totalCells];

  img = loadImage(imgUrl);
  img.resize(width, height);

  for (int i = 0; i < width; i+= patternSize) 
  {
    for (int j = 0; j < height; j+= patternSize) 
    {
      cells[index] = (new Cell(i, j));
      index++;
    }
  }
}

void draw() 
{
  //noLoop();
  background(255);
  
  for (Cell cell : cells) {
    cell.render();
  }

  //save("portrait.jpg");
  //exit();
}
