public int mySize;

public void setup() {
  size(1000, 1000);
  background(0);
  mySize = 250;
  noLoop();
}

public void draw() {
  background(0);
  stroke(255);
  strokeWeight(2);
  tendron(500, 500, mySize, (int)(Math.random()*360), 100, 100);
}

public void tendron(float startX, float startY, float len, float h, float s, float b) {
  colorMode(HSB, 360, 100, 100);
  float initialS = s; float initialB = b;
  float [] rads = new float[7];
  float x = startX; float y = startY;
  for(int i = 0; i < rads.length; i++) {
    rads[i] = (float)(Math.random()*(360/7) + i*(360/7))*PI/180;
    while(Math.abs(90 - rads[i] * 180/PI) == 5 || Math.abs(180 - rads[i] * 180/PI) == 5 || Math.abs(0 - rads[i] * 180/PI) == 5 || Math.abs(90 - rads[i] * 180/PI) == 5)
      rads[i] = (float)(Math.random()*(360/7) + i*(360/7))*PI/180;
  }
  
  if(len < 20) {
      return;
  }
  else {
    stroke(h, s, b);
    for(int i = 0; i < rads.length; i++) { 
      s = initialS; b = initialB;
      if(rads[i] > 3*PI/2 || rads[i] < PI/2) {
        while(x < startX + len*Math.cos(rads[i])) {
          stroke(h, s-0.5, b-0.5);
          s-=0.5; b-=0.5;
          float changeX = (float)(Math.random()*6);
          float changeY = (float)(Math.random()*6);
          line(x, y, x + changeX*(float)(Math.cos(rads[i])), y + changeY*(float)(Math.sin(rads[i])));
          x+= changeX*(float)(Math.cos(rads[i]));
          y+= changeY*(float)(Math.sin(rads[i]));
        }
      }
      if(rads[i] > PI/2 && rads[i] < 3*PI/2) {
        s = initialS; b = initialB;
        while(x > startX + len*Math.cos(rads[i])) {
          stroke(h, s-0.5, b-0.5);
          s-=0.5; b-=0.5;
          float changeX = (float)(Math.random()*6);
          float changeY = (float)(Math.random()*6);
          line(x, y, x + changeX*(float)(Math.cos(rads[i])), y + changeY*(float)(Math.sin(rads[i])));
          x+= changeX*(float)(Math.cos(rads[i]));
          y+= changeY*(float)(Math.sin(rads[i]));
        }
      }
      tendron(x, y, len/3, h, s, b);
      x = startX; y = startY;
    } //End of for loop
  } //End of else statement - recursive case
}

public void mousePressed() {
  redraw();
}

public void mouseWheel(MouseEvent event) {
  float e = -2*(event.getCount());
  mySize+=e;
  redraw();
}
