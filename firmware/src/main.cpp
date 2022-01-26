#include <Arduino.h>
// #include <BluetoothSerial.h>


// BluetoothSerial ESP_BT;

// int incoming;
// int LED_BUILTIN = 2;

// void setup()
// {
//   Serial.begin(115200);
//   ESP_BT.begin("Printer");
//   Serial.println("Bluetooth Device is Ready to Pair");
//   pinMode(LED_BUILTIN, OUTPUT);
// }

// void loop()
// {
//   if (ESP_BT.available())
//   {
//     incoming = ESP_BT.read();
//     Serial.print("Received:");
//     Serial.println(incoming);

//     if (incoming == 49)
//     {
//       digitalWrite(LED_BUILTIN, HIGH);
//       ESP_BT.println("LED turned ON");
//     }

//     if (incoming == 50)
//     {
//       digitalWrite(LED_BUILTIN, LOW);
//       ESP_BT.println("LED turned OFF");
//     }
//   }

//   delay(20);
// }


#include "Adafruit_Thermal.h"

// Here's the syntax when using SoftwareSerial (e.g. Arduino Uno) --------
// If using hardware serial instead, comment out or remove these lines:

#include "SoftwareSerial.h"
#define TX_PIN 26 // Arduino transmit  YELLOW WIRE  labeled RX on printer
#define RX_PIN 27 // Arduino receive   GREEN WIRE   labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial);     // Or Serial2, Serial3, etc.

// -----------------------------------------------------------------------

void setup() {

  // This line is for compatibility with the Adafruit IotP project pack,
  // which uses pin 7 as a spare grounding point.  You only need this if
  // wired up the same way (w/3-pin header into pins 5/6/7):
  pinMode(14, OUTPUT); digitalWrite(14, LOW);

  mySerial.begin(9600);  // Initialize SoftwareSerial
  //Serial1.begin(19200); // Use this instead if using hardware serial
  printer.begin();         // Init printer (same regardless of serial type)
 printer.setCodePage(6);
 printer.writeBytes(27, 9, 1);
  printer.justify('C');
  printer.boldOn();
  printer.println(F("BARCODE EXAMPLES\n"));
  printer.println(F("привет\n"));
  printer.boldOff();
  printer.justify('L');

  // There seems to be some conflict between datasheet descriptions
  // of barcode formats and reality.  Try Wikipedia and/or:
  // http://www.barcodeisland.com/symbolgy.phtml

  // Also note that strings passed to printBarcode() are always normal
  // RAM-resident strings; PROGMEM strings (e.g. F("123")) are NOT used.

  // UPC-A: 12 digits
  printer.print(F("UPC-A:"));
  printer.printBarcode("123456789012", UPC_A);

  // UPC-E: 6 digits ???
/* Commented out because I can't get this one working yet
  printer.print(F("UPC-E:"));
  printer.printBarcode("123456", UPC_E);
*/

  // EAN-13: 13 digits (same as JAN-13)
  printer.print(F("EAN-13:"));
  printer.printBarcode("1234567890123", EAN13);

  // EAN-8: 8 digits (same as JAN-8)
  printer.print(F("EAN-8:"));
  printer.printBarcode("12345678", EAN8);

  // CODE 39: variable length w/checksum?, 0-9,A-Z,space,$%+-./:
  printer.print(F("CODE 39:"));
  printer.printBarcode("ADAFRUT", CODE39);

  // ITF: 2-254 digits (# digits always multiple of 2)
  printer.print(F("ITF:"));
  printer.printBarcode("1234567890", ITF);

  // CODABAR: variable length 0-9,A-D,%+-./:
  printer.print(F("CODABAR:"));
  printer.printBarcode("1234567890", CODABAR);

  // CODE 93: compressed version of Code 39?
  printer.print(F("CODE 93:"));
  printer.printBarcode("ADAFRUIT", CODE93);

  // CODE 128: 2-255 characters (ASCII 0-127)
  printer.print(F("CODE128:"));
  printer.printBarcode("Adafruit", CODE128);

  printer.feed(2);
  printer.setDefault(); // Restore printer to defaults
}

void loop() {
}