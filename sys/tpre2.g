; tpre2.g
; called before tool 2 is selected

G29 S2

;Ensure no tool is selected
;T-1

;Unlock Coupler
M98 P"/macros/Coupler/Unlock"

;Move to location
G1 X214.5 Y150 F50000

;Move in
G1 X214.5 Y230 F50000

;Collect
G1 X214.5 Y243 F2500

;Close Coupler
M98 P"/macros/Coupler/Lock"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z20 F1000
G90

;Move Out
G1 X214.5 Y150 F4000

G29 S1