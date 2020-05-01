EESchema Schematic File Version 4
LIBS:mididrum-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Midi Drum"
Date "2020-04-08"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J?
U 1 1 5E8A4E45
P 3450 1200
F 0 "J?" H 3558 1581 50  0000 C CNN
F 1 "Pickit" H 3558 1490 50  0000 C CNN
F 2 "" H 3450 1200 50  0001 C CNN
F 3 "~" H 3450 1200 50  0001 C CNN
	1    3450 1200
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_PIC18:PIC18F4550-IP U?
U 1 1 5E8A3DFC
P 5800 3850
F 0 "U?" H 5800 5431 50  0000 C CNN
F 1 "PIC18F4550-IP" H 5800 5340 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 5800 4050 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/39760d.pdf" H 5800 3600 50  0001 C CNN
	1    5800 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J?
U 1 1 5E8A6151
P 9750 5150
F 0 "J?" H 9520 5139 50  0000 R CNN
F 1 "USB_B" H 9520 5048 50  0000 R CNN
F 2 "" H 9900 5100 50  0001 C CNN
F 3 " ~" H 9900 5100 50  0001 C CNN
	1    9750 5150
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E8A9D81
P 9350 4250
F 0 "#PWR?" H 9350 4100 50  0001 C CNN
F 1 "VCC" H 9367 4423 50  0000 C CNN
F 2 "" H 9350 4250 50  0001 C CNN
F 3 "" H 9350 4250 50  0001 C CNN
	1    9350 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8AA0AF
P 9750 6050
F 0 "#PWR?" H 9750 5800 50  0001 C CNN
F 1 "GND" H 9755 5877 50  0000 C CNN
F 2 "" H 9750 6050 50  0001 C CNN
F 3 "" H 9750 6050 50  0001 C CNN
	1    9750 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 5550 9750 5700
Wire Wire Line
	9850 5550 9850 5700
Wire Wire Line
	9850 5700 9750 5700
Connection ~ 9750 5700
Wire Wire Line
	9750 5700 9750 6050
Wire Wire Line
	9450 4950 9350 4950
Wire Wire Line
	9350 4950 9350 4250
$Comp
L Device:C_Small C?
U 1 1 5E8B8101
P 3050 4300
F 0 "C?" H 3142 4346 50  0000 L CNN
F 1 "15p" H 3142 4255 50  0000 L CNN
F 2 "" H 3050 4300 50  0001 C CNN
F 3 "~" H 3050 4300 50  0001 C CNN
	1    3050 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E8B8B8F
P 3450 4300
F 0 "C?" H 3542 4346 50  0000 L CNN
F 1 "15p" H 3542 4255 50  0000 L CNN
F 2 "" H 3450 4300 50  0001 C CNN
F 3 "~" H 3450 4300 50  0001 C CNN
	1    3450 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8B9AB9
P 3050 4850
F 0 "#PWR?" H 3050 4600 50  0001 C CNN
F 1 "GND" H 3055 4677 50  0000 C CNN
F 2 "" H 3050 4850 50  0001 C CNN
F 3 "" H 3050 4850 50  0001 C CNN
	1    3050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4850 3050 4550
Wire Wire Line
	3050 4550 3450 4550
Wire Wire Line
	3450 4550 3450 4400
Connection ~ 3050 4550
Wire Wire Line
	3050 4550 3050 4400
$Comp
L Device:Crystal Y?
U 1 1 5E8BBE68
P 3250 3900
F 0 "Y?" H 3250 4168 50  0000 C CNN
F 1 "20Mhz" H 3250 4077 50  0000 C CNN
F 2 "" H 3250 3900 50  0001 C CNN
F 3 "~" H 3250 3900 50  0001 C CNN
	1    3250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3900 3050 3900
Wire Wire Line
	3050 3900 3050 4200
Wire Wire Line
	3400 3900 3450 3900
Wire Wire Line
	3450 3900 3450 4200
Wire Wire Line
	3450 3900 3450 3550
Connection ~ 3450 3900
Wire Wire Line
	3050 3900 3050 3350
