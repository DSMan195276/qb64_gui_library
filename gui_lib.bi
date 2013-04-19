'GUI Library
'Copyright Matt Kilgore -- 2011/2013

'This program is free software, without any warranty of any kind.
'You are free to edit, copy, modify, and redistribute it under the terms
'of the Do What You Want Public License, Version 1, as published by Matt Kilgore
'See file COPYING that should have been included with this source.

CONST GUI_VER$ = ".96"

CONST GUI_DEBUG = 0 'Set to -1 to turn on debug mode

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

'CONST values coresponding to a element type
CONST GUI_BOX           = 1
CONST GUI_INPUT_BOX     = 2
CONST GUI_TEXT_BOX      = 3
CONST GUI_LIST_BOX      = 4
CONST GUI_DROP_DOWN     = 5
CONST GUI_CHECKBOX      = 6
CONST GUI_MENU          = 7
CONST GUI_BUTTON        = 8
CONST GUI_RADIO_BUTTON  = 9
CONST GUI_LABEL         = 10
'CONST GUI_COMBO_BOX     = 11

'Flags for GUI_element_type .flags
CONST GUI_FLAG_UPDATED            = &H00000001
CONST GUI_FLAG_SKIP               = &H00000002
CONST GUI_FLAG_SHADOW             = &H00000004
CONST GUI_FLAG_DIALOG             = &H00000008
CONST GUI_FLAG_HIDE               = &H00000010
CONST GUI_FLAG_SCROLL_V           = &H00000020
CONST GUI_FLAG_SCROLL_H           = &H00000040
CONST GUI_FLAG_SCROLL_IS_HELD_V   = &H00000080
CONST GUI_FLAG_SCROLL_IS_HELD_H   = &H00000100
CONST GUI_FLAG_DROP_FLAG          = &H00000200
CONST GUI_FLAG_CHECKED            = &H00000400
CONST GUI_FLAG_MENU_OPEN          = &H00000800
CONST GUI_FLAG_MENU_ALT           = &H00001000
CONST GUI_FLAG_MENU_CHOSEN        = &H00002000
CONST GUI_FLAG_MENU_LAST_ON_RIGHT = &H00004000

'For GUI_HAND -- Determines whether it should be treated as left or right handed
CONST GUI_HAND_RIGHT              = 1
CONST GUI_HAND_LEFT               = 2

'Byte 1
CONST GUI_EVENT_MOUSE             = 1
CONST GUI_EVENT_KEY               = 2

'Specefic element event numbers
CONST GUI_EVENT_ELEMENT_BOX          = &H0100
CONST GUI_EVENT_ELEMENT_INPUT_BOX    = &H0200
CONST GUI_EVENT_ELEMENT_TEXT_BOX     = &H0300
CONST GUI_EVENT_ELEMENT_LIST_BOX     = &H0400
CONST GUI_EVENT_ELEMENT_DROP_DOWN    = &H0500
CONST GUI_EVENT_ELEMENT_CHECKBOX     = &H0600
CONST GUI_EVENT_ELEMENT_MENU         = &H0700
CONST GUI_EVENT_ELEMENT_BASIC        = &H0800
'CONST GUI_EVENT_ELEMENT_BUTTON       = &H0800
CONST GUI_EVENT_ELEMENT_RADIO_BUTTON = &H0900
'CONST GUI_EVENT_ELEMENT_LABEL        = &H0A00

'Event_mouse_type flags
CONST GUI_EVENT_MOUSE_DRAG                = &H00000001
CONST GUI_EVENT_MOUSE_LEFT_DOWN           = &H00000002
CONST GUI_EVENT_MOUSE_LEFT_UP             = &H00000004
CONST GUI_EVENT_MOUSE_LEFT_CLICK          = &H00000008
CONST GUI_EVENT_MOUSE_RIGHT_DOWN          = &H00000010
CONST GUI_EVENT_MOUSE_RIGHT_UP            = &H00000020
CONST GUI_EVENT_MOUSE_RIGHT_CLICK         = &H00000040
CONST GUI_EVENT_MOUSE_MIDDLE_DOWN         = &H00000080
CONST GUI_EVENT_MOUSE_MIDDLE_UP           = &H00000100
CONST GUI_EVENT_MOUSE_MIDDLE_CLICK        = &H00000200
CONST GUI_EVENT_MOUSE_SCROLL_UP           = &H00000400
CONST GUI_EVENT_MOUSE_SCROLL_DOWN         = &H00000800
CONST GUI_EVENT_MOUSE_MOVEMENT            = &H00001000

