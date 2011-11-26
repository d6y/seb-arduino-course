// 13 is the green LED up near the top of the board.
// 3,5,6 = r,g,b, but HIGH and LOW are swapped for the RGB LED

#define LED 6

#define RED 3
#define GREEN 5
#define BLUE 6

int led[] = {RED, GREEN, BLUE};

void setup() {
  for(int i=0; i<3; i++)
    pinMode(led[i], OUTPUT);
}

void loop() {
  for(int i=0; i<3; i++) {
  digitalWrite(led[i], LOW);
  delay(1000);
  digitalWrite(led[i], HIGH);
  delay(100);
 }
}

