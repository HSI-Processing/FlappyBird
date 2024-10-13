public class MainScreen
{
  private String gameTitle;
  private Button startButton;
  private Button languageButton;
  
  //private PImage logoENG;
  
  public Language language = new Language();
  
  public MainScreen(){
    //fill(98, 63, 184);
    //rect(0,0, width, height);
    //fill(247, 25, 113);
    //rect(5, 5, width - 10, height - 10);
    //fill(40, 207, 251);
    //rect(15, 15, width - 30, height - 30);
    //fill(255);
    //rect(25,25,width - 50, height - 50);
    
    background(255); // add picture maybe
    textMode(CENTER);
    fill(0);
    textSize(40);
    
    //logoENG = loadImage("CircleDodgeLogo_ENG.png");
    //logoENG.resize(450,450);
    //image(logoENG,216,35);
    
    text(language.toSpanishCheck("FLAPPY BIRD"), width/2, 50);
  }
  
  void startButton(int x, int y, int buttonWidth, int buttonHeight, String text){
    startButton = new Button(x, y, buttonWidth, buttonHeight, text);
  }
  
  void languageButton(int x, int y, int buttonWidth, int buttonHeight, String text){
    languageButton = new Button(x, y, buttonWidth, buttonHeight, text);
  }
  
  boolean isStartButtonPressed() {
        return startButton.overButton();  
    }

  boolean isLanguageButtonPressed() {
      return languageButton.overButton();  
  }
  

  
}
