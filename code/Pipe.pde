public class Pipe{
  
  private float x;
  private float y;
  private float w;
  private float h;
  private float xVel;
  private boolean passed = false;
  
  private PImage pipeImage;
  
  private Pipe pipeAbove;
  
  public Pipe(int x, int y, int h, Pipe pipeAbove){
    this.x = x;
    this.y = y;
    this.w = 80;
    this.h = h;
    this.xVel = 0;
    this.pipeAbove = pipeAbove;
    if(pipeAbove == null){
      this.pipeImage = loadImage("assets/downTree.png");
      this.pipeImage.resize((int)this.w, (int)this.h + 20);
    }else{
      this.pipeImage = loadImage("assets/upTree.png");
      this.pipeImage.resize((int)this.w, (int)this.h + 20);
    }
  }
  
  public void drawPipe(){
    fill(0,255,0);  //placeholder image
    image(this.pipeImage, this.x, this.y);
  }
  
  public void movePipe(){
    this.x += this.xVel;
    if((this.x + this.w) < 0){
      respawn();
    }
  }
  
  public void respawn(){
    if(this.pipeAbove == null){
      this.x = 1450;
      this.w = 80;
      this.h = 100 + (float)Math.random() * 300;
      this.y = 0;
      this.pipeImage.resize((int)this.w, (int)this.h + 20);
    }else{
      this.x = 1450;
      this.w = 80;
      this.h = 700 - pipeAbove.h - 200;
      this.y = pipeAbove.h + 200;
      this.pipeImage.resize((int)this.w, (int)this.h + 20);
    }
  }
  
  
}
