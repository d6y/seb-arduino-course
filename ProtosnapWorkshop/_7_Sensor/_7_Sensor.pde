
#define RED 3
#define SENSOR A0

const int lightMaximum = 400;  // change this to the maximum output of the light sensor
const int lightMinimum = 40;    // change this to the minimum output of the light sensor

void setup() 
{
  pinMode(RED, OUTPUT); 
  pinMode(SENSOR, INPUT); 
  
  Serial.begin(9600); 
}

void loop() 
{
   int sensorlevel = analogRead(SENSOR); 
   int brightness = constrain(map(sensorlevel, lightMinimum, lightMaximum, 255, 200), 0, 255);
   
   Serial.println(sensorlevel); 
   
   analogWrite(RED, brightness ); 
   
  
 
}