'Event_key_type flags
CONST GUI_EVENT_KEY_PRESSED               = &H00000001
CONST GUI_EVENT_KEY_RELEASED              = &H00000002
CONST GUI_EVENT_KEY_TYPED                 = &H00000004
CONST GUI_EVENT_KEY_LEFT_ALT_DOWN         = &H00000008
CONST GUI_EVENT_KEY_RIGHT_ALT_DOWN        = &H00000010
CONST GUI_EVENT_KEY_LEFT_CTL_DOWN         = &H00000020
CONST GUI_EVENT_KEY_RIGHT_CTL_DOWN        = &H00000040
CONST GUI_EVENT_KEY_LEFT_SHIFT_DOWN       = &H00000080
CONST GUI_EVENT_KEY_RIGHT_SHIFT_DOWN      = &H00000100
CONST GUI_EVENT_KEY_LEFT_META_DOWN        = &H00000200
CONST GUI_EVENT_KEY_RIGHT_META_DOWN       = &H00000400
CONST GUI_EVENT_KEY_LEFT_APPLE_DOWN       = &H00000800
CONST GUI_EVENT_KEY_RIGHT_APPLE_DOWN      = &H00001000
CONST GUI_EVENT_KEY_ALT_GR_DOWN           = &H00002000
CONST GUI_EVENT_KEY_CAPS_LOCK             = &H00004080

'Event label flags
CONST GUI_EVENT_ELEMENT_LABEL_PRESSED     = &H00000001
CONST GUI_EVENT_ELEMENT_LABEL_CLICKED     = &H00000002
CONST GUI_EVENT_ELEMENT_LABEL_KEY_DOWN    = &H00000004

'Event button flags
CONST GUI_EVENT_ELEMENT_BUTTON_PRESSED    = &H00000001
CONST GUI_EVENT_ELEMENT_BUTTON_CLICKED    = &H00000002
CONST GUI_EVENT_ELEMENT_BUTTON_KEY_DOWN   = &H00000004

'List box event flags
CONST GUI_EVENT_ELEMENT_LIST_BOX_PRESSED     = &H00000001
CONST GUI_EVENT_ELEMENT_LIST_BOX_CLICKED     = &H00000002
CONST GUI_EVENT_ELEMENT_LIST_BOX_KEY_DOWN    = &H00000004
CONST GUI_EVENT_ELEMENT_LIST_BOX_SEL_CHANGED = &H00000008

'Scroll bar
CONST GUI_ELEMENT_SCROLL_BAR_FLAG_SCROLL_V = &H00000001
CONST GUI_ELEMENT_SCROLL_BAR_FLAG_SCROLL_H = &H00000002
'CONST GUI_ELEMENT_SCROLL_BAR_FLAG_SCROLL_IS_HELD = &H00000004

'GUI_DRAG_FLAG flags
CONST GUI_MOUSE_DRAG_LEFT   = 1
CONST GUI_MOUSE_DRAG_RIGHT  = 2
CONST GUI_MOUSE_DRAG_MIDDLE = 3

TYPE GUI_menu_item
  nam as MEM_string 'Displayed string for MENU choice
  ident as STRING * 5 'identifer string
  'The ident string will be returned in menu_choice
  'when a choice is chosen. Use the identifier to match
  'what menu choice they did. More reliable then mapping
  'choices to exact locations in the menu -- they change when you edit the menu

  'support for modifiers will be added at a later date, sorry.
  'modifier as STRING * 2 'INKEY$ return
  has_sub AS _BYTE 'If -1 then sub_menu is set
  sub_menu as _MEM 'Points to an array of GUI_menu_item_type
  sub_menu_length AS INTEGER
  sub_menu_open as _BYTE
  key_combo as MEM_string
  selected AS INTEGER 'current
END TYPE

TYPE GUI_color 'Holds color info -- forground and background
  fr as _UNSIGNED _BYTE
  bk as _UNSIGNED _BYTE
END TYPE

'TYPE GUI_location
'  row as _UNSIGNED INTEGER
'  col as _UNSIGNED INTEGER
'END TYPE

'TYPE GUI_element_scroll_bar
'  top_left as GUI_location
'  bar_length as _UNSIGNED INTEGER
'  scroll_location as _UNSIGNED INTEGER
'  
'  'Number of items to scroll through
'  'These _MEM's should point to LONG's.
'  itemsL as _MEM
'  first_itemL as _MEM 'The current first_item according to the scroll bar
'  flags as _UNSIGNED INTEGER
'END TYPE

