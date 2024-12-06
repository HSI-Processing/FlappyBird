function Button (x, y, buttonWidth, buttonHeight, words){

  this.normalColor = color(255, 198, 35);
  this.hoverColor = color(8, 147, 250);
  this.currentColor;

  this.isPressed = false;

  this.x = x;
  this.y = y;
  this.buttonWidth = buttonWidth;
  this.buttonHeight = buttonHeight;
  this.words = words;
  this.currentColor = this.normalColor;
  

  /** Method: draw()
    * Handles real-time logic for button
    */
  this.draw = function() {
    if (this.overButton()) {
      this.currentColor = this.hoverColor;
    } else {
      this.currentColor = this.normalColor;
    }
    fill(this.currentColor);
    this.makeButton(); // Updates button after changes
  }

  /** Method: makeButton()
    * Makes the custom button
    */
  this.makeButton = function() {
    rectMode(CORNER);
    rect(this.x, this.y, this.buttonWidth, this.buttonHeight, 10); // Rounded corners
    
    // Text properties
    fill(0); // Text color
    textAlign(CENTER, CENTER);
    textSize(32);
    text(this.words, this.x + this.buttonWidth / 2, this.y + this.buttonHeight / 2);
  }

  /** Method: overButton()
    * Checks if mouse if over button
    * @return boolean
    */
  this.overButton = function() {
    return mouseX >= this.x && mouseX <= this.x + this.buttonWidth && mouseY >= this.y && mouseY <= this.y + this.buttonHeight;
  }

  /** Method: handleMousePressed
    * Logic to handle mouse clicks
    */
  this.handleMousePressed = function() {
    if (this.overButton()) {
      this.isPressed = true;
    }
  }

  /** Method: handleMouseReleased()
    * Resets button once mouse is released
    */
  this.handleMouseReleased = function() {
    this.isPressed = false;
  }

  /** Method: getText()
    * Getter for button text 
    * (used for Language logic)
    */
  this.getText = function() {
    return this.words;
  }
}
