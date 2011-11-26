
// set a variable to store which pin we want to use
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define LED 13


void setup() 
{
  // set the pins as outputs
  pinMode(LED, OUTPUT); 
}

void loop() 
{
  
  // turn the led on 
  digitalWrite(LED, HIGH); 
  // wait for 500 ms
  delay(500); 
  // turn it off
  digitalWrite(LED, LOW); 
  // and wait for 10 ms
  delay(100);   
  
}
