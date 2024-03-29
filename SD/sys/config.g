; Configuration file for Duet WiFi
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin

; Network
M550 P"ToolChanger" 			; Set machine name
M552 S1							; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

M667 S1 						; Select CoreXY mode

; XY Endstops
M574 X1 Y1 S3 						; Set X / Y endstop stall detection

; Z Endstop
M574 Z0 P"nil"						; Set Z endstop probe
M558 P5 C"zstop" H5 F360 T20000 	; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0   		 		; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 				; Define mesh grid

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S1 						; Drive 2 Z
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S0 						; Drive 7 COUPLER
M569 P8 S0 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED

M584 X0 Y1 Z2 C7 E3:4:5:6								; Apply custom drive mapping
M208 X-35 Y-49 Z0 C0 S1									; Set axis minima
M208 X328.5 Y244 Z300 C260 S0							; Set axis maxima
M350 C8 I0 											; Configure microstepping without interpolation
M350 X16 Y16 Z16 E16:16:16:16 I1						; Configure microstepping with interpolation
M92 X100 Y100 Z1600 C100 E409:409:834:834				; Set steps per mm
M566 X400 Y400 Z8 C2 E2:2:2:2							; Set maximum instantaneous speed changes (mm/min)
;M203 X35000 Y35000 Z1200 C5000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M203 X20000 Y20000 Z1200 C5000 E5000:5000:5000:5000		; Set maximum speeds (mm/min)
;M201 X6000 Y6000 Z400 C400 E2500:2500:2500:2500		; Set accelerations (mm/s^2)							
M201 X700 Y700 Z400 C400 E2500:2500:2500:2500 			; Set accelerations (mm/s^2)
M906 X2000 Y2000 Z1330 C400 E1200:1200:1680:1680 I30 	; Set motor currents (mA) and motor idle factor in percent
M84 S120 												; Set idle timeout
M204 P900 T1600 R3300

;Stall Detection
M915 X Y S2 F0 H200 			; X / Y Axes

; init tool detection
;M98 P/macros/tool-detect/tool-detect-init

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4138 C0    ; Set thermistor 
M950 H0 C"bedheat" T0                                       ; Bed heater
M140 H0                                                     ; Add heater to bed after RRF3.01 RC10
M143 H0 S120                                                ; Set temperature limit for heater 0 to 120C

M308 S1 P"e0_temp" Y"thermistor" A"0.4mm #1"				; Set thermistor
M950 H1 C"e0_heat" T1;										; Assign heater
M143 H1 S300 												; Set temperature limit for heater 1 to 300C
M307 H1 A559.7 C283.1 D3.5              					; v6, 30w results from m303 h1 s275

M308 S2 P"e1_temp" Y"thermistor" A"0.4mm #2"				; Set thermistor
M950 H2 C"e1_heat" T2;										; Assign heater
M143 H2 S300 												; Set temperature limit for heater 2 to 300C
M307 H2 A559.7 C283.1 D3.5              					; v6, 30w results from m303 h2 s275

M308 S3 P"duex.e2temp" Y"thermistor" A"0.6mm"				; Set thermistor
M950 H3 C"duex.e2_heat" T3;									; Assign heater
M143 H3 S300 												; Set temperature limit for heater 3 to 300C
M307 H3 A559.7 C283.1 D3.5          			    		; v6, 30w results from m303 h3 s275

M308 S4 P"duex.e3temp" Y"thermistor" A"1.0mm"				; Set thermistor
M950 H4 C"duex.e3_heat" T4;									; Assign heater
M143 H4 S300 												; Set temperature limit for heater 4 to 
M307 H4 A559.7 C283.1 D3.5              					; v6, 30w results from m303 h4 s2

; Fans
M950 F1 C"fan1"               ; T0 Hotend
M950 F2 C"fan2"               ; T0 Part Cooling
M950 F3 C"duex.fan3"          ; T1 Hotend
M950 F4 C"duex.fan4"          ; T1 Part Cooling
M950 F5 C"duex.fan5"          ; T2 Hotend
M950 F6 C"duex.fan6"          ; T2 Part Cooling
M950 F7 C"duex.fan7"          ; T3 Hotend
M950 F8 C"duex.fan8"          ; T3 Part Cooling

M106 P1 S255 H1 T50           ; T0 Hotend
M106 P2 S0                    ; T0 Part Cooling
M106 P3 S255 H2 T50           ; T1 Hotend
M106 P4 S0                    ; T1 Part Cooling 
M106 P5 S255 H3 T50           ; T2 Hotend 
M106 P6 S0                    ; T2 Part Cooling
M106 P7 S255 H4 T50           ; T3 Hotend
M106 P8 S0                    ; T3 Part Cooling

; Tools
; Definitions
M563 P0 S"T0" D0 H1 F2        ; Define tool 0 with associated heater and fan
M563 P1 S"T1" D1 H2 F4        ; Define tool 1 with associated heater and fan
M563 P2 S"T2" D2 H3 F6        ; Define tool 2 with associated heater and fan
M563 P3 S"T3" D3 H4 F8        ; Define tool 3 with associated heater and fan

; Lights
M307 H7 A-1 C-1 D-1			  ; make E6 heater pin available
M950 P0 C"duex.e6_heat" Q4000 ; setup GPIO for lights on E6 heat output, 2kHz

; E-Stop
M950 J1 C"e1stop"
M581 P1 T0 C0 S1

; Reset Offsets and Temperatures
G10 P0 X0 Y0 Z0               ; Reset tool 0 axis offsets
G10 P0 R0 S0                  ; Reset initial tool 0 active and standby temperatures to 0C
G10 P1 X0 Y0 Z0               ; Reset tool 1 axis offsets
G10 P1 R0 S0                  ; Reset initial tool 1 active and standby temperatures to 0C
G10 P2 X0 Y0 Z0               ; Reset tool 2 axis offsets
G10 P2 R0 S0                  ; Reset initial tool 2 active and standby temperatures to 0C
G10 P3 X0 Y0 Z0               ; Reset tool 3 axis offsets
G10 P3 R0 S0                  ; Reset initial tool 3 active and standby temperatures to 0C


M593 F50							; cancel ringing at 50Hz

M575 P1 S1 B57600 					; Enable PanelDue 7i

M98 P/sys/offsets.g					; load nozzle offsets

M501 								; load config-override.g

M913 C25

;deselect tools
T-1

M98 P/macros/Lights/Lights100		; turn on lights