/** Class: MainScreen
  * Handles Start Screen display
  */
function MainScreen (language){
  
  // Language
  this.language = language;

  // Initialize buttons
  this.startButton = new Button(305, 400, 400, 100, this.language.toSpanishCheck("START", spanish));
  this.languageButton = new Button(305, 525, 400, 100, this.language.toSpanishCheck("SPANISH", spanish));
  
  
  /** Method: draw()
    * Displays main Start Screen
    */
  this.draw = function() {
    // Draw Background Logic
    fill(78, 177, 251);
    rect(0, 0, width, height);
    
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(40);

    // Draw logo based on language
    if (spanish) {
      image(logoSPAN, 100, 25);
    } else {
      image(logoENG, 100, 25);
    }

    // Update button texts in case the language changed
    this.startButton.text = this.language.toSpanishCheck("START", spanish);
    this.languageButton.text = this.language.toSpanishCheck("SPANISH", spanish);

    // Draw buttons
    this.startButton.draw();
    this.languageButton.draw();
  }
  
  /** Method: isStartButtonPressed()
    * Checks if start button is clicked
    * @return boolean
    */
  this.isStartButtonPressed = function() {
    return this.startButton.overButton();  
  }

  /** Method: isLanguageButtonPressed()
    * Checks if language button is clicked
    * @return boolean
    */
  this.isLanguageButtonPressed = function() {
    return this.languageButton.overButton();  
  }
}