Connection ~ 3050 3900
$Comp
L power:VCC #PWR?
U 1 1 5E8C09D7
P 5350 2200
F 0 "#PWR?" H 5350 2050 50  0001 C CNN
F 1 "VCC" H 5367 2373 50  0000 C CNN
F 2 "" H 5350 2200 50  0001 C CNN
F 3 "" H 5350 2200 50  0001 C CNN
	1    5350 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2450 5700 2450
Wire Wire Line
	5700 5250 5800 5250
$Comp
L power:GND #PWR?
U 1 1 5E8C22BA
P 5700 5450
F 0 "#PWR?" H 5700 5200 50  0001 C CNN
F 1 "GND" H 5705 5277 50  0000 C CNN
F 2 "" H 5700 5450 50  0001 C CNN
F 3 "" H 5700 5450 50  0001 C CNN
	1    5700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5450 5700 5250
Connection ~ 5700 5250
$Comp
L power:VCC #PWR?
U 1 1 5E8C2D2D
P 8450 3550
F 0 "#PWR?" H 8450 3400 50  0001 C CNN
F 1 "VCC" H 8467 3723 50  0000 C CNN
F 2 "" H 8450 3550 50  0001 C CNN
F 3 "" H 8450 3550 50  0001 C CNN
	1    8450 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5E8C3AF8
P 8450 3750
F 0 "C?" H 8542 3796 50  0000 L CNN
F 1 "100n" H 8542 3705 50  0000 L CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "~" H 8450 3750 50  0001 C CNN
	1    8450 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3550 8450 3650
$Comp
L power:VCC #PWR?
U 1 1 5E8C5DD0
P 4250 1000
F 0 "#PWR?" H 4250 850 50  0001 C CNN
F 1 "VCC" H 4267 1173 50  0000 C CNN
F 2 "" H 4250 1000 50  0001 C CNN
F 3 "" H 4250 1000 50  0001 C CNN
	1    4250 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E8C61B9
P 4250 1300
F 0 "#PWR?" H 4250 1050 50  0001 C CNN
F 1 "GND" H 4255 1127 50  0000 C CNN
F 2 "" H 4250 1300 50  0001 C CNN
F 3 "" H 4250 1300 50  0001 C CNN
	1    4250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1000 3650 1000
Wire Wire Line
	3650 1300 3950 1300
Wire Wire Line
	3650 1400 3950 1400
Wire Wire Line
	3950 4350 4700 4350
Wire Wire Line
	3950 4450 4700 4450
Wire Wire Line
	6900 4950 7650 4950
Wire Wire Line
	7700 3050 6900 3050
Wire Wire Line
	7700 3150 6900 3150
Text Label 9100 5150 0    50   ~ 0
D+
Text Label 9100 5250 0    50   ~ 0
D-
Text Label 7700 3050 2    50   ~ 0
D-
Text Label 7700 3150 2    50   ~ 0
D+
Text Label 7650 4950 2    50   ~ 0
MCLR
Text Label 3950 1300 2    50   ~ 0
PGD
Text Label 3950 1400 2    50   ~ 0
PGC
Text Label 3950 1000 2    50   ~ 0
MCLR
Text Label 3950 4350 0    50   ~ 0
PGC
Text Label 3950 4450 0    50   ~ 0
PGD
Wire Wire Line
	3650 1100 4250 1100
Wire Wire Line
	4250 1100 4250 1000
Wire Wire Line
	3650 1200 4250 1200
Wire Wire Line
	4250 1200 4250 1300
Wire Wire Line
	5700 2450 5350 2450
Wire Wire Line
	5350 2450 5350 2200
Connection ~ 5700 2450
Text Label 3950 3850 0    50   ~ 0
ride
Text Label 3950 4050 0    50   ~ 0
kick
Text Label 3950 2750 0    50   ~ 0
hihat
Text Label 7650 4650 2    50   ~ 0
snare
Text Label 3950 2950 0    50   ~ 0
crash
Text Label 3950 3250 0    50   ~ 0
snare_rim
Wire Wire Line
	9100 5250 9450 5250
Wire Wire Line
	9100 5150 9450 5150
$Comp
L Device:C_Small C?
U 1 1 5E9A24C5
P 8000 3750
F 0 "C?" H 8092 3796 50  0000 L CNN
F 1 "220n" H 8092 3705 50  0000 L CNN
F 2 "" H 8000 3750 50  0001 C CNN
F 3 "~" H 8000 3750 50  0001 C CNN
	1    8000 3750
	1    0    0    -1  
