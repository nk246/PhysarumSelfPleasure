import processing.serial.*; // import library for Serial communication
import processing.sound.*; // import sound library

Serial USBport;
String incomingData = null;
float rawSensorData;
float[] dataList;
int amount = 0;
float freq;

int xPos = 10; // horizontal position of the graph

SinOsc sine;
SawOsc saw;
Pulse pulse;


void setup(){
printArray (Serial.list()); //show Serial devices

//create fullscreen canvas with black background
//fullScreen();  //remove "//" before "fullScreen();"
background(0);

//open new port
String portName = Serial.list()[3]; //<----- Put your identified port number here
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
USBport = new Serial(this, portName, 9600);
USBport.bufferUntil ('\n');
    
  //create sine oscillator.
  sine = new SinOsc(this);
  sine.amp(0.5);

}

void draw() {
  
  // multiply frequency by factor of 1.5 and play
  freq = freq*1.5;
  sine.play();
  sine.freq(freq);
  
    // create white line for graph
    stroke(255);
    line(xPos, height, xPos, height - freq);

    // go back to the beginning when at the edge
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } else {
      // increment horizontal position
      xPos++;
    }

}

//get data from Serial port
void serialEvent(Serial USBport)
{
  if (USBport.available() > 0)
  {
    String completeString = USBport.readStringUntil(10); // read the Serial port until there is a linefeed/carriage return
    if (completeString != null) // only use String if there is valid data
    {
      trim(completeString); // remove whitespace characters at the beginning and end of the string
      String seperateValues[] = split(completeString, ","); // split the string
      freq = int(seperateValues[0]);
    }
  }
}
