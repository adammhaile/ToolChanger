; homez.g
; called to home the Z axis

G29 S2

T-1       ;just in case there is a tool coupled, go try to drop it at the dock

M98 P"/macros/Coupler/Unlock"	;Open Coupler

G91 					; Relative mode
G1 H2 Z5 F5000			; Lower the bed
G90						; back to absolute positioning

G1 X150 Y100 F5000	    ; Position the endstop above the bed centre

G91 					; Relative mode

G4 P500					; wait 500msec
G30 Z-300 H1 F1000		; Move Z down until the switch triggers (first pass)
G30 Z-300 H1 F300		; Move Z down until the switch triggers (second pass)

G1 Z10 F5000			; Drop the Bed

G90						; Back to absolute positioning

G29 S1