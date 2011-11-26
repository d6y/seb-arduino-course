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

int state = HIGH;

void loop() {
  
  if (digitalRead(BUTTON)==LOW) { 
    state = state == HIGH ? LOW : HIGH;     
  }
  
  digitalWrite(RED, state);
  
}

