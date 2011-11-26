// 13 is the green LED up near the top of the board.
#define LED 13

// 3,5,6 = r,g,b, but HIGH and LOW are swapped for the RGB LED
#define RED 3
#define GREEN 5
#define BLUE 6

int led[] = {RED, GREEN, BLUE};

#define BUTTON 7
#define BUZZER 2
#define SENSOR A0


void setup() {
  for(int i=0; i<3; i++) {
    pinMode(led[i], OUTPUT);
    digitalWrite(led[i], HIGH);
  }
  
  pinMode(BUTTON, INPUT);
  
  Serial.begin(9600); // 9600 baud for USB?
  
}

void rgb(int r, int g, int b) {
  analogWrite(RED, r);
  analogWrite(GREEN, g);
  analogWrite(BLUE, b);
}

void loop() {

  if (digitalRead(BUTTON)==LOW) {
    tone(BUZZER,2000,100);
    while (digitalRead(BUTTON)==LOW) {
      // don't beep again until the button is released
    }
  }
  
  // (dark) 0 - 1024 (bright)
  int lightLevel = analogRead(SENSOR);
  Serial.println(lightLevel);
  
  int brightness = map(lightLevel, 50, 500,   0, 255);
  brightness = constrain(brightness, 0,255);
  
  rgb(brightness,brightness,brightness);
  
  delay(50);
  
}