$EndComp
Text Label 7650 4750 2    50   ~ 0
tom1
Text Label 7650 4850 2    50   ~ 0
tom2
Text Label 3950 3950 0    50   ~ 0
tom3
Wire Wire Line
	9100 2450 9950 2450
Wire Wire Line
	9100 2250 9950 2250
Wire Wire Line
	9100 2000 9950 2000
Wire Wire Line
	9100 1850 9950 1850
Wire Wire Line
	9100 1700 9950 1700
Wire Wire Line
	9100 1500 9950 1500
Wire Wire Line
	9100 1400 9950 1400
Wire Wire Line
	9100 1100 9950 1100
Wire Wire Line
	9100 900  9950 900 
Wire Wire Line
	9100 800  9950 800 
Text Label 9100 1100 0    50   ~ 0
crash
Text Label 9100 1400 0    50   ~ 0
snare_rim
Text Label 9100 1500 0    50   ~ 0
snare
Text Label 9100 800  0    50   ~ 0
hihat_pedal
Text Label 9100 900  0    50   ~ 0
hihat
Text Label 9100 1700 0    50   ~ 0
tom1
Text Label 9100 1850 0    50   ~ 0
tom2
Text Label 9100 2000 0    50   ~ 0
tom3
Text Label 9100 2250 0    50   ~ 0
kick
Text Label 9100 2450 0    50   ~ 0
ride
$Sheet
S 9950 650  800  2050
U 5E8DA7CB
F0 "Analog Input" 50
F1 "AnalogInput.sch" 50
F2 "ride" I L 9950 2450 50 
F3 "kick" I L 9950 2250 50 
F4 "tom3" I L 9950 2000 50 
F5 "tom2" I L 9950 1850 50 
F6 "hihat" I L 9950 900 50 
F7 "tom1" I L 9950 1700 50 
F8 "snare" I L 9950 1500 50 
F9 "snare_rim" I L 9950 1400 50 
F10 "crash" I L 9950 1100 50 
F11 "hihat_pedal" I L 9950 800 50 
$EndSheet
Text Label 3950 2850 0    50   ~ 0
hihat_pedal
Wire Wire Line
	8000 3650 8000 3550
$Comp
L power:GND #PWR?
U 1 1 5E8C365B
P 8450 3950
F 0 "#PWR?" H 8450 3700 50  0001 C CNN
F 1 "GND" H 8455 3777 50  0000 C CNN
F 2 "" H 8450 3950 50  0001 C CNN
F 3 "" H 8450 3950 50  0001 C CNN
	1    8450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3850 8450 3950
$Comp
L power:GND #PWR?
U 1 1 5EA1DC0E
P 8000 3950
F 0 "#PWR?" H 8000 3700 50  0001 C CNN
F 1 "GND" H 8005 3777 50  0000 C CNN
F 2 "" H 8000 3950 50  0001 C CNN
F 3 "" H 8000 3950 50  0001 C CNN
	1    8000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3850 8000 3950
NoConn ~ 3650 1500
Wire Wire Line
	4700 4050 3950 4050
Wire Wire Line
	4700 3950 3950 3950
Wire Wire Line
	4700 3850 3950 3850
Wire Wire Line
	3950 3250 4700 3250
Wire Wire Line
	3950 2950 4700 2950
Wire Wire Line
	3950 2850 4700 2850
Wire Wire Line
	3950 2750 4700 2750
Wire Wire Line
	7650 4650 6900 4650
Wire Wire Line
	7650 4750 6900 4750
Wire Wire Line
	7650 4850 6900 4850
Wire Wire Line
	6900 3550 8000 3550
Text Label 2400 1200 2    50   ~ 0
active_led
Text Label 2400 1000 2    50   ~ 0
inactive_led
$Comp
L Device:LED_CRGB D?
U 1 1 5E9B95BA
P 1600 1200
F 0 "D?" H 1600 1697 50  0000 C CNN
F 1 "LED_CRGB" H 1600 1606 50  0000 C CNN
F 2 "" H 1600 1150 50  0001 C CNN
F 3 "~" H 1600 1150 50  0001 C CNN
	1    1600 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3550 3450 3550
