
!!if not defined __GUI_LIB2_BI__
!!define __GUI_LIB2_BI__

'$include:'../mem_library/mem_lib.bi'
'$include:'../obj_library/std_objects.bi'


'Setup library wide constants

CONST GUI_VER$ = ".97" 'Current GUI version


'TRUE, FALSE, pointer NULL, and image NULL (Images are -1 when invalid)
CONST GUI_TRUE       = -1
CONST GUI_FALSE      = 0
CONST GUI_NULL       = 0
CONST GUI_IMAGE_NULL = -1

'Various key codes for _KEYHIT -- Used for keycode in key event
CONST GUI_KEY_CODE_PAUSE            = 100019
CONST GUI_KEY_CODE_NUMLOCK          = 100300 
CONST GUI_KEY_CODE_CAPSLOCK         = 100301 
CONST GUI_KEY_CODE_SCROLLOCK        = 100302 
CONST GUI_KEY_CODE_RSHIFT           = 100303 
CONST GUI_KEY_CODE_LSHIFT           = 100304 
CONST GUI_KEY_CODE_RCTRL            = 100305 
CONST GUI_KEY_CODE_LCTRL            = 100306 
CONST GUI_KEY_CODE_RALT             = 100307 
CONST GUI_KEY_CODE_LALT             = 100308 
CONST GUI_KEY_CODE_RAPPLE           = 100309 'Left 'Apple' key (MacOSX) 
CONST GUI_KEY_CODE_LAPPLE           = 100310 'Right 'Apple' key (MacOSX) 
CONST GUI_KEY_CODE_LMETA            = 100311 'Left "Windows" key 
CONST GUI_KEY_CODE_RMETA            = 100312 'Right "Windows"key 
CONST GUI_KEY_CODE_ALT_GR           = 100313 '"AltGr" key 
CONST GUI_KEY_CODE_COMPOSE          = 100314 
CONST GUI_KEY_CODE_HELP             = 100315 
CONST GUI_KEY_CODE_PRINT            = 100316 
CONST GUI_KEY_CODE_SYSREQ           = 100317 
CONST GUI_KEY_CODE_BREAK            = 100318 
CONST GUI_KEY_CODE_MENU             = 100319 
CONST GUI_KEY_CODE_POWER            = 100320 
CONST GUI_KEY_CODE_EURO             = 100321 
CONST GUI_KEY_CODE_UNDO             = 100322 
CONST GUI_KEY_CODE_KP0              = 100256 
CONST GUI_KEY_CODE_KP1              = 100257 
CONST GUI_KEY_CODE_KP2              = 100258 
CONST GUI_KEY_CODE_KP3              = 100259 
CONST GUI_KEY_CODE_KP4              = 100260 
CONST GUI_KEY_CODE_KP5              = 100261
CONST GUI_KEY_CODE_KP7              = 100263 
CONST GUI_KEY_CODE_KP8              = 100264 
CONST GUI_KEY_CODE_KP9              = 100265 
CONST GUI_KEY_CODE_KP_PERIOD        = 100266
CONST GUI_KEY_CODE_KP_DIVIDE        = 100267 
CONST GUI_KEY_CODE_KP_MULTIPLY      = 100268
CONST GUI_KEY_CODE_KP_MINUS         = 100269 
CONST GUI_KEY_CODE_KP_PLUS          = 100270 
CONST GUI_KEY_CODE_KP_ENTER         = 100271 
CONST GUI_KEY_CODE_KP_INSERT        = 200000 
CONST GUI_KEY_CODE_KP_END           = 200001 
CONST GUI_KEY_CODE_KP_DOWN          = 200002 
CONST GUI_KEY_CODE_KP_PAGE_DOWN     = 200003 
CONST GUI_KEY_CODE_KP_LEFT          = 200004 
CONST GUI_KEY_CODE_KP_MIDDLE        = 200005 
CONST GUI_KEY_CODE_KP_RIGHT         = 200006 
CONST GUI_KEY_CODE_KP_HOME          = 200007 
CONST GUI_KEY_CODE_KP_UP            = 200008 
CONST GUI_KEY_CODE_KP_PAGE_UP       = 200009 
CONST GUI_KEY_CODE_KP_DELETE        = 200010 
CONST GUI_KEY_CODE_SCROLL_LOCK_MODE = 200011 
CONST GUI_KEY_CODE_INSERT_MODE      = 200012
CONST GUI_KEY_CODE_TAB              = 9
CONST GUI_KEY_CODE_BACKSPACE        = 8
CONST GUI_KEY_CODE_F1               = 15104
CONST GUI_KEY_CODE_F2               = 15360
CONST GUI_KEY_CODE_F3               = 15616
CONST GUI_KEY_CODE_F4               = 15872
CONST GUI_KEY_CODE_F5               = 16128
CONST GUI_KEY_CODE_F6               = 16384
CONST GUI_KEY_CODE_F7               = 16640
CONST GUI_KEY_CODE_F8               = 16896
CONST GUI_KEY_CODE_F9               = 17152
CONST GUI_KEY_CODE_F10              = 17408
CONST GUI_KEY_CODE_F11              = 34048
CONST GUI_KEY_CODE_F12              = 34304
CONST GUI_KEY_CODE_ESC              = 27
CONST GUI_KEY_CODE_DEL              = 21248 
CONST GUI_KEY_CODE_END              = 20224 
CONST GUI_KEY_CODE_PGDN             = 20736
CONST GUI_KEY_CODE_INSERT           = 20992
CONST GUI_KEY_CODE_HOME             = 18176
CONST GUI_KEY_CODE_PGUP             = 18688
CONST GUI_KEY_CODE_UP               = 18432
CONST GUI_KEY_CODE_LEFT             = 19200
CONST GUI_KEY_CODE_DOWN             = 20480
CONST GUI_KEY_CODE_RIGHT            = 19712
CONST GUI_KEY_CODE_ENTER            = 13
CONST GUI_KEY_CODE_SPACE            = 32

TYPE GUI_dimension
!!if defined GUI_TEXT
  row AS _UNSIGNED LONG 
  col as _UNSIGNED LONG
!!else
  x AS _UNSIGNED LONG
  y AS _UNSIGNED LONG
!!endif
  wid AS _UNSIGNED LONG
  hei AS _UNSIGNED LONG
END TYPE

TYPE GUI_color
!!if defined GUI_TEXT
  f as _unsigned _byte
  b as _unsigned _byte
!!else
  a AS _UNSIGNED _BYTE
  r AS _UNSIGNED _BYTE
  g AS _UNSIGNED _BYTE
  b AS _UNSIGNED _BYTE
!!endif
END TYPE

''$include:'objects/std_objects.bi'
'$include:'events/std_events.bi'
'$include:'elements/std_elements.bi'

!!endif
