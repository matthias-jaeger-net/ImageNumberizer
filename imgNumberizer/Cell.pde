public class Cell 
{
  int[] pos = new int[2];
  color col = 0;
  String sym = "";

  Cell(int x, int y) 
  {
    pos[0] = x;
    pos[1] = y;
    col = getColor();
    sym = getSymbol();
  }

  color getColor() 
  {
    return img.get(pos[0], pos[1]);
  }

  String getSymbol() 
  {
    float imgBrightness = brightness(col);
    float mapBightness = map(imgBrightness, 0, 255, 0, tonalSymbols.length-1);
    int indexSymbols = int(mapBightness);
    return tonalSymbols[indexSymbols];
  }

  void renderBounds() 
  {
    noFill();
    stroke(0, 10);
    rect(pos[0], pos[1], patternSize, patternSize);
  }
  
  void renderText() 
  {
    fill(0);
    textSize(patternSize);
    textAlign(CENTER, CENTER);
    text(sym, pos[0] + patternSize/2, pos[1] + patternSize/2);
  }

  void render() 
  {
    renderBounds();
    renderText();
  }
}
