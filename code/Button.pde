class Button{
  
  int x, y, buttonWidth, buttonHeight;
  String text;
  
  public Button(int x, int y, int buttonWidth, int buttonHeight, String text){
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.text = text;
    if(overButton()){
      //fill(40, 207, 251);
      fill(150);
      makeButton();
    }else{
      //fill(255, 198, 35);
      fill(200);
      makeButton();
    }
  }
  
  void makeButton(){
    rectMode(CORNER);
    rect(x, y, buttonWidth, buttonHeight);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x + buttonWidth/2, y + buttonHeight/2);
  }
  
  boolean overButton(){
    if(mouseX < x || mouseX > x + buttonWidth || mouseY < y || mouseY > y + buttonHeight){
      return false;
    }
    return true;
  }
  
  String getText() {
    return this.text;
  }
  
}
