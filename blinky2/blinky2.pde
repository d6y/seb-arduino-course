// 13 is the green LED up near the top of the board.
#define LED 13

// 3,5,6 = r,g,b, but HIGH and LOW are swapped for the RGB LED
#define RED 3
#define GREEN 5
#define BLUE 6

int led[] = {RED, GREEN, BLUE};

int counter = 0;

void setup() {
  for(int i=0; i<3; i++) {
    pinMode(led[i], OUTPUT);
    digitalWrite(led[i], HIGH);
  }
}

void toggle(int rate, int led) {
  if (counter%(rate*2) < rate) 
    digitalWrite(led, HIGH);
  else
    digitalWrite(led, LOW);
}

void loop() {
  
  counter++;
//  toggle(500, RED);
//  toggle(250, GREEN);
//  
 
  if (counter%1200 < 600) {
    digitalWrite(RED, HIGH);
  } else {
    digitalWrite(RED, LOW);
  }
  
  if (counter%600 < 300) {
    digitalWrite(GREEN, HIGH);
  } else {
    digitalWrite(GREEN, LOW);
  }
  
  if (counter%300 < 150) {
    digitalWrite(BLUE, HIGH);
  } else {
    digitalWrite(BLUE, LOW);
  }
  
  
 
  delay(1); // force loop to run roughly once a millisecond.
  
}

