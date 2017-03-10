int[] elliX = new int[7];  //declares X coordinate array


int[] elliY = new int[7];  //declares Y coordinate array


int[] c = new color[7];    //declares color array


int horiz = 20;    //moves snake horizontally


int vert = 20;    //moves snake vertically

float ApplX = random(500);  //random X coordinate for apple

float ApplY = random(500);   //random Y coordinate for apple

void setup() {
  size (500, 500);
  for (int i = 0; i<7; i++) {  //defines x and y coordinates
    elliX[i] = i*20;
    elliY[i] = 100;
  } 
  c[0] = color(#F21D1D);  //defines seven colors
  c[1] = color(#2E1DF2);
  c[2] = color(#67F21D);
  c[3] = color(#1DF2DF);
  c[4] = color(#E0F21D);
  c[5] = color(#F21DE4);
  c[6] = color(#F2AC1D);
  
  frameRate(8);
  
  ellipseMode(RADIUS);
}

void draw() {
  background (255);
  elli();  //calls elli function
  apple();
  meet();
}


void elli() {
  for (int i = 0; i<7; i++){    //circles
    fill(c[i]);
    ellipse(elliX[i], elliY[i], 15,15);  //at 7 places
  }
    fill(255,0,0);
    ellipse(elliX[6]+5, elliY[6]-5, 2.5,2.5);//eyes
    ellipse(elliX[6]-5, elliY[6]-5, 2.5,2.5);
  for (int i = 0; i<6; i++){    //makes first circle move to second
    elliX[i] = elliX[i+1];
    elliY[i] = elliY[i+1];
  }
  elliX[6] = elliX[6]+horiz;    //makes last circle move down
  elliY[6] = elliY[6]+vert;
}

void apple() {    //creates apple
  fill(255,0,0);
  ellipse(ApplX,ApplY,20,20);
}


void keyPressed(){  //Changes where the lead head goes
  if (keyCode == RIGHT){  //When right is pressed
    if (horiz == 20){    //If already going right, makes it go straight
      vert = 0;          //Makes no diagonal movement
    }else {
      horiz = 20;      //Makes it go right if not already
    }
  }
  if (keyCode == LEFT){ //Makes it go left
    if (horiz == -20){
      vert = 0;
    }else {
      horiz = -20;
    }
  }
  if (keyCode == UP){    //Makes it go up
    if (vert == -20){
      horiz = 0;
    }else {
      vert = -20;
    }
  }
  if (keyCode == DOWN){    //Makes it go down
    if (vert == 20){
      horiz = 0;
    }else {
      vert = 20;
    }
  }
}

void meet() {
  if (abs(elliX[6] - ApplX) < 25 &&  //X values close?
      abs(elliY[6] - ApplY) < 25) {  //Y values close?
     ApplX = random(500);    //new apple location
     ApplY = random(500);
      }
}