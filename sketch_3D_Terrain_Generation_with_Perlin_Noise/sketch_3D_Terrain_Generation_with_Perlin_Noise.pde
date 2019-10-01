// youtube tutorial: https://www.youtube.com/watch?v=IKB1hWWedMk  
//

int cols, rows;
int scale = 20;
int w = 1000;
int h = 700;

float [][] terrain;

void setup() {
  size(600, 600, P3D);
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
  float yoff = 0;
  for (int  y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(x,y), 0, 1, -150, 150);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
}

void draw() {
  background(0); 
  stroke(255);
  noFill();

  translate(width/2, height/2);
  rotateX(PI/3);

  translate(-w/2, -h/2);
  for (int  y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale,   terrain[x][y+1]);
    }
    endShape();
  }
}