Wire Wire Line
	4700 3350 3050 3350
$Comp
L Device:LED D?
U 1 1 5E9D04CF
P 1550 2650
F 0 "D?" H 1543 2866 50  0000 C CNN
F 1 "LED" H 1543 2775 50  0000 C CNN
F 2 "" H 1550 2650 50  0001 C CNN
F 3 "~" H 1550 2650 50  0001 C CNN
	1    1550 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9D09B9
P 1550 3050
F 0 "D?" H 1543 3266 50  0000 C CNN
F 1 "LED" H 1543 3175 50  0000 C CNN
F 2 "" H 1550 3050 50  0001 C CNN
F 3 "~" H 1550 3050 50  0001 C CNN
	1    1550 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9D0FA8
P 1550 3450
F 0 "D?" H 1543 3666 50  0000 C CNN
F 1 "LED" H 1543 3575 50  0000 C CNN
F 2 "" H 1550 3450 50  0001 C CNN
F 3 "~" H 1550 3450 50  0001 C CNN
	1    1550 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9D1925
P 1550 4250
F 0 "D?" H 1543 4466 50  0000 C CNN
F 1 "LED" H 1543 4375 50  0000 C CNN
F 2 "" H 1550 4250 50  0001 C CNN
F 3 "~" H 1550 4250 50  0001 C CNN
	1    1550 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9D1DB8
P 1550 4650
F 0 "D?" H 1543 4866 50  0000 C CNN
F 1 "LED" H 1543 4775 50  0000 C CNN
F 2 "" H 1550 4650 50  0001 C CNN
F 3 "~" H 1550 4650 50  0001 C CNN
	1    1550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9D2211
P 1550 5050
F 0 "D?" H 1543 5266 50  0000 C CNN
F 1 "LED" H 1543 5175 50  0000 C CNN
F 2 "" H 1550 5050 50  0001 C CNN
F 3 "~" H 1550 5050 50  0001 C CNN
	1    1550 5050
	1    0    0    -1  
$EndComp
Text Label 2400 2650 2    50   ~ 0
hihat_pedal_led
Text Label 2400 3050 2    50   ~ 0
hihat_led
Text Label 2400 3450 2    50   ~ 0
crash_led
Text Label 2400 4250 2    50   ~ 0
snare_rim_led
Text Label 2400 4650 2    50   ~ 0
snare_led
Text Label 2400 5050 2    50   ~ 0
tom1_led
Wire Wire Line
	2400 2650 1700 2650
Wire Wire Line
	2400 3050 1700 3050
Wire Wire Line
	2400 3450 1700 3450
Wire Wire Line
	2400 4250 1700 4250
Wire Wire Line
	2400 4650 1700 4650
$Comp
L Device:R R?
U 1 1 5E9E5EBE
P 1150 1200
F 0 "R?" V 943 1200 50  0000 C CNN
F 1 "10k" V 1034 1200 50  0000 C CNN
F 2 "" V 1080 1200 50  0001 C CNN
F 3 "~" H 1150 1200 50  0001 C CNN
	1    1150 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E6DA9
P 1150 2650
F 0 "R?" V 943 2650 50  0000 C CNN
F 1 "10k" V 1034 2650 50  0000 C CNN
F 2 "" V 1080 2650 50  0001 C CNN
F 3 "~" H 1150 2650 50  0001 C CNN
	1    1150 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E7219
P 1150 3050
F 0 "R?" V 943 3050 50  0000 C CNN
F 1 "10k" V 1034 3050 50  0000 C CNN
F 2 "" V 1080 3050 50  0001 C CNN
F 3 "~" H 1150 3050 50  0001 C CNN
	1    1150 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E7542
P 1150 3450
F 0 "R?" V 943 3450 50  0000 C CNN
F 1 "10k" V 1034 3450 50  0000 C CNN
F 2 "" V 1080 3450 50  0001 C CNN
F 3 "~" H 1150 3450 50  0001 C CNN
	1    1150 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E7BA9
P 1150 4250
F 0 "R?" V 943 4250 50  0000 C CNN
F 1 "10k" V 1034 4250 50  0000 C CNN
F 2 "" V 1080 4250 50  0001 C CNN
F 3 "~" H 1150 4250 50  0001 C CNN
	1    1150 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E7E93
