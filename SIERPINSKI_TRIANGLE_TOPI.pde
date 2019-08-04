PVector pos;
int dice;
PVector[] points = new PVector[100];

float factor = 10;

void  setup() {
  // size(800, 800);
  fullScreen();
  float len = min(width/2, height/2) - 16;
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(width/2+len*sin(TWO_PI * float(i)/points.length), height/2+len*cos(TWO_PI * float(i)/points.length));
  }
  pos = new PVector (width/2, height/2);
  fill(0);
  noStroke();
  background(255);
  for (int i = 0; i < points.length; i++) {
    circle(points[i].x, points[i].y, 6);
  }
  stroke(#ff0000);

  frameRate(1000);
}
void draw() {
  //println(round(PVector.dist(points[0], points[1])));
  //println(round(PVector.dist(points[1], points[2])));
  //println(round(PVector.dist(points[2], points[0])));
  for (int i = 0; i < 256; i++) _draw();
  //println((int)frameRate);
}

void _draw() {
  point(pos.x, pos.y);
  dice = (int)random(points.length);
  pos.x = points[dice].x + (pos.x - points[dice].x)/factor;
  pos.y = points[dice].y + (pos.y - points[dice].y)/factor;
}
//void mousePressed() {
//  points[0].x = mouseX;
//  points[0].y = mouseY;
//  background(255);
//  noStroke();
//  for (int i = 0; i < points.length; i++) {
//    circle(points[i].x, points[i].y, 5);
//  }
//  stroke(#ff0000);
//}

void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i < points.length; i++) {
      points[i] = new PVector(random(width), random(height));
    }
    for (int i = 0; i < points.length; i++) {
      points[i] = new PVector(random(width), random(height));
    }
    pos = new PVector (width/2, height/2);
    fill(0);
    noStroke();
    background(255);
    for (int i = 0; i < points.length; i++) {
      circle(points[i].x, points[i].y, 5);
    }
    stroke(#ff0000);
  }
}