'TYPE GUI_element_frame
'  top_left as GUI_location
'  bottom_right as GUI_location
'  flags as _UNSIGNED INTEGER
'  'Points to a MEM_String
'  titleMS as _MEM 
'END TYPE


'TYPE GUI_element_text_area
'  top_left as GUI_location
'  bottom_right as GUI_location
'  
'  box_nam as MEM_string
'  
'  vert_scroll as GUI_element_scroll_bar
'  hors_scroll as GUI_element_scroll_bar
'  
'  cur_row as _UNSIGNED INTEGER
'  cur_col as _UNSIGNED INTEGER
'  
'  line_count as _UNSIGNED INTEGER
'  
'  text as MEM_array
'  max_lines as _UNSIGNED INTEGER
'  flags as _UNSIGNED LONG
'END TYPE

TYPE GUI_element_colors 'holds colors
  mcolor as GUI_color
  selcolor as GUI_color
  scroll_color as GUI_color
END TYPE

TYPE GUI_element
  nam AS MEM_string 'name of item
  element_type AS _BYTE
  row1 AS INTEGER 'location
  col1 AS INTEGER
  row2 AS INTEGER
  col2 AS INTEGER
  flags AS _UNSIGNED LONG 'Coresponds to the above flags
  c as GUI_element_colors
  layer AS _BYTE
  old_layer as _BYTE
  text AS MEM_string 'text drawn/edited in a Input-Box
  text_position AS INTEGER 'position of the cursor in the input
  text_sel_row1 AS INTEGER
  text_sel_row2 AS INTEGER
  text_sel_col1 AS INTEGER
  text_sel_col2 AS INTEGER
  
  scroll_offset_vert AS INTEGER 'current scroll offset -- calculated in draw_gui function
  scroll_offset_hors AS INTEGER
  
  scroll_loc_hors AS INTEGER 'current location of scroll-bar
  scroll_loc_vert AS INTEGER
  scroll_max_hors AS INTEGER 'Max number of characters in a line -- If 0 then will be automatically calculated (Which is a bit slower)
  length AS INTEGER ' Length of string array
  selected AS INTEGER 'selected line in list-box, drop-down, etc.
  selected_old AS INTEGER
  lines AS MEM_array ' Array to store strings for list-box, drop-down, etc.
  menu as _MEM ' Points to an actual array of menu_items
  menu_padding as INTEGER 'Spaces padded before start of menu
  menu_choice AS STRING * 5
  
  menu_depth AS INTEGER
  menu_sel AS INTEGER
  
  group as INTEGER 'group number for radio buttons
  cur_row AS INTEGER
  cur_col AS INTEGER
  'This does not corespond to the displayed number of lines, just the real max allocation length of lines
  max_lines AS _UNSIGNED INTEGER 'If 0 then the lines array will automatically be reallocated, else we won't go over max_lines
  'parent AS _MEM
END TYPE

TYPE GUI_mouse_state '12
  MROW as INTEGER
  MCOL AS INTEGER
  MRIGHT AS INTEGER
  MLEFT AS INTEGER
  MMIDDLE AS INTEGER
  MSCROLL AS INTEGER
END TYPE

TYPE GUI_event_generic
  event_type as _UNSIGNED LONG
  mem as _MEM
  allocated as _UNSIGNED _BYTE
END TYPE

TYPE GUI_event_key '6
  key_code AS _UNSIGNED LONG  
  'gui_element AS _UNSIGNED LONG
  flags AS _UNSIGNED INTEGER
END TYPE

TYPE GUI_event_mouse '28
  'gui_element AS _UNSIGNED LONG
  m as GUI_mouse_state
  row2 AS _UNSIGNED LONG 'Used if a drag occured
  col2 AS _UNSIGNED LONG
  flags as INTEGER
  count as INTEGER
END TYPE

'Represents an event that happened to a generic element
'It's worth nothing this is just here because many element only need a very
'Simple return like this one
TYPE GUI_event_element_basic '48
  m_event as GUI_event_mouse 'Mouse event that happened on the label
  k_event as GUI_event_key 'Key event that happened on the label
  flags as _BYTE
  e_type as _BYTE
  gui_element AS _UNSIGNED LONG
END TYPE

'For the event stack
TYPE GUI_event_stack_link
  g as GUI_event_generic
  flags as _UNSIGNED _BYTE
  'e_next AS _MEM 'Pointer to next event
  e_prev as _MEM
END TYPE

