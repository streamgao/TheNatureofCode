Rabbit levyRabbit;
PImage mainBack, boundary, beginBack;
// PGraphics pg;
PShape title;
int eaten;
boolean begin;
int type = 0;
int time;
//backgroung: 240, 235, 200      tree:97,115,37

void setup() {
  size(800, 600);
  mainBack = loadImage("grass2.jpg");
  boundary = loadImage("boundary.jpg");
  beginBack = loadImage("grass.jpg");
  image(mainBack, 0, 0);
  title = loadShape("title.svg");
  levyRabbit = new Rabbit( width/2+5, height/2+5 );

  begin = false;
  time = 1000;
  eaten = 0;
}


void draw() {  
  if ( begin==true ) {

    image(boundary, width-90, 0);

    levyRabbit.size(type).step();

    //if there is grass or not. based on the color of pixels
    //calculate the color of the center 15 grids 
    int sum=0;
    for ( float i=levyRabbit.now.x-2+levyRabbit.now.y*width; i<levyRabbit.now.x+2+levyRabbit.now.y*width; i++) {
      sum += blue (mainBack.pixels[parseInt(i)]);
      sum += blue (mainBack.pixels[parseInt(i-width)]);
      sum += blue (mainBack.pixels[parseInt(i+width)]);
    }
    sum /= 15;
    print("sum"+sum+"  #  ");

    if ( sum < 158) { // there is grass
      print("   eat     ");
      fill(240, 235, 200);
      noStroke();
      rect(levyRabbit.now.x, levyRabbit.now.y, 9, 9 ); //eat
      eaten = levyRabbit.eat();
    }
    levyRabbit.display();
    textAlign(LEFT,BOTTOM);
    textSize(14);
    fill(150, 140, 121);
    String s= "Eaten: \n";
    text(s+eaten, width-50, 150);

    s = "Time: \n";
    time = 2001-frameCount;
    text(s+time, width-50, 100);
    delay(30);
  } else { //begin==false
    image(beginBack, 0, 0);
    shapeMode(CENTER);
    shape(title, 400, 250);
    if ( frameCount>=1000 ) {
      image(mainBack, 0, 0);
      begin = true;
    }
  }

  if ( time<0 ) {
    begin = false;
    image(beginBack, 0, 0);
    textSize(30);
    fill(255,255,255);
    textAlign(CENTER,BOTTOM);
    text("GAME OVER!\n You Have Eaten "+eaten+" Grass!", 400, 300);
  }
}

void mousePressed() {
  if ( mouseY>273 && mouseY<320) {
    if ( mouseX>210 && mouseX<358) { // levy
      type = levyFlight;
      fill(100, 100, 100, 50);
      rect(210, 273, 148, 47);
      print("levy");
      image(mainBack, 0, 0);
      begin = true;
    } else if ( mouseX>417 && mouseX<564 ) {
      type = totallyRandom;
      fill(100, 100, 100);
      rect(417, 273, 148, 47);
      print("random");
      image(mainBack, 0, 0);
      begin = true;
    }
  } 
  delay(900);
}
