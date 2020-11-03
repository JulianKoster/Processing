//Julian Koster IG103B
//Agar.io

float GPS = .5;
int NUMBER_OF_CIRCLES = 20;
color clr = color(0);

Player player = new Player();
Circles[] circle = new Circles[NUMBER_OF_CIRCLES];

void setup()
{
  size(800, 600);
  frameRate(240);
  for (int i = 0; i < NUMBER_OF_CIRCLES; i++)
  {
    circle[i] = new Circles();
  }
}

void draw()
{
  background(clr);
  player.update();
  for (int i = 0; i < NUMBER_OF_CIRCLES; i++)
  {
    circle[i].update();
    if (player.circlePlayerOverlap(circle[i].x, circle[i].y, circle[i].size))
    {
      if (player.size > 0 && circle[i].size > 0)
      {
        if (player.size > circle[i].size)
        {
          player.size += GPS;
          circle[i].size -= GPS;
        }
        if (player.size < circle[i].size)
        {
          player.size -= GPS;
          circle[i].size += GPS;
        }
      }
    }
  }
}  
