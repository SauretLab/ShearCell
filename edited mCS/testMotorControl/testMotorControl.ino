/* Example sketch to control a stepper motor with TB6600 stepper motor driver
and Arduino without a library: number of revolutions, speed and direction.
More info: https://www.makerguides.com */
// Define stepper motor connections and steps per revolution:
#define dirPin 2
#define stepPin 5
void setup() {
// Declare pins as output:
pinMode(stepPin, OUTPUT);
pinMode(dirPin, OUTPUT);
// Set the spinning direction cw(HIGH) ccw(LOW):
digitalWrite(dirPin, LOW);
}
void loop() {
// Spin the stepper motor 1 revolution slowly:
digitalWrite(stepPin, HIGH);
delayMicroseconds(2000);
digitalWrite(stepPin, LOW);
delayMicroseconds(2000);
delay(1000);
} 
