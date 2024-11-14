/** Class: Item
  * Handles functions of items (worms)
  */
public class Item{
  
 // Item properties
  private float x;     // Item x position
  private float y;     // Item y postion
  private int w;       // Item width
  private int h;       // Item height
  private float xVel;  // Item x velocity
  
  private PImage itemImage;
  
  /** Constructor: Item()
    *  Instantiates item properties
    */
  public Item(){
    this.x = 1000;
    this.y = 350;
    this.xVel = 0;
    this.w = 50;
    this.h = 50;
    
    this.itemImage = loadImage("assets/worm.png");
    this.itemImage.resize(this.w, this.h);
  }
  
  /** Method: drawItem()
    *  Basic logic to display item on screen
    */
  public void drawItem(){
    image(this.itemImage, this.x, this.y);
  }
  
  /** Method: moveItem()
    * Logic to move item
    */
  public void moveItem(){
    this.x += this.xVel;
  }
  
  /** Method: itemRespawn()
    * Logic to respawn item
    */
  public void itemRespawn(){
    this.x = 1000;
  }
}
