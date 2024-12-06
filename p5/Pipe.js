/** Class: Pipe
  * Handles functions of the pipes
  */

/** Constructor: Pipe()
    * Sets up pipe arrays and loads images
    */
function Pipe (){

  // Pipe properties
  this.pipeX = [];       
  this.pipeY = [];  
  this.pipes = 5;
  
  // Populates the arrays with values for the pipes
  for (let i = 0; i < this.pipes; i++){   
    this.pipeX[i] = width + 250 * i;
    this.pipeY[i] = random(-250, -15);
  }
  
  /** Method: drawPipe()
    * draws pipes and handles game logic
    */
  this.drawPipe = function(){
    if (start && !isDead) {
      // During gameplay
      
      // Creates the animation of the pipes moving
      for (let i = 0; i < this.pipes; i++){   
        image(tPipe, this.pipeX[i], this.pipeY[i]);
        image(bPipe, this.pipeX[i], this.pipeY[i] + 600);
        this.pipeX[i] -= 2;
        
        if (this.pipeX[i] < -250){
          this.pipeX[i] = width;
        }
        
        // Game Logic
        if (bird.x > (this.pipeX[i] - 60) && bird.x < this.pipeX[i] + 88){ // Checks if player touches a pipe
          if (!(bird.y > this.pipeY[i] + 370 && bird.y < this.pipeY[i] + 370 + 189)){ // Ends the game when player touches a pipe
            isDead = true;
          } else if (bird.x == this.pipeX[i] || bird.x == this.pipeX[i] + 1){ // Increases the score for each pipe player passes
            score++;
          }
        }        
      }
    }
  }
}
