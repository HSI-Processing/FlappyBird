/** Class: GameOver
  * Handles Game Over display
  * NOTE : This class should be nearly identical across all games
  */
public class GameOver {

  // Button
  Button restartButton;
  
  // Language
  Language language;

  /** Constructor: GameOver()
    * Instantiates Language and Button
    * @param Language
    */
  public GameOver(Language language) {
    // Language
    this.language = language;
    
    // Initialize the restart button with the correct text
    String restartText = language.toSpanishCheck("RESTART", spanish);
    restartButton = new Button(width / 2 - 100, height / 2 + 100, 200, 50, restartText); // Adjusted position for game
  }

  /** Method: draw()
    * Displays Game Over screen
    */
  public void draw() {
    // Display "Game Over"
    fill(255, 0, 0); // Red color for Game Over text
    textAlign(CENTER, CENTER);
    textSize(50);
    String gameOverText = language.toSpanishCheck("GAME OVER", spanish);
    text(gameOverText, width / 2, height / 2 - 70);

    // Display "High Score"
    fill(255); // White color for high score text
    textSize(30);
    String highScoreText = language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore;
    text(highScoreText, width / 2, height / 2 - 20);

    // Display the "Player's Score"
    String scoreText = language.toSpanishCheck("SCORE", spanish) + ": " + score;
    text(scoreText, width / 2, height / 2 + 10);

    // Display restart button
    restartButton.text = language.toSpanishCheck("RESTART", spanish);
    restartButton.draw();
  }

  /** Method: isRestartButtonClicked()
    * checks if restart button is clicked
    * @return boolean
    */
  public boolean isRestartButtonClicked() {
    return restartButton.overButton();
  }
}
