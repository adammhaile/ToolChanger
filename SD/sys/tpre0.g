; tpre0.g
; called before tool 0 is selected

G29 S2

;Ensure no tool is selected
;T-1

;Unlock Coupler
M98 P"/macros/Coupler/Unlock"

;Move to location
G53 G1 X-14 Y150 F50000

;Move in
G53 G1 X-14 Y215 F50000

;Collect
G53 G1 X-14 Y228 F2500

;Close Coupler
M98 P"/macros/Coupler/Lock"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z20 F1000
G90

;Move Out
;G53 G1 X-14 Y150 F4000

G29 S1