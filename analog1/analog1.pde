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


void loop() {
  
  // fade up
  for(int i=0; i<256; i++) {
    analogWrite(BLUE, 255-i);
    delay(3);
  }  
  
  // fade down
  for(int i=0; i<256; i++) {
    analogWrite(BLUE, i);
    delay(3);
  }  
  
  
  delay(300);
  
}

