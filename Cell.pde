class Cell
{
  private int row,column;
  private float x,y;
  private boolean isAlive = false;
  private boolean aliveNext = false;
  
  public Cell(int row, int column)
  {
    this.row = row;
    this.column = column;
    this.x = row * CELL_WIDTH; // The x value derived by finding the width of a cell, and then multiplying with number row
    this.y = column * CELL_HEIGHT; // same as above, with y-axis
  }
  
  void render() // renders black if alive, white if not.
  {
    if(isAlive)
    {
      fill(0,0,0); // Standard coloring
//      fill(random(255),random(255),random(255)); // Madness disco coloring
    }
    else
    {
      fill(255,255,255); // Standard coloring
//      fill(0,0,0); // Madness disco coloring
    }
    stroke(140,140,140); 
    rect(x,y,CELL_WIDTH,CELL_HEIGHT);
    
  }
  void setAlive(boolean b)
  {
    this.isAlive = b;
  }
  boolean isAlive()
  {
    return isAlive;
  }
  boolean isActive() // If cell is the outmost in the grid, in any orientation, return false.
  {
    if(row == 0 || row == GRID_WIDTH-1 || column == 0 || column == GRID_HEIGHT-1)
    {
      return false;
    }
    else
    {
      return true;
    }
  }
  void setAliveNext(boolean b)
  {
    this.aliveNext = b;
  }
  boolean isAliveNext()
  {
    return aliveNext;
  }
  
  float getX()
  {
    return x;
    
  } 
  float getY()
  
  {
    return y;
  }
  @Override
  String toString()
  {
    return "Cell " + row + ", " + column; 
  }    
}
