// Decode Max and James' message by reading the LED on their Arduino
// converting it to Morse and writing the letter down the serial port.

// Milliseconds: customised for Max & James' Morse style
#define PAUSE 300
#define LONG_BEEP 200
#define SHORT_BEEP 90

// TODO: Make adpative, so the code knows a short beep
//       is relative to a long beep (and v.v.) and pauses
//       are relative to gap between beeps.

// Source: http://en.wikipedia.org/wiki/Morse_code
char* morse[26] = {
  ".-",  // A
  "-...",
  "-.-.",
  "-..",
  ".",  // E
  "..-.",
  "--.",
  "....", // H
  "..",
  ".---",
  "-.-",
  ".-..",
  "--", // M
  "-.",
  "---", // O
  ".--.",
  "--.-",
  ".-.",
  "...",
  "-", // T
  "..-", // U
  "...-",
  ".--",
  "-..-",
  "-.--",
  "--.."
};

// For debugging -------------------------------------------

boolean logging = true;

void logBeep(char* title, int duration) {
  if (logging) {
    Serial.print(title);
    Serial.print(" ");
    Serial.println(duration);
  }
}

void logMessage(char* msg) {
  if (logging)
    Serial.println(msg);
}


// Init --------------------------------------------------------

#define SENSOR A0

void setup() {
  Serial.begin(9600); // 9600 baud for USB?
}


// I/O ------------------------------------------------------------

boolean see_led() {
  // LED in the video appears bright in these ranges on my screen:
  int brightness = analogRead(SENSOR);
  return brightness >= 6 && brightness <= 15;
}



// State ---------------------------------------------------------

#define MAX_DOT_DASHES 6
char dots_and_dashes[] = "??????";
int dot_dash_pos = 0;

void reset() {
  dot_dash_pos = 0;
  for(int i=0; i<MAX_DOT_DASHES;i++)
    dots_and_dashes[i]='?';
}

boolean beeping = false;
long beep_started = 0L;
long beep_ended = 0L;

// Compute --------------------------------------------------------

// Decode the dots and dashes we've collected so far.
void decode() {
  for(int letter=0; letter<26; letter++) {
    boolean found = true;
    for(int pos=0; pos<dot_dash_pos && found; pos++)
      found = found && morse[letter][pos]==dots_and_dashes[pos];
        
    if (found && strlen(morse[letter]) == dot_dash_pos) {
        Serial.println((char)(letter+65));
        break;
    }
    
  }   

  reset();
}


// Event handling -------------------------------------------------

// Event: detection of the start of a beep
void start_of_beep() {
  beep_started = millis();
  beeping = true;
}

// Event: detection of the end of a beep (possibly)
void end_of_beep() {
 long now = millis();
 long beep_length = now - beep_started;
 
 if (beep_length < 2) {
   logMessage("Bounce");
   return;  // de-bounce very short light changes
 }
 
 beeping = false;
 beep_ended = now;

  if (beep_length > LONG_BEEP) {
    logBeep("Long", beep_length);
    dots_and_dashes[dot_dash_pos++] = '-';
  } else if (beep_length > SHORT_BEEP) {
    logBeep("Short", beep_length);
    dots_and_dashes[dot_dash_pos++] = '.';
  }

  if (dot_dash_pos >= MAX_DOT_DASHES) { //oops
    logMessage("overflow");
    reset();
  } 
  
}

// Event: possibly a pause after a beep
void pause() {
   long now = millis();
   if ( (now-beep_ended) > PAUSE && dot_dash_pos > 0) {
     logMessage("PAUSE");
     // Long time since we beeped. That could be a pause
     decode();
    
  } 
}



// Loop -----------------------------------------------------------------
  
void loop() {
  
  boolean light_on = see_led();
  
  if (light_on && !beeping) {
    start_of_beep();  
  } else if (!light_on && beeping) {
    end_of_beep();
  } else if (!light_on && !beeping) {
    pause();
  }
  
  delay(1); // appox 1ms cycle time

}

