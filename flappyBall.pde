//Kaitlynn Chan
//flappy ball

final int intro    = 1;
final int playing  = 2;
final int paused   = 3;
final int gameover = 4;

int mode;
PFont font, numfont;
PImage pmedal, gmedal, smedal, bmedal, cloud1, cloud2, buildings;

ArrayList<Pipe> pipes;

color blue = #4EC0CA;
color black = #000000;
color white = #FFFFFF;
color green = #63E06B;
color sand = #FFD05E;
color grey = #E3C379; 
color yellow = #F9F124;
color orange = #E14B19; //F3AF0C;

float x, y, w, dx, dy;
float ex, ey, ew, edx, edy;
int score, highscore;

void setup() {
  size(600, 600, FX2D);
  mode = intro;

  pmedal = loadImage("platinum-medal2.png");
  gmedal = loadImage("gold-medal2.png");
  smedal = loadImage("silver-medal2.png");
  bmedal = loadImage("bronze-medal2.png");
  cloud1 = loadImage("clouds.png");
  cloud2 = loadImage("clouds2.png");
  buildings = loadImage("buildings.png");

  font = createFont("FlappyBirdy.ttf", 20);
  numfont = createFont("Gameplay.ttf", 20);
  textAlign(CENTER);

  x = 0;
  y = -50;
  w = 50;
  dx = 2;
  dy = 5;
  
  ex = 50;
  ey = 453;
  ew = 50;
  dx = 2;
  dy = -5;

  pipes = new ArrayList<Pipe>();
}


void draw() {
  //background
  background(blue);
  textFont(font);
  rectMode(CORNER);
  fill(green);
  stroke(black);
  strokeWeight(3);
  rect(-4, 480, width + 5, 100);
  fill(sand);
  rect(-4, 500, width + 5, 100);
  
  //clouds
  imageMode(CORNER);
  image(cloud1, -50, 320, 300, 150);
  image(cloud1, 300, 320, 300, 150);
  image(cloud2, 100, 320, 300, 150);
  image(cloud2, 500, 320, 300, 150);
  fill(white);
  noStroke();
  rect(0, 430, width, 200);
  
  //buildings
  imageMode(CORNER);
  image(buildings, 0, 350, 300, 150);
  image(buildings, 300, 350, 300, 150);

  highscore = max(score, highscore);

  int n = pipes.size();
  int i = 0;
  while (i < n) {
    Pipe p = pipes.get(i);
    p.show();
    p.act();
    i++;
  }

  if (mode == intro) {
    drawIntro();
    pipes = new ArrayList<Pipe>();
  } else if (mode == playing) {
    drawThings();
    moveThings();
    checkCollisions();
  } else if (mode == paused) {
    drawThings();
    drawPause();
  } else if (mode == gameover) {
    drawGameOver();
  }
}

void mouseReleased() {
  if (mode == intro) {
    if (mouseX >= 237.5 && mouseX <= 362.5 && mouseY >= 362.5 && mouseY <= 437.5){
      mode = playing;
    } else {
      edy = -7;
    }
  } else if (mode == playing) {
    dy = -5;
    if (mouseX >= 40 && mouseX <= 70 && mouseY >= 30 && mouseY <= 60) mode = paused;
  } else if (mode == paused) {
    if (mouseX >= 242.5 && mouseX <= 357.5 && mouseY >= 225 && mouseY <= 275) mode = intro;
    if (mouseX >= 252.5 && mouseX <= 347.5 && mouseY >= 300 && mouseY <= 350) mode = playing;
    
  } else if (mode == gameover) {
    if (mouseX >= 237.5 && mouseX <= 362.5 && mouseY >= 462.5 && mouseY <= 537.5) mode = intro;
  }
}