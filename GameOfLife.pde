/**
* @author Mads Steensig Pelt
*/

// display size in pixels
final static float SCREEN_WIDTH = 800;
final static float SCREEN_HEIGHT = 600;

// grid dimensions in cells
final static int GRID_WIDTH = 90;
final static int GRID_HEIGHT = 50;

// Cell
final static float CELL_WIDTH = SCREEN_WIDTH / GRID_WIDTH;
final static float CELL_HEIGHT = SCREEN_HEIGHT / GRID_HEIGHT;

// The interval in milliseconds between each update
 final static float SPEED = 800; //Original
//final static float BPM = 90;
//final static float SPEED = 60000 / BPM;

// The grid!!!!
Grid grid;
long lastTime;
boolean isRunning = false;

void setup()
{
  size((int)SCREEN_WIDTH,(int)SCREEN_HEIGHT);
  lastTime = millis();
  grid = new Grid();
}

void draw()
{
  if(!isRunning) // if the simulation is not running, while you are placing cells
  {
    // For every cell in the grid, render.
    for(int i = 0; i<GRID_HEIGHT; i++)
    {
      for(int j = 0; j<GRID_WIDTH; j++)
      {
        grid.getCell(j,i).render();
      }
    }
    if(mousePressed)
    {
      Cell tempCell = grid.getCellAtPx(mouseX,mouseY);
      if(tempCell != null && !isRunning)
      {
        tempCell.setAlive(true);
      }
    }
  }
  
  else // If the simulation is running
  {
       // For every cell in the grid, render. Then update grid, and overwrite lastTime.
    for(int i = 0; i<GRID_HEIGHT; i++)
    {
      for(int j = 0; j<GRID_WIDTH; j++)
      {
        grid.getCell(j,i).render();
      }
    }
    if(millis() > lastTime + SPEED)
    {
      grid.logic();
      grid.update();
      lastTime = millis();
    }
  }
    
}

void keyPressed()
{
  if(key == ENTER)
  {
    if(!isRunning)
    {
      isRunning = true;
    }
    else
    {
      isRunning = false;
      grid.initGrid();
    }
  }
  if(key == 'c')
  {
    if(!isRunning)
    {
      grid.initGrid();
    }
  }
}
