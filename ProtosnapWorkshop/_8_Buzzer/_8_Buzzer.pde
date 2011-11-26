 
// buzzer's connected to pin 2
#define BUZZER 2
// light sensor's connected to analog 0
#define SENSOR A0  
// button's connected to pin 7
#define BUTTON 7  

const int lightMaximum = 400;  // change this to the maximum output of the light sensor
const int lightMinimum = 0;  // change this to the minimum value of the light sensor
const int maxFrequency = 3000;  // change this to your preferred high-frequency

void setup() {
  pinMode(BUZZER, OUTPUT);  // setup the buzzer as an output
  pinMode(BUTTON, INPUT);  // setup the button as an input
}

void loop() {
  int sensorReading = analogRead(SENSOR);  // Read the sensor
  /* below we'll use map() to change the light sensor value to something
  that'll make more sense for the buzzer */
  int thisPitch = map(sensorReading, lightMinimum, lightMaximum, 100, maxFrequency);

  /* If we're pressing the button, play a tone for 100ms */
  if (!digitalRead(BUTTON)) {
    tone(BUZZER, thisPitch, 100);  // the tone() function plays a tone on the buzzer
  }
  /* this while loop will loop until you release the button
  the arduino will be doing nothing while it's in here */
  while(!digitalRead(BUTTON));

}

