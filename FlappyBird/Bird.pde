/** Class: Bird
  * Handles functions of the player (bird)
  */
public class Bird{
  
  // Bird properties
  private float x;         // Bird x position
  private float y;         // Bird y postion
  private float w;         // Bird width
  private float h;         // Bird height
  private float xVel;      // Bird x velocity
  private float yVel;      // Bird y velocity
  private float yGravity;  // Bird gravity
  
  private PImage bird;
  
  /** Constructor: Bird()
    * Instantiates player properties
    */
  public Bird(){
    x = 300;
    y = 250;
    w = 50;
    h = 25;
    xVel = 0;  
    yVel = 0;  
    yGravity = 0;
    
    bird = loadImage("assets/bird.png");
    bird.resize(59, 60);
  }
  
  /** Method: moveBird()
    * Logic to move player
    */ 
  public void moveBird(){
    yVel += yGravity;
    y += yVel;
    x += xVel;
    checkBorder(); 
  }
  
  /** Method: checkBorder()
    * Logic to handle player boundary restrictions
    */
  public void checkBorder(){
    if(y < 0){ // Stops player from flying above screen
      yVel = 0;
      y = 1;
    }else if(y > height){ // Kills player if they fall below screen
      isDead = true;
    }
  }

  /** Method: drawBird()
    *  Basic logic to display player on screen
    */
  public void drawBird(){
    image(bird, x, y);
  }
  
  /** Method catchItem()
    * Checks if player has 'caught' an item
    * @param Item 
    * @return boolean 
    */
  public boolean catchItem(Item item){
    if(((this.x + this.w) >= item.x) && ((this.x + this.w) <= (item.x + 10)) && ((this.y + this.h) > item.y) && (this.y <= (item.y + item.h))){
      return true;
    }else if(((this.x + this.w) >= item.x) && (this.x <= (item.x + item.w)) && ((this.y + this.h) > item.y) && ((this.y + this.h) <= (item.y + 20))){
      return true;
    }else if(((this.x + this.w) >= item.x) && (this.x <= (item.x + item.w)) && (this.y < (item.y + item.h)) && (this.y >= (item.y + (item.h - 20)))){
      return true;
    }else {
      return false;
    }
  }
  
}
