/** Class: GameOver
  * Handles Game Over display
  */
function GameOver (language) {

  // Button
  this.restartButton;
  
  // Language
  this.language = language;
    
  // Initialize the restart button with the correct text
  this.restartText = this.language.toSpanishCheck("RESTART", spanish);
  this.restartButton = new Button(width / 2 - 100, height / 2 + 100, 200, 50, this.restartText); // Adjusted position


  /** Method: draw()
    * Displays Game Over screen
    */
  this.draw = function() {
    // Draw the Game Over text
    fill(255, 0, 0); // Red color for Game Over text
    textAlign(CENTER, CENTER);
    textSize(50);
    // Use the language class to get the correct text
    let gameOverText = this.language.toSpanishCheck("GAME OVER", spanish);
    text(gameOverText, width / 2, height / 2 - 70);

    // Display the high score
    fill(255); // White color for high score text
    textSize(30);
    let highScoreText = this.language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore;
    text(highScoreText, width / 2, height / 2 - 20);

    // Display the player's score
    let scoreText = this.language.toSpanishCheck("SCORE", spanish) + ": " + score;
    text(scoreText, width / 2, height / 2 + 10);

    // Update the restart button text in case the language changed
    this.restartButton.text = this.language.toSpanishCheck("RESTART", spanish);

    // Draw the restart button
    this.restartButton.draw();
  }

  /** Method: isRestartButtonClicked()
    * checks if restart button is clicked
    * @return boolean
    */
  this.isRestartButtonClicked = function () {
    return this.restartButton.overButton();
  }
}
