

void setup() {
  // 13 is the green LED up near the top of the board.
  pinMode(13, OUTPUT);
}

long d = 1;

void loop() {
  digitalWrite(13, HIGH);
  delay(d);
  digitalWrite(13, LOW);
  delay(d);
  d = d+1;
}

// You want the cu serial port when you run for the first time.
