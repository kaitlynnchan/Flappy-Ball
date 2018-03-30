class Pipe {
  
  float x, y, w, h;
  
  Pipe(float _x, float _y){
    x = _x + w;
    y = _y;
    w = 50;
    h = y;
  }
  Pipe(float _x, float _y, float _h){
    x = _x + w;
    y = _y;
    w = 50;
    h = _h;
  }
  
  void show(){
    fill(green);
    stroke(black);
    rectMode(CORNER);
    rect(x, y, w, h);
    fill(green);
    rectMode(CORNER);
    rect(x,  y, w, h);
  }
  
  void act(){
    if(mode == playing) x -= 2;
  }
  
  boolean isDead() {
    return x + w < 0; //mode != playing ||
  }
  
}