public class Cell 
{
  int[]   cPos   = new int[2];
  color   cCol   = 0;
  String  cSym   = "";
  boolean cAlive = false;

  Cell(int x, int y) 
  {
    cPos[0] = x;
    cPos[1] = y;
    cCol = getColor();
    cSym = getSymbol(cCol);
  }

  color getColor() 
  {
    return img.get(cPos[0], cPos[1]);
  }

  String getSymbol(color c) 
  {
    float bright = brightness(c);
    float min = 0;
    float max = 255;
    float sym = tonalSymbols.length-1;
    float mapping = map(bright, min, max, min, sym);
    int indexSymbols = int(mapping);
    return tonalSymbols[indexSymbols];
  }

  void renderBounds() 
  {
    noFill();
    stroke(0, 10);
    rect(cPos[0], cPos[1], patternSize, patternSize);
  }

  void renderText() 
  {
    fill(0);
    textSize(patternSize);
    textAlign(CENTER, CENTER);
    text(cSym, cPos[0] + patternSize/2, cPos[1] + patternSize/2);
  }

  void render() 
  {
    renderBounds();
    renderText();
  }
}
