
// set a variable to store which pin we want
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define LED 6

// the button is attached to pin 7
#define BUTTON 7

void setup() 
{
  // set the led pin as an output
  pinMode(LED, OUTPUT); 
  // and the button pin as an input
  pinMode(BUTTON, INPUT); 
}

void loop() 
{
  for(int i=255; i>=0; i--) 
  {
    analogWrite(LED, i); 
    delay(2);
  }
  for(int i=0; i<=255; i++) 
  {
    analogWrite(LED, i); 
    delay(2);
  }

  delay(200); 
  
}
