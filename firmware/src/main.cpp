#include <Arduino.h>

#include "SoftwareSerial.h"
#include <Adafruit_Thermal.h>
#include <BluetoothSerial.h>

BluetoothSerial ESP_BT;

#define TX_PIN 26
#define RX_PIN 27

SoftwareSerial mySerial(RX_PIN, TX_PIN);
Adafruit_Thermal printer(&mySerial);

int incoming;

void setup() {
  ESP_BT.begin("Printer");
  mySerial.print(0x1b);
  mySerial.print(0x9);
  mySerial.print(0x1);
  mySerial.print("\r\n");
  pinMode(14, OUTPUT);
  digitalWrite(14, LOW);
  Serial.begin(115200);
}

void loop()
{
  if (ESP_BT.available()) {
    String text = ESP_BT.readStringUntil('\n');
    Serial.print("Received: ");
    Serial.println(text);
    if(text == "1") {
      Serial.println("Info");
    }
    // incoming = ESP_BT.read();
    // Serial.print("Received:");
    // Serial.println(incoming);

    // if (incoming == 49) {
    //   digitalWrite(LED_BUILTIN, HIGH);
    //   ESP_BT.println("LED turned ON");
    //   prt();
    // }

    // if (incoming == 50) {
    //   digitalWrite(LED_BUILTIN, LOW);
    //   ESP_BT.println("LED turned OFF");
    // }
  }
  delay(20);
}
