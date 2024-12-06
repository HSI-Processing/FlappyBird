/** Class: Bird
  * Handles functions of the player (bird)
  */

/** Constructor: Bird()
    * Instantiates player properties
    */
function Bird (){
  
  // Bird properties
  this.x = 300;         // Bird x position
  this.y = 250;         // Bird y postion
  this.w;               // Bird width
  this.h;               // Bird height
  this.xVel = 0;      // Bird x velocity
  this.yVel = 0;      // Bird y velocity
  this.yGravity = 0;  // Bird gravity
  
  /** Method: checkBorder()
    * Logic to handle player boundary restrictions
    */
  this.checkBorder = function(){
    if(this.y < 0){ // Stops player from flying above screen
      this.yVel = 0;
      this.y = 1;
    }else if(this.y > height){ // Kills player if they fall below screen
      isDead = true;
    }
  }

  /** Method: moveBird()
    * Logic to move player
    */ 
  this.moveBird = function(){
    this.yVel += this.yGravity;
    this.y += this.yVel;
    this.x += this.xVel;
    this.checkBorder(); 
  }

  /** Method: drawBird()
    *  Basic logic to display player on screen
    */
  this.drawBird = function(){
    image(birdImage, this.x, this.y);

    this.w = birdImage.width;         
    this.h = birdImage.height;
  }
  
  /** Method catchItem()
    * Checks if player has 'caught' an item
    * @param Item 
    * @return boolean 
    */
  this.catchItem = function(item){
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
