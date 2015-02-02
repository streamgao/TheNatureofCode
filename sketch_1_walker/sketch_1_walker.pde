Walker w ;
PVector randomDecide;

void setup(){
  size(600,400);
  background( 250 );
  w = new Walker( width/2, height/2 );
  randomDecide = new PVector( width/2, height/2 );
  
}


void draw(){
  
}

void mouseClicked(){
  float r = random(0,1);
  randomDecide.x = r>0.5 ? mouseX : random(0,width);
  randomDecide.y = r>0.5 ? mouseY : random(0,height);
  
  w.step( randomDecide ).displayABoundary();
}
