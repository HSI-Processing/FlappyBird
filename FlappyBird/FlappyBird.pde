// Game Objects
private Bird bird;
private Pipe pipe;
private Item item;

// Screen Objects
public MainScreen startScreen;
public GameOver gameOverScreen;
public Language language = new Language();

// Booleans
public boolean spanish = false;
public boolean isDead = false; // References player
public boolean start;          // References game

// Final variables
final private int SPEED = 10;

// Score Keepers
public int score = 0;
public int highScore = 0;

// Background
private PImage background;
private float backgroundX, backgroundY;

/** Method: setup()
  * Sets up the basic game environment 
  */
public void setup() {
    size(1000, 700);
    reset();
    noStroke();
    
    // Load background
    background = loadImage("assets/background.png");    
}

/** Method: reset()
  * Resets all game functions 
  */
public void reset() {
    // Instantiate game objects
    bird = new Bird();
    pipe = new Pipe();
    item = new Item();
    
    // Reset stats
    score = 0;
    start = false;
    isDead = false;
}

/** Method: draw()
  * Handles game displays and mechanics  
  */
public void draw() {
  // Game logic
  if (!start && !isDead) {
    // Game hasn't started
    displayMain();
    
  } else if (isDead) { 
    // Player died
    if (gameOverScreen == null) {
      gameOverScreen = new GameOver(language);
    }
    gameOverScreen.draw();
    
  } else if (start && !isDead) {  
    // During gameplay
    setBackground();
    pipe.drawPipe();
    item.moveItem();
    item.drawItem();
    bird.moveBird();
    bird.drawBird();

    if (bird.catchItem(item)) {
        score += 5;
        item.itemRespawn();
    }
    if (item.x < 0) {
        item.itemRespawn();
    }
    // Stat board
    statBoard();
    if (score > highScore) {
      highScore = score;
    }
  }
}

/** Method: displayMain()
  * Logic to display the main Start Screen
  */
public void displayMain(){  
  if (startScreen == null) {
    startScreen = new MainScreen(language);
  }
  startScreen.draw();
}

/** Method: statBoard()
  *  Displays stat board during gameplay
  */
public void statBoard() {
  // Text Setup
  textAlign(LEFT);
  textSize(32);
  fill(204, 102, 0);
  
  // Actual Text w/ Translation Check
  text(language.toSpanishCheck("SCORE", spanish) + ": " + score, 5, 30);
  text(language.toSpanishCheck("HIGH SCORE", spanish) + ": " + highScore, 5, 60);
  
}

/** Method: mouseClicked()
  * Handles mouse clicks for buttons
  */
public void mouseClicked(){
  if(!start && !isDead){ 
    // Game hasn't started (Start screen showing)
    if (startScreen == null) {
      startScreen = new MainScreen(language);
    }
    
    if (startScreen.isStartButtonPressed()) {
      start = true;
    } else if (startScreen.isLanguageButtonPressed()) {
      spanish = !spanish; // Toggles spanish
      startScreen = null;
    }
  } else if (isDead) {
    // Player died (Game Over screen showing)
    if (gameOverScreen.isRestartButtonClicked()) {
      reset();
      gameOverScreen = null;  // Turn off Game Over screen
      startScreen = null;  // Resets Start screen
    }
  }
}

/** Method: keyPressed()
  *  Handles logic for gameplay key-binds
  */
public void keyPressed() {
  // Logic for bird gameplay from key-bind
  if (keyCode == UP) {
      bird.yVel = -SPEED;
      if (!start) {
        // Game hasn't started
        start = true; // Will automatically start game
        bird.yGravity = 0.5;
        item.xVel = -2;
      }
      // Loads bird image
      bird.bird = loadImage("assets/bird.png");
      bird.bird.resize(59, 60);
    } else if (isDead) {
      // Player died (Game Over screen showing) 
      reset();
      gameOverScreen = null;  // Turn off Game Over screen
      startScreen = null;  // Resets Start screen
  }
}

// Game Specific Methods

/** Method: setBackground() 
  * ||Game Specific Method||
  *  Logic to move background
  */
public void setBackground(){
  // Image Setup
  image(background, backgroundX, backgroundY);
  image(background, backgroundX + background.width, backgroundY);
  
  // Makes the background image move across the screen
  backgroundX = backgroundX - 1; 
  
  // Resets the background loop once the first image is done
  if (backgroundX < -background.width){
    backgroundX = 0; 
  }
  
}

/** Method: keyReleased() 
  * ||Game Specific Method||
  *  Logic for bird animation from key-bind
  */
public void keyReleased() {
  bird.bird = loadImage("assets/bird-flap.png");
  bird.bird.resize(62, 60);
}

/** Method: mousePressed() 
  * ||Game Specific Method||
  *  Logic for bird gameplay from mouse-click
  */
public void mousePressed() {
  bird.yVel = -SPEED;
        
  bird.yGravity = 0.5;
  item.xVel = -2;
  
  // Loads bird image
  bird.bird = loadImage("assets/bird.png");
  bird.bird.resize(59, 60);
}

/** Method: mouseReleased() 
  * ||Game Specific Method||
  *  Logic for bird animation from mouse-click
  */
public void mouseReleased() {
  bird.bird = loadImage("assets/bird-flap.png");
  bird.bird.resize(62, 60);
}
