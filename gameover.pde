void drawGameOver() {
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

  //buildings
  imageMode(CORNER);
  image(buildings, 0, 350, 300, 150);
  image(buildings, 300, 350, 300, 150);

  //battom
  rectMode(CORNER);
  fill(green);
  stroke(black);
  //strokeWeight(3);
  rect(-4, 480, width + 5, 100);
  fill(sand);
  rect(-4, 500, width + 5, 100);

  //gameover
  fill(orange);
  textFont(font);
  textSize(100);
  text("GAMEOVER", width/2, 150);

  //square
  fill(sand);
  stroke(black);
  rectMode(CENTER);
  rect(width/2, height/2, 400, 250, 20);

  //score
  fill(orange);
  textFont(font);
  textSize(50);
  text("Score", 435, 225);

  fill(white);
  textFont(numfont);
  textSize(22);
  text(score, 445, 255);

  //high score
  fill(orange);
  textFont(font);
  textSize(50);
  text("High Score", 405, 325);
  if (highscore == score && score > 0) {
    fill(orange);
    noStroke();
    rectMode(CORNER);
    rect(280, 298, 54, 27);
    fill(white);
    textFont(numfont);
    textSize(19);
    text("New", 308, 320);
  }

  fill(white);
  textFont(numfont);
  textSize(22);
  text((int)highscore, 445, 355);

  //medals
  fill(orange);
  textFont(font);
  textSize(50);
  text("Medal", 180, 225);
  fill(grey);
  noStroke();
  ellipse(180, 300, 100, 100);
  if (score > 5) {
    imageMode(CENTER);
    image(bmedal, 180, 300, 100, 100);
  }
  if (score > 10) image(smedal, 180, 300, 100, 100);
  if (score > 30) image(gmedal, 180, 300, 100, 100);
  if (score > 50) image(pmedal, 180, 300, 100, 100);

  //play agian
  stroke(black);
  rectMode(CENTER);
  fill(white);
  rect(width/2, 500, 125, 75, 20);
  noStroke();
  fill(green);
  triangle(290, 475, 290, 525, 325, 500);
}