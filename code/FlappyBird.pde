final private int RED = color(255, 0, 0);

private Bird bird;
private Pipe pipe;
private ArrayList<Pipe> pipes;
private Item item;

private MainScreen startScreen;
private Language language = new Language();
boolean spanish = false;

private boolean gameOver = false;

final private int MOVE_SPEED = 10;
private int score;
private boolean isBeginning;
private int timer;
private PImage bg; // background

public void setup() {
    size(1000, 700);
    noStroke();
    bg = loadImage("assets/foggyBlueSky.jpg");
    bg.resize(1000, 700);
    
    reset();
}

public void reset() {
    bird = new Bird(this);
    pipe = new Pipe(1000, 0, 250, null);
    score = 0;
    isBeginning = true;
    pipes = new ArrayList<Pipe>();
    gameOver = false;

    for (int i = 0; i < 6; i++) {
        Pipe topPipe = new Pipe(1000 + (250 * i), 0, 250, null);
        Pipe bottomPipe = new Pipe(1000 + (250 * i), 450, 250, topPipe);
        pipes.add(topPipe);
        pipes.add(bottomPipe);
    }

    item = new Item();
    timer = millis();
}

public void draw() {
    if (gameOver) {
      displayGameOver();
      
      if (key == 'r' || key == 'R') {
          reset(); // Restart the game
      } else if (key == 'q' || key == 'Q') {
          exit(); // Exit the game
      }
      return;
    }

    background(bg);

    for (Pipe pipe : pipes) {
        if (bird.checkCollision(pipe)) {
            gameOver = true;
            break;
        }
    }

    for (Pipe pipe : pipes) {
        pipe.movePipe();
        pipe.drawPipe();
    }

    if (bird.catchItem(item)) {
        score += 5;
        item.itemRespawn();
    }

    if (item.x < 0) {
        item.itemRespawn();
    }

    item.moveItem();
    item.drawItem();
    bird.moveBird();
    bird.drawBird();
    statBoard();
    displayInstruction();
}

public void displayMain(){
  startScreen = new MainScreen();
  startScreen.languageButton(305, 475, 400, 150, language.toSpanishCheck("SPANISH"));
  startScreen.startButton(305, 300, 400, 150, language.toSpanishCheck("START"));
}

public void displayInstruction() {
    if (isBeginning) {
        //textSize(20);
        //fill(RED);
        //text("Press any arrow key to start.", 700, 25);
        displayMain();
    }
}

public void updateScore() {
    if (!isBeginning) {
        if (millis() - timer >= 1000) {
            score += 1;
            timer = millis();
        }
    }
}

public void statBoard() {
    updateScore();
    textSize(32);
    fill(204, 102, 0);
    text("Bird X: " + bird.x, 100, 30);
    fill(0, 102, 153);
    text("Bird Y: " + bird.y, 99, 60);
    fill(204, 102, 0);
    text(language.toSpanishCheck("Score: ") + score, 77, 90);
}

public void displayGameOver() {
    background(255);
    textSize(50);
    fill(0);
    text(language.toSpanishCheck("GAME OVER"), width / 2, height / 3);
    textSize(32);
    text(language.toSpanishCheck("Score: ") + score, width / 2, height / 2);
    text(language.toSpanishCheck("Press R to Restart or Q to Quit"), width / 2, height * 2 / 3);
}

public void mouseClicked(){
  if(isBeginning){
    if (startScreen.isStartButtonPressed()) {
      isBeginning = false;
      bird.yVel = -MOVE_SPEED;
        
      bird.yGravity = 0.5;
      for (Pipe pipe : pipes) {
          pipe.xVel = -3;
      }
      item.xVel = -3;
        
    }
    else if (startScreen.isLanguageButtonPressed()) {
      spanish = !spanish;
      
      if (spanish) {
        spanish = true;
      }
      else {
        spanish = false;
      }
    }
  }
}

public void keyPressed() {
    if (key == TAB || key == ENTER) {
        reset();
    } else if (keyCode == UP) {
        bird.yVel = -MOVE_SPEED;
        if (isBeginning) {
            isBeginning = false;
            bird.yGravity = 0.5;
            for (Pipe pipe : pipes) {
                pipe.xVel = -3;
            }
            item.xVel = -3;
        }
    }
}
