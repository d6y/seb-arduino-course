
// set a variable to store which pin we want to use
// 13 is the built in LED
// 3 is the RGB led red
// 5 is the RGB green
// 6 is the RGB blue

#define RED 3
#define GREEN 5
#define BLUE 6

unsigned int counter = 0; 

void setup() 
{
  // set the pins as outputs
  pinMode(RED, OUTPUT); 
  pinMode(GREEN, OUTPUT); 
  pinMode(BLUE, OUTPUT); 
  
  // turn off all leds
  digitalWrite(RED, HIGH);
  digitalWrite(GREEN, HIGH); 
  digitalWrite(BLUE, HIGH);

}

void loop() 
{
  // same as counter = counter + 1; (adds one to counter)
  counter++; 
  
  if(counter%1200>600) 
  {
    digitalWrite(RED, LOW); 
  }
  else
  {
    digitalWrite(RED, HIGH); 
  }
  
  if(counter%600>300) 
  {
    digitalWrite(GREEN, LOW); 
  }
  else
  {
    digitalWrite(GREEN, HIGH); 
  }
  
  if(counter%300>150) 
  {
    digitalWrite(BLUE, LOW); 
  }
  else
  {
    digitalWrite(BLUE, HIGH); 
  }
  
  delay(4); 
}
