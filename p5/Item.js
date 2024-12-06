/** Class: Item
  * Handles functions of items (worms)
  */

/** Constructor: Item()
    *  Instantiates item properties
    */
function Item (){
  
  // Item properties
  this.x = 1000;     // Item x position
  this.y = 350;     // Item y postion
  this.w = 50;       // Item width
  this.h = 50;       // Item height
  this.xVel = 0;    // Item x velocity

  itemImage.resize(this.w, this.h);
  
  /** Method: drawItem()
    *  Basic logic to display item on screen
    */
  this.drawItem = function(){
    image(itemImage, this.x, this.y);
  }
  
  /** Method: moveItem()
    * Logic to move item
    */
  this.moveItem = function(){
    this.x += this.xVel;
  }
  
  /** Method: itemRespawn()
    * Logic to respawn item
    */
  this.itemRespawn = function(){
    this.x = 1000;
  }
}
