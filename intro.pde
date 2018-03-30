void drawIntro() {
  background(blue);

  //clouds
  imageMode(CORNER);
  image(cloud1, -50, 320, 300, 150);
  image(cloud1, 300, 320, 300, 150);
  image(cloud2, 100, 320, 300, 150);
  image(cloud2, 500, 320, 300, 150);
  fill(white);
  noStroke();
  rect(0, 430, width, 200);
  //translate(30, 30);

  //buildings
  imageMode(CORNER);
  image(buildings, 0, 350, 300, 150);
  image(buildings, 300, 350, 300, 150);
  
  //example ball
  fill(yellow);
  stroke(black);
  ellipse(ex, ey, ew, ew);
  if(ex > width + ew/2) ex = -ew;
  ex += edx;
  edx = 3;
  ey += edy;
  if(ey >= 480 - ew/2) edy = -7;
  edy += 0.2;
  //edx += 0.01;

  //bottom
  rectMode(CORNER);
  fill(green);
  stroke(black);
  strokeWeight(3);
  rect(-4, 480, width + 5, 100);
  fill(sand);
  rect(-4, 500, width + 5, 100);
  
  //text
  textFont(font);
  textSize(100);
  fill(white);
  stroke(black);
  text("Flappy Ball", width/2, 250);
  textSize(60);
  text("the Game", 350, 300);

  //play
  rectMode(CENTER);
  fill(white);
  stroke(black);
  rect(300, 400, 125, 75, 20);
  noStroke();
  fill(green);
  triangle(290, 375, 290, 425, 325, 400);
  
  //restate variables
  x = 0;
  y = -50;
  w = 50;
  dx = 2;
  dy = 5;
  score = 0;
}