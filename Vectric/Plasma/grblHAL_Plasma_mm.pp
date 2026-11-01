+================================================
+                                                
+ grblHAL - Vectric machine output configuration file   
+ Version for VCarve <  Ver 10.5
+ Uses material file
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      When       What                         
+ ======== ========== ===========================
+ Terje    04/05/2026 Created
+================================================

POST_NAME = "grblHAL Plasma (mm) (*.nc)"

FILE_EXTENSION = "nc"

UNITS = "MM"

DIRECT_OUTPUT = "GCode Sender|GCodeSender_run.ini"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|C|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|A|X|1.3]
VAR Y_POSITION = [Y|A|Y|1.3]
VAR Z_POSITION = [Z|A|Z|1.3]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.3]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.3]
VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3]
VAR SAFE_Z_HEIGHT = [SAFEZ|A|Z|1.3]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

SUBSTITUTE = "({)}"

+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------

begin HEADER

"( grblHAL Plasma Postprocessor )"
"G0G21G90G40"
"G17"
"G91.1"
"F#<_hal[91]plasmac.cut-feed-rate[93]>"
"[XH][YH]"
"( [TOOLPATH_NAME] )"

+---------------------------------------------------
+ Commands output for a new segment ( new toolpath with current toolnumber)
+---------------------------------------------------
begin NEW_SEGMENT
"( [TOOLPATH_NAME] )"

+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G0[X][Y]"

+ ---------------------------------------------------
+  Commands output for Retract Moves
+ ---------------------------------------------------
begin PLUNGE_MOVE

"G65P100"
"G0Z0"
"M3S1"

+ ---------------------------------------------------
+  Commands output for Retract Moves
+ ---------------------------------------------------
begin RETRACT_MOVE

"M5"
"G0Z10"

+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"G1[X][Y]"

+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"G2[X][Y][I][J]"

+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"G2[X][Y][I][J]"

+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"G3[X][Y][I][J]"

+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"G3[X][Y][I][J]"

+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER

"G0 [XH] [YH]"
M190P-1
"M30"
