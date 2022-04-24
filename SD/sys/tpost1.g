; tpost1.g
; called after tool 1 has been selected

;heatup
M116 P1

M98 P"purge.g"

;Move Out
G53 G1 X76.2 Y150 F4000

;mesh levelling on
G29 S1

;PCF fan on
M106 R2
