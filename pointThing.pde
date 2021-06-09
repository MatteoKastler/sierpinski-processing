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
  frameRate(1);
  size(1000, 1250);
  for(int i = 0; i<starts.length; i++){
    starts[i] = new PVector(random(width-100), random(height-100));
    println(starts[i].x + " " + starts[i].y);
  }
  lastPoint = starts[int(random(starts.length))]; // first point gets chosen randomly
} 

void draw(){
  background (256);
  fill(255);
  rand = starts[int(random(starts.length))];
  for(PVector p : starts){
    if(p.equals(rand)){fill(selected);}
    ellipse(p.x, p.y, rad, rad); 
    println(p.x);
    fill(255);
  }
  println();
  thisPoint = lastPoint.sub(rand); //find vector
  thisPoint = new PVector(thisPoint.x/2, thisPoint.y/2);
  
  ellipse(thisPoint.x, thisPoint.y, rad, rad);
  lastPoint = thisPoint;
  
}
  
 
