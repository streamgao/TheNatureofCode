final int levyFlight = 0;
final int totallyRandom = 1;

class Rabbit{
  PVector pre;
  PVector now;
  PVector direction;
  float size;
  int eaten;
  
  Rabbit(float _x, float _y){
    pre = new PVector(_x, _y);
    now = new PVector(_x, _y);
    direction = new PVector(0,0);
    size = 0;
    eaten = 0;
  }

  Rabbit step(){   
    pre.x = now.x;
    pre.y = now.y;
    
    //make sure the point always goes on the center of the grids
    now.x = floor((size*direction.x + pre.x)/10)*10+5; 
    now.y = floor((size*direction.y + pre.y)/10)*10+5;
    
    //detect boundaries
    now.x = now.x<=(width-70)? now.x : width-75;
    now.y = now.y<=(height-50) ? now.y : height-55;
    now.x = now.x>=50 ? now.x : 55;
    now.y = now.y>=50 ? now.y : 55;
 
    return this;
  }
  
  
  Rabbit size( int type ){ // later change to switch
    if( type == levyFlight ){   
       text("Levy\nFlight", width-70,height-100);
       // this is the inverse function of the Mandelbrot function
       // D=2. unit is 10.
       float p = random(1);
       size = p<0.509 ? 10*p/0.26 : 10*1/(1.19-p);    //this is the most valuable of the whole project...  
    }else if( type == totallyRandom ) {
       text("Totally\nRandom", width-70,height-100);
       size = 60* random(0,1);
    } 
    println("size"+size);
    direction.x = random(-1,1);
    direction.y = random(-1,1);
    return this;
  }//size
  
  void display(){
    stroke(50, 102, 50);
    strokeWeight(1);
    line(pre.x,pre.y, now.x,now.y);
  }
  
  int eat(){
    eaten++;
    return eaten;
  }
  
}