P 1150 4650
F 0 "R?" V 943 4650 50  0000 C CNN
F 1 "10k" V 1034 4650 50  0000 C CNN
F 2 "" V 1080 4650 50  0001 C CNN
F 3 "~" H 1150 4650 50  0001 C CNN
	1    1150 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9E81FB
P 1150 5050
F 0 "R?" V 943 5050 50  0000 C CNN
F 1 "10k" V 1034 5050 50  0000 C CNN
F 2 "" V 1080 5050 50  0001 C CNN
F 3 "~" H 1150 5050 50  0001 C CNN
	1    1150 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 2650 1300 2650
Wire Wire Line
	1400 3050 1300 3050
Wire Wire Line
	1400 3450 1300 3450
Wire Wire Line
	1400 4250 1300 4250
Wire Wire Line
	1400 4650 1300 4650
Wire Wire Line
	1400 5050 1300 5050
Wire Wire Line
	1700 5050 2400 5050
$Comp
L Device:LED D?
U 1 1 5EA06913
P 1550 5450
F 0 "D?" H 1543 5666 50  0000 C CNN
F 1 "LED" H 1543 5575 50  0000 C CNN
F 2 "" H 1550 5450 50  0001 C CNN
F 3 "~" H 1550 5450 50  0001 C CNN
	1    1550 5450
	1    0    0    -1  
$EndComp
Text Label 2400 5450 2    50   ~ 0
tom2_led
$Comp
L Device:R R?
U 1 1 5EA0691A
P 1150 5450
F 0 "R?" V 943 5450 50  0000 C CNN
F 1 "10k" V 1034 5450 50  0000 C CNN
F 2 "" V 1080 5450 50  0001 C CNN
F 3 "~" H 1150 5450 50  0001 C CNN
	1    1150 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 5450 1300 5450
Wire Wire Line
	1700 5450 2400 5450
$Comp
L Device:LED D?
U 1 1 5EA0A09B
P 1550 5850
F 0 "D?" H 1543 6066 50  0000 C CNN
F 1 "LED" H 1543 5975 50  0000 C CNN
F 2 "" H 1550 5850 50  0001 C CNN
F 3 "~" H 1550 5850 50  0001 C CNN
	1    1550 5850
	1    0    0    -1  
$EndComp
Text Label 2400 5850 2    50   ~ 0
tom3_led
$Comp
L Device:R R?
U 1 1 5EA0A0A2
P 1150 5850
F 0 "R?" V 943 5850 50  0000 C CNN
F 1 "10k" V 1034 5850 50  0000 C CNN
F 2 "" V 1080 5850 50  0001 C CNN
F 3 "~" H 1150 5850 50  0001 C CNN
	1    1150 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 5850 1300 5850
Wire Wire Line
	1700 5850 2400 5850
$Comp
L Device:LED D?
U 1 1 5EA0DE86
P 1550 6250
F 0 "D?" H 1543 6466 50  0000 C CNN
F 1 "LED" H 1543 6375 50  0000 C CNN
F 2 "" H 1550 6250 50  0001 C CNN
F 3 "~" H 1550 6250 50  0001 C CNN
	1    1550 6250
	1    0    0    -1  
$EndComp
Text Label 2400 6250 2    50   ~ 0
kick_led
$Comp
L Device:R R?
U 1 1 5EA0DE8D
P 1150 6250
F 0 "R?" V 943 6250 50  0000 C CNN
F 1 "10k" V 1034 6250 50  0000 C CNN
F 2 "" V 1080 6250 50  0001 C CNN
F 3 "~" H 1150 6250 50  0001 C CNN
	1    1150 6250
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 6250 1300 6250
Wire Wire Line
	1700 6250 2400 6250
$Comp
L Device:LED D?
U 1 1 5EA11C50
P 1550 6650
F 0 "D?" H 1543 6866 50  0000 C CNN
F 1 "LED" H 1543 6775 50  0000 C CNN
F 2 "" H 1550 6650 50  0001 C CNN
F 3 "~" H 1550 6650 50  0001 C CNN
	1    1550 6650
	1    0    0    -1  
