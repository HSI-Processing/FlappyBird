/** Class: Button
  * Handles basic button mechanics and blueprints for display
  * NOTE : This class should be nearly identical across all games
  */
class Button {

  // Button properties
  int x, y, buttonWidth, buttonHeight;
  String text;

  // Button color (should be changed for each game)
  color normalColor = color(255, 198, 35);
  color hoverColor = color(8, 147, 250);
  color currentColor;

  // Boolean
  boolean isPressed = false;

  /** Constructor: Button()
    * Instantiates Button properties
    */
  public Button(int x, int y, int buttonWidth, int buttonHeight, String text) {
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.text = text;
    this.currentColor = normalColor;
  }

  /** Method: draw()
    * Handles real-time logic for button
    */
  void draw() {
    if (overButton()) {
      currentColor = hoverColor;
    } else {
      currentColor = normalColor;
    }
    fill(currentColor);
    makeButton(); // Updates button after changes
  }

  /** Method: makeButton()
    * Makes the custom button
    */
  void makeButton() {
    rectMode(CORNER);
    rect(x, y, buttonWidth, buttonHeight, 10); // Rounded corners
    
    // Text properties
    fill(0); // Text color
    textAlign(CENTER, CENTER);
    textSize(32);
    text(text, x + buttonWidth / 2, y + buttonHeight / 2);
  }

  /** Method: overButton()
    * Checks if mouse if over button
    * @return boolean
    */
  boolean overButton() {
    return mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight;
  }

  /** Method: handleMousePressed
    * Logic to handle mouse clicks
    */
  void handleMousePressed() {
    if (overButton()) {
      isPressed = true;
    }
  }

  /** Method: handleMouseRelased()
    * Resets button once mouse is released
    */
  void handleMouseReleased() {
    isPressed = false;
  }

  /** Method: getText()
    * Getter for button text 
    * (used for Language logic)
    */
  String getText() {
    return this.text;
  }
  
}
