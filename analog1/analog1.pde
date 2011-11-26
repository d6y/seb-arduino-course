// 13 is the green LED up near the top of the board.
#define LED 13

// 3,5,6 = r,g,b, but HIGH and LOW are swapped for the RGB LED
#define RED 3
#define GREEN 5
#define BLUE 6

int led[] = {RED, GREEN, BLUE};

#define BUTTON 7


void setup() {
  for(int i=0; i<3; i++) {
    pinMode(led[i], OUTPUT);
    digitalWrite(led[i], HIGH);
  }
  
  pinMode(BUTTON, INPUT);
  
}


float darkness = 255; // off
float delta = 0.05;

void loop() {
 
 if (digitalRead(BUTTON)==LOW) {
   darkness = darkness - delta;
 } else {
   darkness = darkness + delta;
 }

 darkness = constrain(darkness, 0, 255);  
 analogWrite(GREEN, darkness);
  
}

