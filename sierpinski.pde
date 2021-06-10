ArrayList<PVector>points = new ArrayList<PVector>();
PVector[] starts = new PVector[3];

String typing;
String saved;

int rad = 15;
color selected = color(255,0,0);
color newPoint = color(0,255,0);

PVector rand;
PVector lastPoint;
PVector thisPoint;

boolean mouse, start;

void setup(){
  frameRate(60);
  fullScreen();
  for(int i = 0; i<starts.length; i++){
    starts[i] = new PVector(random(width-100), random(height-100));
    println(starts[i]);
  }
  lastPoint = starts[int(random(starts.length))]; // first point gets chosen randomly
  println();
} 

void draw(){
  background (256);
  fill(255);
  rand = starts[int(random(starts.length))];
  for(PVector p : starts){
    if(dist(mouseX, mouseY, p.x, p.y) < rad+50 && mouse){
      p.set(mouseX, mouseY,0);
    }
    if(p == rand && start)fill(selected);
    ellipse(p.x, p.y, rad, rad); 
    fill(255);
  }
  if(start){
    thisPoint = PVector.sub(rand, lastPoint); //find vector
    println(thisPoint);
    thisPoint = new PVector(lastPoint.x + thisPoint.x/2, lastPoint.y + thisPoint.y/2);
    points.add(thisPoint);
    for(PVector p : points){
      if(p == thisPoint)fill(newPoint);
      ellipse(p.x, p.y, rad, rad);
      fill(255);
    }
    lastPoint = thisPoint;
  }
}

void mousePressed(){
  mouse = true;
  
}

void mouseReleased(){
  mouse = false;
}

void keyPressed() {
  if(key == 'x'){
    start = true;
    rad = 5;
  }
}
  
