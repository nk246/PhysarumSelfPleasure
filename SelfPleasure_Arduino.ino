#define pulse_in 7
int ontime,offtime;
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
   
   Serial.println(freq);
}
