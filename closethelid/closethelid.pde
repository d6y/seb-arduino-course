// Leave this in the box, and it whines if you open the lid

#define BUZZER 2
#define SENSOR A0

void setup() {
  Serial.begin(9600); // 9600 baud for USB?
}


void loop() {
  
 
  int lightLevel = analogRead(SENSOR);
  
  while (lightLevel > 20) {
    tone(BUZZER, 100*lightLevel, 10);
    delay(20);
    lightLevel = analogRead(SENSOR);
  }  
  
  //Serial.println(lightLevel);
  
  
}

