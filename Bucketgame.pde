int eimerX;
int eimerY;
int acceleration = 5;

int food1x;
int food1y;

int food2x;
int food2y;

int food3x;
int food3y;

int food1a;
int food2a;
int food3a;

int score;

PImage bucket;
PImage shrimp;
PImage pumpkin;
PImage coffee;

void setup() {
  size(1280, 720, P2D);
  ((PGraphicsOpenGL)g).textureSampling(3);
  bucket = loadImage("images/bucket.png");
  pumpkin = loadImage("images/pumpkin.png");
  coffee = loadImage("images/coffee.png");
  shrimp = loadImage("images/shrimp.png");
  frameRate(250);
  noStroke();
  fill(255);
  eimerX = width/2;
  eimerY = height - 125;

  food1x = 50 + int(random(width - 100));
  food1y = -100 - int(random(200));

  food2x = 50 + int(random(width - 100));
  food2y = -100 - int(random(200));

  food3x = 50 + int(random(width - 100));
  food3y = -100 - int(random(200));

  food1a = int(random(3));
  food2a = int(random(3));
  food3a = int(random(3));
}

void draw() {
  background(50, 50, 50);
  fill(255);
  textSize(14);
  textAlign(LEFT);
  text("Score: " + score, 10, 20);
  textAlign(LEFT);
  text("FPS: " + str(frameRate), 10, 40);
  textAlign(RIGHT);
  text("Niklas Malkusch", width - 10, 20);

  beginShape();
  texture(bucket);
  vertex(eimerX, height - 125, 0, 0);
  vertex(eimerX + 100, height - 125, 32, 0);
  vertex(eimerX + 100, height - 25, 32, 32);
  vertex(eimerX, height - 25, 0, 32);
  endShape();

  beginShape();
  texture(pumpkin);
  vertex(food1x, food1y, 0, 0);
  vertex(food1x + 100, food1y, 32, 0);
  vertex(food1x + 100, food1y + 100, 32, 32);
  vertex(food1x, food1y + 100, 0, 32);
  endShape();

  beginShape();
  texture(coffee);
  vertex(food2x, food2y, 0, 0);
  vertex(food2x + 100, food2y, 32, 0);
  vertex(food2x + 100, food2y + 100, 32, 32);
  vertex(food2x, food2y + 100, 0, 32);
  endShape();

  beginShape();
  texture(shrimp);
  vertex(food3x, food3y, 0, 0);
  vertex(food3x + 100, food3y, 32, 0);
  vertex(food3x + 100, food3y + 100, 32, 32);
  vertex(food3x, food3y + 100, 0, 32);
  endShape();

  food1y = food1y + food1a + 1;
  food2y = food2y + food2a + 1;
  food3y = food3y + food3a + 1;

  if (food1y > eimerY - 50 && food1x > eimerX - 50 && food1y < eimerY + 100 && food1x < eimerX + 100) {
    score++;
    food1y = -100 - int(random(200));
    food1x = 50 + int(random(width - 100));
    food1a = int(random(3));
  } else if (food1y > 770) {
    score--;
    food1y = -100 - int(random(200));
    food1x = 50 + int(random(width - 100));
    food1a = int(random(3));
  }

  if (food2y > eimerY  - 50 && food2x > eimerX - 50 && food2y < eimerY + 100 && food2x < eimerX + 100) {
    score++;
    food2y = -100 - int(random(200));
    food2x = 50 + int(random(width - 100));
    food2a = int(random(3));
  } else if (food2y > 770) {
    score--;
    food2y = -100 - int(random(200));
    food2x = 50 + int(random(width - 100));
    food2a = int(random(3));
  }

  if (food3y > eimerY - 50 && food3x > eimerX - 50 && food3y < eimerY + 100 && food3x < eimerX + 100) {
    score++;
    food3y = -100 - int(random(200));
    food3x = 50 + int(random(width - 100));
    food3a = int(random(3));
  } else if (food3y > 770) {
    score--;
    food3y = -100 - int(random(200));
    food3x = 50 + int(random(width - 100));
    food3a = int(random(3));
  }

  if (keyPressed) {
    if (keyCode == LEFT) {
      eimerX = eimerX - acceleration;
    } else if (keyCode == RIGHT) {
      eimerX = eimerX + acceleration;
    }
  }


  if (eimerX < 0) {
    eimerX = 1180;
  }

  if (eimerX > width - 100) {
    eimerX = 100;
  }
}
