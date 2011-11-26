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
  
  toggle(600, RED);
  toggle(300, GREEN);
  toggle(150, BLUE);
 
  delay(1); // force loop to run roughly once a millisecond.
  
}

