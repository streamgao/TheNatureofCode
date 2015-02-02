class Walker{

  PVector pre;
  PVector now;
  float size;
  
  Walker(float _x, float _y){
    pre = new PVector(_x, _y);
    now = new PVector(_x, _y);
  }

  Walker step( PVector step){
    size = randomGaussian();
    
    pre.x = now.x;
    pre.y = now.y;
    
    now.x = size*(step.x-pre.x)+pre.x; //step.x  //size*(step.x-pre.x)+pre.x
    now.y = size*(step.y-pre.x)+pre.y;
    
    now.x = now.x<=width ? now.x : width;
    now.y = now.y<=height ? now.y : height;
    now.x = now.x>=0 ? now.x : 0;
    now.y = now.y>=0 ? now.y : 0;
    
    print(pre.x+","+pre.y);
    println("."+ now.x+","+now.y);

    return this;
  }
  
  void displayABoundary(){
    
    line(pre.x,pre.y,now.x,now.y);
  }
  
}
