void drawThings() {

  //pipes
  if (frameCount %125 == 0 && mode == playing) {
    pipes.add(new Pipe(width, random(300, 400)));
    pipes.add(new Pipe(width, -2, random(50, 220)));
  }

  //bottom
  rectMode(CORNER);
  fill(green);
  stroke(black);
  //strokeWeight(3);
  rect(-4, 480, width + 5, 100);
  fill(sand);
  rect(-4, 500, width + 5, 100);

  //ball
  fill(yellow);
  ellipse(x, y, w, w);

  //score
  fill(white);
  textFont(numfont);
  textSize(35);
  text(score, width/2, 70);

  //add score
  int i = 0;
  while (i < pipes.size()) {
    Pipe thing = pipes.get(i);
    //if(x >= );
    if (x - w/2 > thing.x + thing.w && x - w/2 < thing.x + thing.w + 2 && y + w/2 > thing.y) score ++;
    i++;
  }

  //pause
  fill(orange);
  stroke(black);
  strokeWeight(2.5);
  rectMode(CORNER);
  rect(40, 30, 30, 30);
  fill(white);
  textSize(10);
  textFont(numfont);
  text("| |", 55, 54);
}

void moveThings() {

  //moving ball
  x += dx;
  y += dy;

  if (x >= width/2) dx = 0;

  //gravity
  dy += 0.2;
}

void drawPause() {
  //background(blue);
  //black clear filter
  fill(black, 90);
  noStroke();
  rect(0, 0, width*2, height);

  //pause
  fill(orange);
  stroke(black);
  strokeWeight(2.5);
  rectMode(CORNER);
  rect(40, 30, 30, 30);
  fill(white);
  triangle(49, 35, 49, 55, 64, 45);

  //home & play button
  fill(orange);
  stroke(black);
  strokeWeight(2.5);
  rectMode(CENTER);
  rect(width/2, 250, 115, 50);
  rect(width/2, 325, 95, 50);
  fill(white);
  textFont(font);
  textSize(60);
  text("Home", width/2, 266);
  text("Play", width/2, 341);
}

void checkCollisions() {
  if (y + w/2 >= 480) mode = gameover;

  //gameover
  int i = 0;
  while (i < pipes.size()) {
    Pipe thing = pipes.get(i);
    if (thing.isDead()) pipes.remove(i);
    boolean hit = circleRect(x, y, w/2, thing.x, thing.y, thing.w, thing.h);
    if (hit) mode = gameover;
    i++;
  }
}