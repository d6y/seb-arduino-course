
// set a variable to store which pin we want
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define LED 13

// the button is attached to pin 7
#define BUTTON 7

void setup() 
{
  // set the led pin as an output
  pinMode(LED,OUTPUT); 
  // and the button pin as an input
  pinMode(BUTTON, INPUT); 
}

void loop() 
{
  // if the button is pressed then turn the light on
  if(digitalRead(BUTTON) == HIGH) 
  { 
    digitalWrite(LED, LOW); 
  }
  else
  {
    digitalWrite(LED, HIGH); 
  }   
  
}
