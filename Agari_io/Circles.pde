class Circles
{
  float size;
  float x;
  float y;
  color clr;
  
  Circles()
  {
    x = random(0, width);
    y = random(0 , height);
    size = random(40, 200);
    clr = color (random(100, 255));
  }
  
    void update()
    {
      fill(clr);
      ellipse(x, y, size, size);
    }
}
