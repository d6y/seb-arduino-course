// 13 is the green LED up near the top of the board.
// 3,5,6 = r,g,b, but HIGH and LOW are swapped for the RGB LED

#define LED 6

void setup() {
  pinMode(LED, OUTPUT);
}

void loop() {
  digitalWrite(LED, HIGH);
  delay(1000);
  digitalWrite(LED, LOW);
  delay(100);
 }

// You want the cu serial port when you run for the first time.
