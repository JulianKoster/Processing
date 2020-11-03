class Duck
{
  float duckPosX;
  float duckPosY;
  float duckSize;
  float duckVelX;
  float duckVelY;
  color duckColor;
  int DUCK_SPAWN_MIN_X = 100;
  int DUCK_SPAWN_MAX_X = 1500;
  int DUCK_SPAWN_MIN_Y = 100;
  int DUCK_SPAWN_MAX_Y = 160;  
  
  Duck()
  {
    duckColor = (#ede1ca);
    duckSize = 50;
    duckPosX = random(DUCK_SPAWN_MIN_X, DUCK_SPAWN_MAX_X);
    duckPosY = random(DUCK_SPAWN_MIN_Y, DUCK_SPAWN_MAX_Y);
    duckVelX = random(-10, 10);
    duckVelY = random(5, 10);
  }

  void update()
  {
    //Hoe de ducks eruit zien
    stroke(0);
    strokeWeight(2);
    fill(duckColor);
    ellipse(duckPosX, duckPosY, duckSize, duckSize);
    //laat de eenden bewegen
    //duckPosX -= duckVelX;
    //duckPosY -= duckVelY;
  }
}
