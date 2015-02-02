class Grid
{
  private Cell[][] gridArr = new Cell[GRID_WIDTH][GRID_HEIGHT]; // The actual grid, in a 2d-arrays of Cell objects.
  
  public Grid()
  {
    initGrid();    
  }
  public void initGrid()
  {
    for(int i = 0; i<GRID_HEIGHT; i++) // y-axis
    {
      for(int j = 0; j<GRID_WIDTH; j++) // x-axis
      {
        gridArr[j][i] = new Cell(j,i); // Adds a new Cell to every point in the grid.
      }
    }
  }
  
  // For every loop in the draw() method, this is called, if the simulation is running.
  // Iterates through all cells, checks their neighbours.
  // If a living cell has less than 2 or more than 3 neighbours, it dies
  // If a dead cell has 3 neighbours it lives.
  public void logic()
  {
    for(int i = 0; i < GRID_HEIGHT; i++) // Y-axis
    {
      for(int j = 0; j < GRID_WIDTH; j++) // X--axis
      {
        
        if(gridArr[j][i].isActive())
        {
          int neighbours = getNeighbours(j,i);
          if(gridArr[j][i].isAlive() && ( neighbours < 2 || neighbours > 3))
          {
            gridArr[j][i].setAliveNext(false);
          }
          if(!gridArr[j][i].isAlive() && neighbours == 3)
          {
            gridArr[j][i].setAliveNext(true);
          }
        }
      }
    }
  }
  
  public void update()
  {
    for(int i = 0; i < GRID_HEIGHT; i++) // Y-axis
    {
      for(int j = 0; j < GRID_WIDTH; j++) // X--axis
        {
        
          if(gridArr[j][i].isActive())
          {
            if(gridArr[j][i].isAliveNext())
            {
              gridArr[j][i].setAlive(true);
            }
            if(!gridArr[j][i].isAliveNext())
            {
              gridArr[j][i].setAlive(false);
            }
          }
        }
      }
  }

  
  
  public Cell getCell(int x, int y)
  {
    return gridArr[x][y];
  }
  public int getNeighbours(int row, int column) // Checks all possible neightbours, returns amount living. Using ternary operators.
  {
    int result = 0;
    result = (gridArr[row-1][column].isAlive()) ? result + 1 : result;
    result = (gridArr[row][column-1].isAlive()) ? result + 1 : result;
    result = (gridArr[row+1][column].isAlive()) ? result + 1 : result;
    result = (gridArr[row][column+1].isAlive()) ? result + 1 : result;
    result = (gridArr[row-1][column-1].isAlive()) ? result + 1 : result;
    result = (gridArr[row+1][column+1].isAlive()) ? result + 1 : result;
    result = (gridArr[row-1][column+1].isAlive()) ? result + 1 : result;
    result = (gridArr[row+1][column-1].isAlive()) ? result + 1 : result;
    
    return result;
  }
  
  Cell getCellAtPx(int mousex,int mousey) 
  {
    float row = mousex / CELL_WIDTH;
    float column = mousey / CELL_HEIGHT;
    if(row<GRID_WIDTH && column<GRID_HEIGHT && row >= 0 && column >= 0)
    {
      return gridArr[(int)row][(int)column];  
    }
    else
    {
      return null;
    }
  }
}