'shared variables for mouse, keyboard, and screen type of things
COMMON SHARED GUI_MOUSE_LAST_STATE   as GUI_mouse_state, GUI_MOVEMENT_FLAG as INTEGER
COMMON SHARED GUI_PERSISTANT_MOUSE_STATE   as GUI_mouse_state
COMMON SHARED GUI_MROW               AS INTEGER, GUI_MCOL               AS INTEGER, GUI_BUT                AS INTEGER
COMMON SHARED GUI_MLEFT              AS INTEGER, GUI_MRIGHT             AS INTEGER, GUI_MMIDDLE            AS INTEGER
COMMON SHARED GUI_HAND               AS INTEGER
COMMON SHARED GUI_DRAG_FLAG          AS INTEGER, GUI_DRAG_ROW           AS INTEGER, GUI_DRAG_COL           AS INTEGER
COMMON SHARED GUI_MSCROLL            AS INTEGER, GUI_BUTFLAG            AS INTEGER
COMMON SHARED GUI_CUR_ROW            AS INTEGER, GUI_CUR_COL            AS INTEGER

COMMON SHARED GUI_RALT_FLAG          AS INTEGER, GUI_RAPPLE_FLAG        AS INTEGER
COMMON SHARED GUI_RCTRL_FLAG         AS INTEGER, GUI_RSHIFT_FLAG        AS INTEGER, GUI_RMETA_FLAG         AS INTEGER
COMMON SHARED GUI_LALT_FLAG          AS INTEGER, GUI_LAPPLE_FLAG        AS INTEGER
COMMON SHARED GUI_LCTRL_FLAG         AS INTEGER, GUI_LSHIFT_FLAG        AS INTEGER, GUI_LMETA_FLAG
COMMON SHARED GUI_CAPS_LOCK_FLAG     AS INTEGER, GUI_ALT_GR_FLAG        AS INTEGER

COMMON SHARED GUI_DRAG_TIMER         AS DOUBLE
COMMON SHARED GUI_RIGHT_CLICK_TIMER  AS DOUBLE,  GUI_LEFT_CLICK_TIMER   AS DOUBLE,  GUI_MIDDLE_CLICK_TIMER AS DOUBLE
COMMON SHARED GUI_RIGHT_CLICK_COUNT  AS INTEGER, GUI_LEFT_CLICK_COUNT   AS INTEGER, GUI_MIDDLE_CLICK_COUNT AS INTEGER
COMMON SHARED GUI_last_mouse_event   AS GUI_event_mouse

COMMON SHARED GUI_EVENT_STACK_START as _MEM, GUI_EVENT_STACK_END as _MEM, GUI_EVENT_STACK_LENGTH AS LONG

'Delay values for clicking and keypresses
'When dragging the mouse to select text, if dragging requires scrolling to prevent from scrolling instantly we will only scroll another character after this time in seconds has happened
COMMON SHARED GUI_DRAG_SELECTION_DELAY 
COMMON SHARED GUI_DOUBLE_CLICK_DELAY 'Delay two clicks have to be inbetween to be considered a double click

'default colors -- Values are set by GUI_init and are changable at any time
COMMON SHARED GUI_DEFAULT_COLOR_BOX   as GUI_element_colors, GUI_DEFAULT_COLOR_INPUT    as GUI_element_colors
COMMON SHARED GUI_DEFAULT_COLOR_TEXT  as GUI_element_colors, GUI_DEFAULT_COLOR_LIST     as GUI_element_colors
COMMON SHARED GUI_DEFAULT_COLOR_DROP  as GUI_element_colors, GUI_DEFAULT_COLOR_CHECKBOX as GUI_element_colors
COMMON SHARED GUI_DEFAULT_COLOR_MENU  as GUI_element_colors, GUI_DEFAULT_COLOR_BUTTON   as GUI_element_colors
COMMON SHARED GUI_DEFAULT_COLOR_RADIO as GUI_element_colors, GUI_DEFAULT_COLOR_LABEL    as GUI_element_colors

'Default colors for dialogs
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_BOX   as GUI_element_colors, GUI_DEFAULT_DIALOG_COLOR_INPUT    as GUI_element_colors
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_TEXT  as GUI_element_colors, GUI_DEFAULT_DIALOG_COLOR_LIST     as GUI_element_colors
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_DROP  as GUI_element_colors, GUI_DEFAULT_DIALOG_COLOR_CHECKBOX as GUI_element_colors
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_MENU  as GUI_element_colors, GUI_DEFAULT_DIALOG_COLOR_BUTTON   as GUI_element_colors
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_RADIO as GUI_element_colors, GUI_DEFAULT_DIALOG_COLOR_LABEL    as GUI_element_colors
