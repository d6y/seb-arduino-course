
// set a variable to store which pin we want
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define LED 6

// the button is attached to pin 7
#define BUTTON 7

int brightness = 0; 

void setup() 
{
  // set the led pin as an output
  pinMode(LED,OUTPUT); 
  // and the button pin as an input
  pinMode(BUTTON, INPUT); 
}

void loop() 
{
 
  if(digitalRead(BUTTON)==HIGH)
  {
    brightness++; 
  } 
  else
  {
     brightness--; 
  }
  // make sure we haven't got a value greater than 255 or less than 0
  
  brightness = constrain(brightness, 0,255); 
  
  analogWrite(LED, brightness); 
 
  delay(2); 
  
}
