public class Bird{
  
  private float x;  // x position of rectangle
  private float y;  // y position of rectangle 
  private float w;  // width of the rectangle
  private float h;  // height of the rectangle
  private float xVel;  // velocity (speed) along the x axis
  private float yVel;  // velocity (speed) along the y axis
  private float yGravity;
  
  private PImage birdSprite;
  
  public Bird(FlappyBird game){
    // Player (bird) initial position.
    x = 300;
    y = 80;
    w = 50;
    h = 25;
    xVel = 0;  // Initially no speed along x axis
    yVel = 0;  // Initially no speed along y axis
    yGravity = 0;
    birdSprite = loadImage("assets/owl.png");
    birdSprite.resize((int)w, (int)w);
  }
  
  public void moveBird(){
    yVel += yGravity;
    y += yVel;
    x += xVel;
    checkBorder();
  }
  
  public void checkBorder(){
    if(y < 0){
      yVel = 0;
      y = 1;
    }else if(y > height || x < 0){
      reset();
    }
  }

  public void drawBird(){
    image(birdSprite, x, y);
  }
  
  boolean checkCollision(Pipe pipe){
    if(((this.x + this.w) >= pipe.x) && ((this.x + this.w) <= (pipe.x + 10)) && ((this.y + this.h) > pipe.y) && (this.y <= (pipe.y + pipe.h))){
      this.xVel = -3;
      return true;
    }else if(((this.x + this.w) >= pipe.x) && (this.x <= (pipe.x + pipe.w)) && ((this.y + this.h) > pipe.y) && ((this.y + this.h) <= (pipe.y + 20))){
      this.y -= 1;
      this.yVel = 0;
      this.yGravity = 0;
      return true;
    }else if(((this.x + this.w) >= pipe.x) && (this.x <= (pipe.x + pipe.w)) && (this.y < (pipe.y + pipe.h)) && (this.y >= (pipe.y + (pipe.h - 20)))){
      this.yVel = 0;
      return true;
    }else {
      this.xVel = (this.x < 300) ? 3 : 0; // if statement (if this.x < 300) "?" if true make this.xVel = 3 if not true make this.xVel = 0
      if(!isBeginning){
        this.yGravity = 0.5;
      }
      return false;
    }
  }
  
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
