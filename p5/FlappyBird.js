// Game Objects
let bird;
let pipe;
let item;

// Screen Objects
let startScreen;
let gameOverScreen;
let language = new Language();

// Booleans
let spanish = false;
let isDead = false; // References player
let start;          // References game

// Final variables
let SPEED = 10;

// Score Keepers
let score = 0;
let highScore = 0;

// Background
let bgX = 0;
let bgY = 0;

// Bird
let birdImage;
let birdNormal;
let birdFlap;

// Preload images
function preload() {
  logoENG = loadImage("FlappyBirdLogo_ENG.png");
  logoSPAN = loadImage("FlappyBirdLogo_ESP.png");
  itemImage = loadImage("worm.png");
  tPipe = loadImage("tree-down-long.png");
  bPipe = loadImage("tree-up-long.png");
  birdNormal = loadImage("bird.png", img => img.resize(59, 60));
  birdFlap = loadImage("bird-flap.png", img => img.resize(62, 60));
  bg = loadImage("background.png");
}

/** Method: setup()
  * Sets up the basic game environment 
  */
function setup() {
  let canvas = createCanvas(1000, 640);
  reset();
  noStroke();
     
  // Creates an HTML div to apply CSS style to the canvas
  let gameContainer = createDiv();
  gameContainer.id("game-container");
  gameContainer.child(canvas);
}

/** Method: reset()
  * Resets all game functions 
  */
function reset() {
    // Instantiate game objects
    bird = new Bird();
    pipe = new Pipe();
    item = new Item();

    birdImage = birdNormal;
    
    // Reset stats
    score = 0;
    start = false;
    isDead = false;
}

/** Method: draw()
  * Handles game displays and mechanics  
  */
function draw() {
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
function displayMain(){  
  if (startScreen == null) {
    startScreen = new MainScreen(language);
  }
  startScreen.draw();
}

/** Method: statBoard()
  *  Displays stat board during gameplay
  */
function statBoard() {
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
function mouseClicked(){
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
function keyPressed() {
  // Logic for bird gameplay from key-bind
  if (keyCode == UP_ARROW) {
      bird.yVel = -SPEED;
      if (!start) {
        // Game hasn't started
        start = true; // Will automatically start game
        bird.yGravity = 0.5;
        item.xVel = -2;
      }
      // Loads bird image
      birdImage = birdNormal; // Switch back to normal image

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
function setBackground(){
  // Image Setup
  image(bg, bgX, bgY);
  image(bg, (bgX + bg.width), bgY);
  
  // Makes the background image move across the screen
  bgX = bgX - 1; 
  
  // Resets the background loop once the first image is done
  if (bgX < -bg.width){
    bgX = 0; 
  }
  
}

/** Method: keyReleased() 
  * ||Game Specific Method||
  *  Logic for bird animation from key-bind
  */
function keyReleased() {
  birdImage = birdFlap; // Switch to flapping image
}

/** Method: mousePressed() 
  * ||Game Specific Method||
  *  Logic for bird gameplay from mouse-click
  */
function mousePressed() {
  bird.yVel = -SPEED;
        
  bird.yGravity = 0.5;
  item.xVel = -2;
  
  // Loads bird image
  birdImage = birdNormal; // Switch back to normal image
}

/** Method: mouseReleased() 
  * ||Game Specific Method||
  *  Logic for bird animation from mouse-click
  */
function mouseReleased() {
  birdImage = birdFlap; // Switch to flapping image
}
