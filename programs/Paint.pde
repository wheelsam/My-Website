int cSize = 15;
boolean stroke;
boolean shape;
color paintColor = color(255);
button[] newButton = new button[40];
color[] newColor = new color[19];

void setup(){
  size(1000,600);
  background(255);
  noLoop();
  frameRate(1000);
  newColor[0] = color(#980000);
  newColor[1] = color(255);
  newColor[2] = color(255,0,0);
  newColor[3] = color(0,255,0);
  newColor[4] = color(0,0,255);
  newColor[5] = color(#FBFF1A);
  newColor[6] = color(#CB00AA);
  newColor[7] = color(#1B6C0F);
  newColor[8] = color(#9594FC);
  newColor[9] = color(#FA7D00);
  newColor[10] = color(#643200);
  newColor[11] = color(#F21195);
  newColor[12] = color(#62585E);
  newColor[13] = color(#FCF07A);
  newColor[14] = color(#05FAA2);
  newColor[15] = color(#FFB486);
  newColor[16] = color(0);
  newColor[17] = color(255);
  newColor[18] = color(#E5DCFA);
}

void draw(){
  paint();
  stroke(0);
  fill(255);
  rect(0,0,100,50);
  rect(0,50,100,50);
  rect(800,50,200,50);
  fill(0);
  rect(0,100,1000,10);
  for(int i = 0; i<18; i++){
    stroke(0);
    newButton[i] = new button(100+50*i,0,50,50, newColor[i],i);
    newButton[i].display();
    newButton[i].mouseClicked();
    }
  for(int i = 20; i<34; i++){
    stroke(0);
    newButton[i] = new button(100+50*(i-20),50,50,50, newColor[18],i);
    newButton[i].display();
    newButton[i].mouseClicked();
    }
    
  if(stroke){
      stroke(0);
    }else{
      noStroke();
    }
  fill(255);
  ellipse(775,75,15,15);
  rect(725-(15/2),75-(15/2),15,15);
  fill(255,0,0);
  noStroke();
  ellipse(625,75,15,15);
  stroke(0);
  ellipse(675,75,15,15);
  for (int i = 0; i<10; i++){
    fill(0);
    textSize(15);
    text(5+30*i,112+50*i,82);
  }
  textSize(20);
  text("Colors ->",3,30);
  textSize(20);
  text("Size ->",6,80);
  textSize(15);
  text("<- Shapes and Outlines",815,80);
  textSize(10);
  text("RESET", 960, 30);
 }

void paint(){
  if (!stroke){
    noStroke();
  }else{
    stroke(0);
  }
  fill(paintColor);
  if (mouseY>100){
    if (!shape){
    ellipse(mouseX, mouseY, cSize, cSize);
    }
    if (shape) {
    rect(mouseX-(cSize/2), mouseY-(cSize/2), cSize, cSize);
    }
  }  
}

void mousePressed(){
  loop();
}

void mouseReleased(){
  noLoop();
}


class button{
  int bxSize;
  int bx;
  int bySize;
  int by;
  color c;
  int type;
  
  button(int x, int y, int xSize, int ySize, color bcolor, int number){
    bxSize = xSize;
    bySize = ySize;
    bx = x;
    by = y;
    
    c = bcolor;
    type = number;
  }
  
  void display(){
    fill(c);
    rect(bx,by,bxSize,bySize);
  }
  
  void mouseClicked(){
    if(mousePressed && mouseX < bxSize + bx && mouseX > bx && mouseY < bySize + by && mouseY > by) {
      for (int i = 0; i<17; i++){
        if(type==i){
          paintColor = newColor[i];
          }
      }
      if(type==17){
        rect(0,110,1000,490);
      }
      for (int i = 20; i<30; i++){
        if (type==i){
          cSize=(i-20)*30+5;
          }
      }
      if (type==31){
        stroke = true;
      }
      if (type==30){
        stroke = false;
      }
      if (type==32){
        shape = true;
      }
      if (type==33){
        shape = false;
      }
    }
  }
}