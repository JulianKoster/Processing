class Player
{
  float size;
//  float x;
//  float y;
  color clr;

  Player()
  {
    size = 60;
    clr = color(255, 0, 0);
  }
  
    void update()
    {
      fill(clr);
      circle(mouseX, mouseY, size);
    }
    
    boolean circlePlayerOverlap(float x, float y, float size)
    {
      float dx = x - mouseX;
      float dy = y - mouseY;
      return sqrt(dx * dx + dy * dy) < size / 2 + this.size / 2;
      //return dist(mouseX, mouseY, x, y) < size / 2 + this.size / 2;
    }
}
