/** Class: Pipe
  * Handles functions of the pipes
  */
public class Pipe{

  // Pipe properties
  float[] pipeX, pipeY;  
  
  private PImage tPipe;  // Top pipe
  private PImage bPipe;  // Bottom pipe
  
  /** Constructor: Pipe()
    * Sets up pipe arrays and loads images
    */
  public Pipe(){    
    this.tPipe = loadImage("assets/tree-down-long.png");
    this.bPipe = loadImage("assets/tree-up-long.png");
    
    // Initializes the arrays to [0,0,0,0,0]
    pipeX = new float[5];   
    
    // Used for the different pipe locations
    pipeY = new float[pipeX.length];         
    
    // Populates the arrays with values for the pipes
    for (int i = 0; i < pipeX.length; i++){   
      pipeX[i] = width + 250 * i;
      pipeY[i] = random(-250, -15);
    }
  }
  
  /** Method: drawPipe()
    * draws pipes and handles game logic
    */
  public void drawPipe(){
    if (start && !isDead) {
      // During gameplay
      
      // Creates the animation of the pipes moving
      for (int i = 0; i < pipeX.length; i++){   
        image(tPipe, pipeX[i], pipeY[i]);
        image(bPipe, pipeX[i], pipeY[i] + 600);
        pipeX[i] -= 2;
        
        if (pipeX[i] < -250){
         pipeX[i] = width;
        }
        
        // Game Logic
        if (bird.x > (pipeX[i] - 60) && bird.x < pipeX[i] + 88){ // Checks if player touches a pipe
          if (!(bird.y > pipeY[i] + 370 && bird.y < pipeY[i] + 370 + 189)){ // Ends the game when player touches a pipe
            isDead = true;
          } else if (bird.x == pipeX[i] || bird.x == pipeX[i] + 1){ // Increases the score for each pipe player passes
            score++;
          }
        }        
      }
    }
  }
  
}
