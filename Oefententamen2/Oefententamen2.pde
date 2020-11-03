//Oefentoets Programming GD - TypeAttack
//Julian Koster IG103B

final int SPAWN_HEIGHT_MIN = -500, SPAWN_HEIGHT_MAX = -100;
final int LETTER_OFFSET = 40;
final int LASER_WIDTH = 10, EXPLOSION_SIZE = 200;
final int PENALTY = 1000;
char[] letters = { 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l' };
float[] letterPositionX = new float[letters.length];
float[] letterPositionY = new float[letters.length];
 
int score = 0;
 
void setup()
{
  size(800, 600);
 
  //Spawn
  int letterGap = width / letters.length;
  for (int iLetter = 0; iLetter < letters.length; iLetter++)
  {
    letterPositionX[iLetter] = LETTER_OFFSET + iLetter * letterGap;
    letterPositionY[iLetter] = random(0, 1);
  }
 
  textSize(40);
}
 
void draw()
{
  background(0);
  
  //Moved de letters
  for (int iLetter = 0; iLetter < letters.length; iLetter++)
  {
    letterPositionY[iLetter]++;
    
    // Collision check and resolve
    if(keyPressed && key == letters[iLetter] && isLetterOnScreen(iLetter))
    {
      fill(255, 0, 0);
      rect(letterPositionX[iLetter], letterPositionY[iLetter], LASER_WIDTH,height - letterPositionY[iLetter]);
      fill(#FF8A15);
      circle(letterPositionX[iLetter], letterPositionY[iLetter], EXPLOSION_SIZE);
      
      score += height - letterPositionY[iLetter];
      letterPositionY[iLetter] = random(SPAWN_HEIGHT_MIN, SPAWN_HEIGHT_MAX);
    }
    
    // als de letter onderaan het speelveld verlaat
    if(letterPositionY[iLetter] > height)
    {
      score -= PENALTY;
      letterPositionY[iLetter] = random(SPAWN_HEIGHT_MIN, SPAWN_HEIGHT_MAX);
    }
  }
  
  //Tekent de letters
  for (int iLetter = 0; iLetter < letters.length; iLetter++)
  {
    fill(255);
    text(letters[iLetter], letterPositionX[iLetter], letterPositionY[iLetter]);
  }
  
  //Score
  if (score < 0) score = 0;
  text(score, LETTER_OFFSET / 2, LETTER_OFFSET);
}
 
boolean isLetterOnScreen(int letterIndex)
{
  return letterPositionY[letterIndex] > 0 && letterPositionY[letterIndex] < height;
}
