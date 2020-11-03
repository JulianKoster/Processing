//Julian Koster IG103B
//Duck Hunt

color skyColor = (#3cbcfd);
color grassColor = (#80cf11);
color groundColor = (#877000);
color text = (#eeeeee);
int MAX_NUMBER_DUCKS = 10;
int DUCK_OFFSET = 20;

//score variabels = currentScore = ducksKilled * POINTS_FOR_HIT - (Shots - ducksKilled * POINTS_FOR_MISS)
int POINTS_FOR_HIT = 5;
int POINTS_FOR_MISS = -10;

int currentScore = 0; 
int ducksKilled = 0;
int shots = 0;

// Is er collision met de playerSizeHit en een iDucks?
boolean isHit = false;

// Is er op de muis gedrukt?
boolean isClicked = false;

Duck[] ducks = new Duck[MAX_NUMBER_DUCKS];
Duck duck = new Duck();
Player player = new Player();


void setup()
{
  size(1600, 900);
  frameRate(30);
  for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
  {
    ducks[iDucks] = new Duck();
  }
}

void draw()
{
  //Enviroment achtergrond
  noStroke();
  background(skyColor);

  //Ducks spawnen
  for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
  {
    ducks[iDucks].update();
  }

  //Walls links en rechts die de VelX omdraaien
  for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
  {
    if (ducks[iDucks].duckPosX < 0 + DUCK_OFFSET || ducks[iDucks].duckPosX > width - DUCK_OFFSET)
    {
      ducks[iDucks].duckVelX *= -1;
    }
  }

  //Plafond boven om de ducks weer een random positie en velocity te geven
  for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
  {
    if (ducks[iDucks].duckPosY < - 500)
    {
      ducks[iDucks].duckPosX = random(duck.DUCK_SPAWN_MIN_X, duck.DUCK_SPAWN_MAX_X);
      ducks[iDucks].duckPosY = random(duck.DUCK_SPAWN_MIN_Y, duck.DUCK_SPAWN_MAX_Y);
    }
  }

  //Wanneer de speler met de linkermuisknip op een eend schiet, reset de eend beneden het scherm en krijg je punten, misschieten is punten minder
  for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
  {
    if (player.playerPosX + player.playerSizeHit > ducks[iDucks].duckPosX - DUCK_OFFSET && player.playerPosX < ducks[iDucks].duckPosX - DUCK_OFFSET + ducks[iDucks].duckSize
     && player.playerPosY + player.playerSizeHit > ducks[iDucks].duckPosY - DUCK_OFFSET && player.playerPosY < ducks[iDucks].duckPosY - DUCK_OFFSET + ducks[iDucks].duckSize)
    {
      isHit = true;
    } else
    {
      isHit = false;
    }


    if (mousePressed)
    {
      isClicked = true;
      if (isClicked && isHit)
      {
        ducksKilled++;
        ducks[iDucks].duckPosX = random(duck.DUCK_SPAWN_MIN_X, duck.DUCK_SPAWN_MAX_X);
        ducks[iDucks].duckPosY = random(duck.DUCK_SPAWN_MIN_Y, duck.DUCK_SPAWN_MAX_Y);
      }
    }
    else if (!mousePressed)
    {
      isClicked = false;
    }
    //println(iDucks + " is " + isHit); //debug
    //println("Is mouse pressed?: " + isClicked);
    
//----------------------------------------------------------
    println("shots: " + shots);
    println("ducksKilled: " + ducksKilled);
    println("currentScore: " + currentScore); 
    
    int shotsMinusMis = ducksKilled - shots;
    int duckScore = ducksKilled * POINTS_FOR_HIT;
    int penaltyScore = shotsMinusMis * POINTS_FOR_MISS;
    println("Score of ducks killed = " + duckScore);
    println("Shots - duckskilled = " + shotsMinusMis);
  
    currentScore = duckScore - penaltyScore;
//----------------------------------------------------------

  }

  //enviroment voorgrond
  fill(grassColor);
  rectMode(CORNER);
  rect(0, height - 280, width, 280);
  fill(groundColor);
  rectMode(CORNER);
  rect(0, height - 180, width, 280);



  
  fill(text);
  textAlign(CENTER);
  textSize(60);
  text("Score: " + currentScore, width / 2, height - 70);

  player.update();
}

void mouseReleased()
{
    shots++;
 
}
/*
 //konki
 for (int iDucks = 0; iDucks < MAX_NUMBER_DUCKS; iDucks++)
 {
 if (player.playerPosX + player.playerSizeHit > ducks[iDucks].duckPosX - DUCK_OFFSET && player.playerPosX < ducks[iDucks].duckPosX - DUCK_OFFSET + ducks[iDucks].duckSize
 && player.playerPosY + player.playerSizeHit > ducks[iDucks].duckPosY - DUCK_OFFSET && player.playerPosY < ducks[iDucks].duckPosY - DUCK_OFFSET + ducks[iDucks].duckSize)
 {
 isHit = true;
 if  (mousePressed && mouseButton == LEFT)
 {
 score += POINTS;
 ducks[iDucks].duckPosX = random(duck.DUCK_SPAWN_MIN_X, duck.DUCK_SPAWN_MAX_X);
 ducks[iDucks].duckPosY = random(duck.DUCK_SPAWN_MIN_Y, duck.DUCK_SPAWN_MAX_Y);
 }
 } else if isHit = false;
 {
 (mousePressed && mouseButton == LEFT)
 score -= PENALTY;
 }
 }
 */
