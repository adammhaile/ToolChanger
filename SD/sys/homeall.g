; homeall.g
; called to home all axes

M98 Phomec.g			; Home C (ToolHead)

M98 Phomey.g			; Home Y

M98 Phomex.g			; Home X

M98 Phomez.g			; Home Z

G29 S2
G1 X150 Y-47 F15000		; Park
G29 S1