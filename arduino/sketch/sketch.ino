/**************************************************************************/
/*!
    @file     readMifare.pde
    @author   Adafruit Industries
	@license  BSD (see license.txt)

    This example will wait for any ISO14443A card or tag, and
    depending on the size of the UID will attempt to read from it.

    If the card has a 4-byte UID it is probably a Mifare
    Classic card, and the following steps are taken:

    - Authenticate block 4 (the first block of Sector 1) using
      the default KEYA of 0XFF 0XFF 0XFF 0XFF 0XFF 0XFF
    - If authentication succeeds, we can then read any of the
      4 blocks in that sector (though only block 4 is read here)

    If the card has a 7-byte UID it is probably a Mifare
    Ultralight card, and the 4 byte pages can be read directly.
    Page 4 is read by default since this is the first 'general-
    purpose' page on the tags.


This is an example sketch for the Adafruit PN532 NFC/RFID breakout boards
This library works with the Adafruit NFC breakout
  ----> https://www.adafruit.com/products/364

Check out the links above for our tutorials and wiring diagrams
These chips use SPI or I2C to communicate.

Adafruit invests time and resources providing this open source code,
please support Adafruit and open-source hardware by purchasing
products from Adafruit!


This code has been adapted for Bath Hack 2026
*/
/**************************************************************************/

// WRITE
// #include <Wire.h>
// #include <Arduino.h>
// #include <SPI.h>
// #include <Adafruit_PN532.h>
//
// #define PN532_IRQ   (2)
// #define PN532_RESET (3) 
//
// // Shield with an I2C connection:
// Adafruit_PN532 nfc(PN532_IRQ, PN532_RESET);
//
//
// void setup(void)
// {
//     Serial.begin(115200);
//     Wire.begin();
//     SPI.begin();
//     nfc.begin();
//
//     uint32_t versiondata = nfc.getFirmwareVersion();
//     if (!versiondata) {
//         Serial.println("Didn't find PN53x board");
//         while (1);
//     }
//     nfc.SAMConfig();
// }
//
//
// void loop(void) {
//   uint8_t success;
//   uint8_t uid[7];
//   uint8_t uidLength;  
//   success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);
//
//   if (success) {
//     if (uidLength == 4)
//     {
//       uint8_t keya[6] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
//
//       success = nfc.mifareclassic_AuthenticateBlock(uid, uidLength, 4, 0, keya);
//       if (success)
//       {
//         uint8_t data[16];
//
//         // If you want to write something to block 4 to test with, uncomment
//         // the following line and this text should be read back in a minute
//         memcpy(data, (const uint8_t[]){ 'a', 'd', 'a', 'f', 'r', 'u', 'i', 't', '.', 'c', 'o', 'm', 0, 0, 0, 0 }, sizeof data);
//
//         success = nfc.mifareclassic_WriteDataBlock (4, data);
//
//         // Try to read the contents of block 4
//         success = nfc.mifareclassic_ReadDataBlock(4, data);
//         if (success)
//         {
//           nfc.PrintHexChar(data, 16); // Print the data
//           Serial.println("OK");
//
//           // Wait a bit before reading the card again
//           // delay(200);
//         }
//         else
//         {
//           Serial.println("ERROR");
//         }
//       }
//       else
//       {
//         Serial.println("ERROR");
//       }
//     }
//   }
// }



/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////


// READING:
#include <Wire.h>
#include <Arduino.h>
#include <SPI.h>
#include <Adafruit_PN532.h>

#define PN532_IRQ   (2)
#define PN532_RESET (3) 

// Shield with an I2C connection:
Adafruit_PN532 nfc(PN532_IRQ, PN532_RESET);


void setup(void)
{
    Serial.begin(115200);
    Wire.begin();
    SPI.begin();
    nfc.begin();

    uint32_t versiondata = nfc.getFirmwareVersion();
    if (!versiondata) {
        Serial.println("Didn't find PN53x board");
        while (1);
    }
    nfc.SAMConfig();
}


void loop(void) {
  uint8_t success;
  uint8_t uid[7];
  uint8_t uidLength;  
  success = nfc.readPassiveTargetID(PN532_MIFARE_ISO14443A, uid, &uidLength);

  if (success) {
    if (uidLength == 4)
    {
      uint8_t keya[6] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };

      success = nfc.mifareclassic_AuthenticateBlock(uid, uidLength, 4, 0, keya);

      if (success)
      {
        uint8_t data[16];

        // If you want to write something to block 4 to test with, uncomment
        // the following line and this text should be read back in a minute
        //memcpy(data, (const uint8_t[]){ 'a', 'd', 'a', 'f', 'r', 'u', 'i', 't', '.', 'c', 'o', 'm', 0, 0, 0, 0 }, sizeof data);
        // success = nfc.mifareclassic_WriteDataBlock (4, data);

        // Try to read the contents of block 4
        success = nfc.mifareclassic_ReadDataBlock(4, data);
        if (success)
        {
          nfc.PrintHexChar(data, 16); // Print the data
          Serial.println("OK");

          // Wait a bit before reading the card again
          // delay(200);
        }
        else
        {
          Serial.println("ERROR");
        }
      }
      else
      {
        Serial.println("ERROR");
      }
    }
  }
}