$EndComp
Text Label 2400 6650 2    50   ~ 0
ride_led
$Comp
L Device:R R?
U 1 1 5EA11C57
P 1150 6650
F 0 "R?" V 943 6650 50  0000 C CNN
F 1 "10k" V 1034 6650 50  0000 C CNN
F 2 "" V 1080 6650 50  0001 C CNN
F 3 "~" H 1150 6650 50  0001 C CNN
	1    1150 6650
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 6650 1300 6650
Wire Wire Line
	1700 6650 2400 6650
$Comp
L power:GND #PWR?
U 1 1 5EA59950
P 750 7400
F 0 "#PWR?" H 750 7150 50  0001 C CNN
F 1 "GND" H 755 7227 50  0000 C CNN
F 2 "" H 750 7400 50  0001 C CNN
F 3 "" H 750 7400 50  0001 C CNN
	1    750  7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6650 750  6650
Wire Wire Line
	1000 6250 750  6250
Connection ~ 750  6650
Wire Wire Line
	1000 5850 750  5850
Connection ~ 750  6250
Wire Wire Line
	750  6250 750  6650
Wire Wire Line
	1000 5450 750  5450
Wire Wire Line
	750  5450 750  5850
Connection ~ 750  5850
Wire Wire Line
	750  5850 750  6250
Wire Wire Line
	1000 5050 750  5050
Wire Wire Line
	750  5050 750  5450
Connection ~ 750  5450
Wire Wire Line
	1000 4650 750  4650
Wire Wire Line
	750  4650 750  5050
Connection ~ 750  5050
Wire Wire Line
	1000 4250 750  4250
Wire Wire Line
	750  4250 750  4650
Connection ~ 750  4650
Connection ~ 750  4250
Wire Wire Line
	1000 3450 750  3450
Wire Wire Line
	1000 3050 750  3050
Wire Wire Line
	750  3050 750  3450
Connection ~ 750  3450
Wire Wire Line
	1000 2650 750  2650
Wire Wire Line
	750  2650 750  3050
Connection ~ 750  3050
Connection ~ 750  2650
Wire Wire Line
	1400 1200 1300 1200
Wire Wire Line
	1000 1200 750  1200
Wire Wire Line
	1800 1000 2400 1000
Wire Wire Line
	1800 1200 2400 1200
Text Label 7650 4350 2    50   ~ 0
ride_led
Text Label 7650 4250 2    50   ~ 0
kick_led
Text Label 7650 4150 2    50   ~ 0
tom3_led
Text Label 7650 4050 2    50   ~ 0
tom2_led
Text Label 7650 3950 2    50   ~ 0
tom1_led
Text Label 7650 3850 2    50   ~ 0
snare_led
Text Label 7650 3750 2    50   ~ 0
snare_rim_led
Text Label 7650 3250 2    50   ~ 0
crash_led
Text Label 7650 2950 2    50   ~ 0
hihat_led
Text Label 7650 2850 2    50   ~ 0
hihat_pedal_led
NoConn ~ 1800 1400
Text Label 3950 4250 0    50   ~ 0
active_led
Text Label 3950 3150 0    50   ~ 0
inactive_led
Wire Wire Line
	4700 3150 3950 3150
Wire Wire Line
	4700 4250 3950 4250
Wire Wire Line
	7650 4350 6900 4350
Wire Wire Line
	7650 4250 6900 4250
Wire Wire Line
	6900 4150 7650 4150
Wire Wire Line
	7650 4050 6900 4050
Wire Wire Line
	6900 3950 7650 3950
Wire Wire Line
	7650 3850 6900 3850
Wire Wire Line
	6900 3750 7650 3750
Wire Wire Line
	7650 3250 6900 3250
Wire Wire Line
	6900 2950 7650 2950
Wire Wire Line
	7650 2850 6900 2850
Wire Wire Line
	750  1200 750  2650
NoConn ~ 6900 2750
NoConn ~ 4700 3750
NoConn ~ 6900 3350
NoConn ~ 6900 4450
NoConn ~ 4700 4150
NoConn ~ 4700 3050
Wire Wire Line
	750  6650 750  7400
Wire Wire Line
	750  3450 750  4250
$EndSCHEMATC
