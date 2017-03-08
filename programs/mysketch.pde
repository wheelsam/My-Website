float[] HandX = new float[60];  //array for clock x coordinates
float[] HandY = new float[60];  //array for clock y coordinates
int[] numbers = new int[12];    //array for numbers of clock
int radius = 200;  //radius of clock
int centerX = 250;  //x center of clock
int centerY = 250;  //y center of clock
int frames = 0;    //keeps track of frames
int seconds = 55;  //keeps track of seconds
int minutes = 11;  //keeps track of minutes
int hours = 0;    //keeps track of every 1/5th hour

void setup() {
  size (500, 500);  //size of page
  frameRate(60);    //frame rates, keeps track of time
  for (int i = 0; i<12; i++){    //assigns numbers to clock
    numbers[i] = i+1;
  }
}

void draw() {
  counter();  //keeps track of time
  frames++;    //makes frames = frame rate
  clocks(centerX,centerY,radius, color(255)); //creates clock with coordinates, radius, and color
}

void clocks(float xc, float yc, float r, color c){     //makes a clock
  fill(0);
  ellipse(xc,yc,2*r+r/9.5,2*r+r/9.5);                  //Base of clock
  fill(c);
  ellipse(xc,yc,2*r,2*r);                              //inner line of clock
  strokeWeight(5);                                    //sets weight of five second markers
  for (int i = 0; i<12; i++){
    line(cos(i*PI/6)*r+xc,sin(i*PI/6)*r+yc,xc,yc);    //makes five second marks 
    }
  strokeWeight(1);                                     //sets weight of dashes
  for (int i = 0; i<60; i++){
    line(cos(i*PI/30)*r+xc,sin(i*PI/30)*r+yc,xc,yc);   //makes rest of smaller lines(each second) 
    }   
  ellipse(xc,yc,2*r-r/9.5,2*r-r/9.5);                  //makes face of clock
  fill(0);
  ellipse(xc,yc,r/38,r/38);                            //makes dot in center
  textSize(r/6.666);  //sets text size based on radius
  for (int i = 0; i<12; i++) {    //makes numbers at equal areas of clock
    text(numbers[i],cos(i*PI/6+(5*PI/3))*r/1.2+xc-r/20,sin(i*PI/6+(5*PI/3))*r/1.2+yc+r/20);
  }
  secondsHand(r,yc,xc); //seconds hand
  minutesHand(r,yc,xc); //minutes hand
  hoursHand(r,yc,xc); //hours hand

}

    
void secondsHand(float r, float yc, float xc) {
   for (int i = 0; i<60; i++){    //array setting coordinates for all possible seconds
      HandX[i] = cos(i*PI/30+(3*PI/2))*r/2+xc;
      HandY[i] = sin(i*PI/30+(3*PI/2))*r/2+yc;
    }
  line(250,250,HandX[seconds],HandY[seconds]);  //makes line based on second
}

void minutesHand(float r, float yc, float xc)  {
  for (int i = 0; i<60; i++){  //array setting coordinates for all possible minutes
      HandX[i] = cos(i*PI/30+(3*PI/2))*r/1.1+xc;
      HandY[i] = sin(i*PI/30+(3*PI/2))*r/1.1+yc;
    }
  strokeWeight(2); //heavier weight for minutes hand
  line(250,250,HandX[minutes],HandY[minutes]);  //makes line based on minute
}

void hoursHand(float r, float yc, float xc) {
  strokeWeight(3);  //heavier weight for hours hand
   for (int i = 0; i<60; i++){  //array setting coordinates for every fifth hour
      HandX[i] = cos(i*PI/30+(3*PI/2))*r/2+xc;
      HandY[i] = sin(i*PI/30+(3*PI/2))*r/2+yc;
    }
  line(250,250,HandX[hours],HandY[hours]); //makes line based on hour
}
  

void counter() {
  if (frames%60==0){ //adds one to seconds every 60 frames
    seconds++;
  } 
  if (seconds>59){  //resets seconds to 0 if it hits 60. Adds one to minutes
    seconds=0;
    minutes++;
  }
  if(minutes%12==0&&seconds%60==0&&frames%60==0){  //every 12 minutes, adds one to hour. Keeps track of every 1/5th hour
    hours++;
  }
  if (minutes>59){  //resets minute if it gets to 60 minutes
    minutes=0;
  }
   if (hours>59){  //resets hours if it gets to 60 hours
    hours=0;
  }
}
    

  
  