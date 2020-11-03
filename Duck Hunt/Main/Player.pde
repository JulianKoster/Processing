class Player
{
  color playerColor;
  float playerSize;
  float playerSizeHit;
  float playerPosX;
  float playerPosY;

  Player()
  {
    playerColor = (#000000);
    playerSize = 80;
    playerSizeHit = 10;
  }

  void update()
  {
    playerPosX = mouseX;
    playerPosY = mouseY;
    
    stroke(playerColor);
    strokeWeight(5);
    noFill();
    ellipse(playerPosX , playerPosY, playerSize, playerSize);
    noStroke();
    fill(playerColor);
    ellipse(playerPosX, playerPosY, playerSizeHit, playerSizeHit);
    rectMode(CENTER);
    rect(playerPosX, playerPosY, 80, 2);
    rect(playerPosX, playerPosY, 2, 80);
  }
}
