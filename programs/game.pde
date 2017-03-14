import java.util.Arrays;
boolean[] combo = new boolean[4];
int tem;
boolean[] lett = new boolean[4];
int score = 0;
int fr = 0;
int time = 20;
void setup(){
  size(800,500);
  background(255,0,0);
  frameRate(60);
  assignVal();
  createRect();
}

void draw() {
  background(255,0,0);
  if(time >= 0){
    if(check2()){
      assignVal();;
      score++;
    }
    createRect();
    time();
    letters();
  }else{
    fill(0);
    textSize(32);
    text("Final score: " + score,280,200);
  }
}


void assignVal() {
for (int i=0; i<4; i++){
  tem = (int)random(2);
  if (tem == 1){
  combo[i] = true;
  } else{
  combo[i] = false;
  }
}
}
void createRect() {
  for (int i=0; i<4; i++){
    if (combo[i]){
      fill(0);
      rect(200*i,100,200,400);
    }else{
      fill(255);
      rect(200*i,100,200,400);
    }
  }
}

boolean check2(){
  if(keyPressed){
    if(key == 'a')
      lett[0] = true;
    if(key == 's')
      lett[1] = true;
    if(key == 'd')
      lett[2] = true;
    if(key == 'f')
      lett[3] = true;
  }else{
      makefalse();
    }
   if(Arrays.equals(lett,combo)){
    return true;
  }
  return false;
}


void makefalse(){
  for(int i = 0; i < 4; i++){
    lett[i] = false;
  }
}
/*
void time(){
  fill(0);
  textSize(32); 
  text("Score: " + score,30,30);
  text("Time: " + time, 600, 30);
  if(fr%60 == 0)
    time--;
  fr++;
}
*/

void letters(){
  fill(255);
  textSize(64); 
  text("A",75,300);
  text("S",275,300);
  text("D",475,300);
  text("F",675,300);
}
