public class Item{
  
  private float x;
  private float y;
  private float w;
  private float h;
  private float xVel;
  
  private PImage itemImage;
  
  private int spawnPositionIndex;
  
  public Item(){
    this.x = 1000;
    this.y = 350;
    this.w = 50;
    this.h = 50;
    this.xVel = 0;
    this.itemImage = loadImage("assets/crab.png");
    this.itemImage.resize((int)this.w, (int)this.h);
    this.spawnPositionIndex = 0;
  }
  
  public Item(float x, float y){
    this.x = x;
    this.y = y;
    this.w = 50;
    this.h = 50;
    this.xVel = 0;
  }
  
  public void drawItem(){
    fill(0,255,0);  //placeholder image
    image(this.itemImage, this.x, this.y);
  }
  
  public void moveItem(){
    this.x += this.xVel;
  }
  
  public void itemRespawn(){
    this.spawnPositionIndex += 8;
    if(this.spawnPositionIndex > 11){
      this.spawnPositionIndex = this.spawnPositionIndex%12;
    }
    this.x = pipes.get(this.spawnPositionIndex).x + 10;
    this.y = pipes.get(this.spawnPositionIndex).h + 100;
    System.out.println("Item respawned at : (" + this.x + ", " + this.y + ")");
  }
  
}
