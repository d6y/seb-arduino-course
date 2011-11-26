
// set a variable to store which pin we want to use
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define RED 3
#define GREEN 5
#define BLUE 6

void setup() 
{
  // set the pins as outputs
  pinMode(RED, OUTPUT); 
  pinMode(GREEN, OUTPUT); 
  pinMode(BLUE, OUTPUT); 
}

void loop() 
{
  
  // turn the red light on 
  digitalWrite(RED, LOW); 
  // wait for 500 ms
  delay(500); 
  // turn it off
  digitalWrite(RED, HIGH); 
  // and wait for 100 ms
  delay(100);   
  
  // now do the same for green
  
  digitalWrite(GREEN, LOW); 
  delay(500); 
  digitalWrite(GREEN, HIGH); 
  delay(100); 

  // and blue
  
  digitalWrite(BLUE, LOW); 
  delay(500); 
  digitalWrite(BLUE, HIGH); 
  delay(100);     
  
}
