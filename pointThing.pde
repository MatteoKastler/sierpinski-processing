ArrayList<PVector>points = new ArrayList<PVector>();
PVector[] starts = new PVector[3];

String typing;
String saved;

int rad = 5;
color selected = color(255,0,0);
color newPoint = color(0,255,0);

PVector rand;
PVector lastPoint;
PVector thisPoint;

void setup(){
  frameRate(100);
  size(500, 750);
  for(int i = 0; i<starts.length; i++){
    starts[i] = new PVector(random(width-100), random(height-100));
    println(starts[i].x + " " + starts[i].y);
  }
  lastPoint = starts[int(random(starts.length))]; // first point gets chosen randomly
  println();
} 

void draw(){
  background (256);
  fill(255);
  rand = starts[int(random(starts.length))];
  for(PVector p : starts){
    fill(0,255,0);
    if(p == rand){fill(selected);}
    ellipse(p.x, p.y, rad, rad); 
    //println(p + " " + rand.x);
    fill(255);
  }
  println();
  thisPoint = PVector.sub(rand, lastPoint); //find vector
  println(lastPoint);
  println(thisPoint);
  println();
  thisPoint = new PVector(lastPoint.x + thisPoint.x/2, lastPoint.y + thisPoint.y/2);
  points.add(thisPoint);
  for(PVector p : points){
  ellipse(p.x, p.y, rad, rad);
  }
  lastPoint = thisPoint;
 
}
  
