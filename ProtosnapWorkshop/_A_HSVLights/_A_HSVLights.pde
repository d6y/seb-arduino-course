
int delayTime = 300; 
int red = 3; 
int blue = 6; 
int green = 5; 
int button = 7;

int light = A0;

int hue =0; 


void setup() 
{
  Serial.begin(9600);
  
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(button, INPUT); 
}

void loop() 
{

  setHSV(hue%255, 255, 255); 
 
  delay(10); 
  hue++;
  
}

void setColour(int r, int g, int b) {
  
   analogWrite(red,255-(r*0.1));
   analogWrite(green,255-g);
   analogWrite(blue,255-(b*0.1)); 
  
}

void setHSV(int h, int s, int v)
{
   byte hb;
   unsigned int chroma, x;
   int r;
   int g; 
   int b;
 
   h *= 3;			//Changes the range of h from 0-255 to 0-765 (which is 
   				//almost 0-767).
      
   chroma = s * v;		//Chroma ends up in the range 0-(255*255) => 0-65025.
   chroma = chroma>>8;		//Using binary shift do divide with 256. 
   				//The range is now approximately 0-255.
       
   hb = h;			//The value of h is now assigned to a byte. This is 
   				//equivalent to taking modulo 256 of h, as the byte will overflow.
    
   
   x = chroma * (128 - abs( hb - 128) );	//x is calculated. 1 is replaced by 128 and 
   						//mod2 is replaced by the previous mod256 on h.	
   
   x = x>>7; 			//Dividing with 128 to fit x in the interval 0-255.
   				//This has to be done because of the changes we made to 
   				//the calculation of x.
  
   h = h>>7;			//h(0-767) is now divided with 128 so that becomes a number 0-5. 
 
   switch( h ) 			//Calculates the result, depending on which number from 
   				//0-5 h has become, and stores it in r, g and b.
   {
      case 0:
         r = v;
         g = x + v - chroma;
         b = v-chroma;
         break;
      case 1:
         g = v;
         r = x + v - chroma;
         b = v-chroma;
         break;
      case 2:
         g = v;
         b = x + v - chroma;
         r = v-chroma;
         break;
      case 3:
         b = v;
         g = x + v - chroma;
         r = v-chroma;
         break;
      case 4:
         b = v;
         r = x + v - chroma;
         g = v-chroma;
         break;
      case 5:
         r = v;
         b = x + v - chroma;
         g = v-chroma;
         break;  
   }  

  setColour(r,g,b);
  if(digitalRead(button) == LOW)
  {
     String output = String(r)+" "+String(g)+" "+String(b)+"\n";
     Serial.print(output);
    
  }

}
