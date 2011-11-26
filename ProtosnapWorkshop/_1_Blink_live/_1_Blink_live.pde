#define RED 3
#define GREEN 5
#define BLUE 6

#define BUTTON 7
#define SENSOR A0


void setup()
{
  // set pin 13 to be an output
  pinMode(RED, OUTPUT); 
  pinMode(GREEN, OUTPUT); 
  pinMode(BLUE, OUTPUT); 
  
  digitalWrite(RED, HIGH); 
  digitalWrite(GREEN, HIGH); 
  digitalWrite(BLUE, HIGH); 
  
  pinMode(BUTTON, INPUT); 
  
  Serial.begin(9600); 
}

void loop() 
{
  
  int lightLevel = analogRead(SENSOR); 
  Serial.println(lightLevel); 
  
  int brightness = constrain(map(lightLevel, 50, 500, 255, 0), 0, 255); 
  setColour(brightness, brightness, brightness); 
  
  delay(50); 
  
  
}

void setColour(int r, int g, int b)
{
  analogWrite(RED, 255-r); 
  analogWrite(GREEN, 255-g); 
  analogWrite(BLUE, 255-b); 
  
  
}
