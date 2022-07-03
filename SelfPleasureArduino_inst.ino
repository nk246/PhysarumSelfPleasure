int pulse_in = 0;
int potPin = 2;
int ontime,offtime,duty;
float freq,period;

   
void setup()
{
  pinMode(pulse_in,INPUT);
  Serial.begin(9600); 
}

void loop()
{
   ontime = pulseIn(pulse_in,HIGH);
   offtime = pulseIn(pulse_in,LOW);
   period = ontime+offtime;
   freq = 1000000.0/period;
   duty = (ontime/period)*100;

   int potVal = analogRead(potPin);
   float amp = map(potVal, 1023, 0, 0, 3000);

   float ampFloat = amp/1000;
 
   Serial.println(freq);
   Serial.println(ampFloat);
   
}
