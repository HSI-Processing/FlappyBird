/** Class: MainScreen
  * Handles Start Screen display
  * NOTE : This class should be nearly identical across all games
  */
public class MainScreen {
  
  // Buttons
  private Button startButton;
  private Button languageButton;
  
  // Language
  private Language language;
  
  // Logos
  private PImage logoENG;
  private PImage logoSPAN;
  
  /** Constructor: MainScreen()
    * Instantiates Language, Buttons, and logos
    * @param Language
    */
  public MainScreen(Language language) {
    // Language
    this.language = language;
    
    // Initialize buttons with the correct text
    startButton = new Button(305, 400, 400, 100, language.toSpanishCheck("START", spanish));
    languageButton = new Button(305, 525, 400, 100, language.toSpanishCheck("SPANISH", spanish));
    
    // Load logos
    logoENG = loadImage("assets/FlappyBirdLogo_ENG.png");
    logoSPAN = loadImage("assets/FlappyBirdLogo_ESP.png");
  }

  /** Method: draw()
    * Displays main Start Screen
    */
  public void draw() {
    // Draw background logic
    fill(78, 177, 251);
    rect(0, 0, width, height);
    
    // Text properties
    textMode(CENTER);
    fill(0);
    textSize(40);

    // Draw logo based on language
    if (spanish) {
      image(logoSPAN, 100, 25);
    } else {
      image(logoENG, 100, 25);
    }

    // Update button texts based on language
    startButton.text = language.toSpanishCheck("START", spanish);
    languageButton.text = language.toSpanishCheck("SPANISH", spanish);

    // Draws buttons to be updated in real-time
    startButton.draw();
    languageButton.draw();
  }

  /** Method: isStartButtonPressed()
    * checks if start button is clicked
    * @return boolean
    */
  boolean isStartButtonPressed() {
    return startButton.overButton();  
  }

  /** Method: isLanuageButtonPressed()
    * checks if language button is clicked
    * @return boolean
    */
  boolean isLanguageButtonPressed() {
    return languageButton.overButton();  
  }
}
