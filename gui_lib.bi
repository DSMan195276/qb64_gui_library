'GUI Library
'Copyright Matt Kilgore -- 2011/2013

'This program is free software, without any warranty of any kind.
'You are free to edit, copy, modify, and redistribute it under the terms
'of the Do What You Want Public License, Version 1, as published by Matt Kilgore
'See file COPYING that should have been included with this source.

CONST GUI_VER$ = ".85"

CONST GUI_DEBUG = -1 'Set to -1 to turn on debug mode

TYPE GUI_menu_item_type
  nam as MEM_string_type 'Displayed string for MENU choice
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
  selected AS INTEGER 'current
END TYPE

TYPE GUI_color_type 'Holds color info -- forground and background
  fr as _BYTE
  bk as _BYTE
END TYPE

'CONST values coresponding to a element type
CONST GUI_BOX = 1
CONST GUI_INPUT_BOX = 2
CONST GUI_TEXT_BOX = 3
CONST GUI_LIST_BOX = 4
CONST GUI_DROP_DOWN = 5
CONST GUI_CHECKBOX = 6
CONST GUI_MENU = 7
CONST GUI_BUTTON = 8
CONST GUI_RADIO_BUTTON = 9
CONST GUI_LABEL = 10

CONST GUI_FLAG_UPDATED = 1
CONST GUI_FLAG_SKIP = 2
CONST GUI_FLAG_SHADOW = 4
CONST GUI_FLAG_DIALOG = 8
CONST GUI_FLAG_HIDE = 16
CONST GUI_FLAG_SCROLL_V = 32
CONST GUI_FLAG_SCROLL_H = 64
CONST GUI_FLAG_SCROLL_IS_HELD_V = 128
CONST GUI_FLAG_SCROLL_IS_HELD_H = 256
'CONST GUI_FLAG_TEXT_IS_SELECTED = 512
CONST GUI_FLAG_DROP_FLAG = 1024
CONST GUI_FLAG_CHECKED = 2048
CONST GUI_FLAG_MENU_OPEN = 4096
CONST GUI_FLAG_MENU_ALT = 8192
CONST GUI_FLAG_MENU_CHOSEN = 16384
CONST GUI_FLAG_MENU_LAST_ON_RIGHT = 512

TYPE GUI_element_type
  nam AS MEM_string_type 'name of item

  element_type AS _BYTE
  '0 -- Nothing
  '1 -- Box                  -- Draws a plain box with nothing inside
  '2 -- Input-Box            -- Box is forced to 3 rows, single line input
  '3 -- text-box             -- Multi-line input
  '4 -- List-Box             -- Multiple lines -- Lists lines and allows one to be selected
  '5 -- Drop-down            -- Displays as one line, but when clicked on a box appears with multiple selecteable items
  '6 -- CheckBox             -- Displays a label along with an empty or filled Box, which can be toggled by clicking on it
  '7 -- Menu handler         -- Indicates this element is a menu (Menus are a bit more complex -- see documentation)
  '8 -- Button               -- Just a simple button
  '9 -- Radio button         -- Like a checkbox, but they can be linked together so that only one in a group is selectable at a time
  '10 - Label                -- Just plain text (Prints text at row1, col1). skip is set by default
  ' V -- not implemented just yet
  ' -- Combo Box

  row1 AS INTEGER 'location
  col1 AS INTEGER
  row2 AS INTEGER
  col2 AS INTEGER

  flags AS INTEGER '15 (0 to 15) bits flags (Will be expanded as needed as new flags are needed)
  'bit 0  -- updated since last draw
  'bit 1  -- skip
  'bit 2  -- shadow
  'bit 3  -- dialog
  'bit 4  -- hide
  'bit 5  -- scroll bar vert
  'bit 6  -- scroll bar hors
  'bit 7  -- scroll is held
  'bit 8  -- text is selected
  'bit 9  -- drop-down flag
  'bit 10 -- checked
  'bit 11 -- menu open
  'bit 12 -- menu chosen

  mcolor as GUI_color_type

  selcolor as GUI_color_type

  ' Just a number indicating the layering.
  ' Default layer is zero. If you need something to be ontop of something else, put it in a higher layer
  layer AS _BYTE

  text AS MEM_string_type 'text drawn/edited in a Input-Box
  text_position AS INTEGER 'position of the cursor in the input
  'text_offset AS INTEGER 'We display the string in the box starting at the text_offset character, to account for scrolling to the right
  text_sel_row1 AS INTEGER
  text_sel_row2 AS INTEGER
  text_sel_col1 AS INTEGER
  text_sel_col2 AS INTEGER

  scroll_color as GUI_color_type

  scroll_offset_vert AS INTEGER 'current scroll offset -- calculated in draw_gui function
  scroll_offset_hors AS INTEGER

  scroll_loc_hors AS INTEGER 'current location of scroll-bar
  scroll_loc_vert AS INTEGER

  scroll_max_hors AS INTEGER 'Max number of characters in a line -- If 0 then will be automatically calculated (Which is a bit slower)
  'The length variable is used in place of a "scroll_max_vert" variable

  length AS INTEGER ' Length of string array
  selected AS INTEGER 'selected line in list-box, drop-down, etc.
  selected_old AS INTEGER
  lines AS MEM_array_type ' Array to store strings for list-box, drop-down, etc.

  menu as _MEM ' Points to an actual array of menu_items

  menu_padding as INTEGER 'Spaces padded before start of menu
  menu_choice AS STRING * 5

  group as INTEGER 'group number for radio buttons

  cur_row AS INTEGER
  cur_col AS INTEGER

  'This does not corespond to the displayed number of lines, just the real max allocation length of lines
  max_lines AS _UNSIGNED INTEGER 'If 0 then the lines array will automatically be reallocated, else we won't go over max_lines

  'If this GUI is currently selected, then you should do a:
  'LOCATE cur_row, cur_col, 1
  'to locate the cursor
END TYPE

TYPE GUI_default_color_type 'holds colors
  mcolor as GUI_color_type
  selcolor as GUI_color_type
  scroll_color as GUI_color_type
END TYPE

'shared variables for mouse
COMMON SHARED GUI_MX AS INTEGER, GUI_MY AS INTEGER, GUI_BUT AS INTEGER, GUI_MSCROLL AS INTEGER, GUI_BUTFLAG AS INTEGER
COMMON SHARED GUI_CUR_ROW AS INTEGER, GUI_CUR_COL AS INTEGER, GUI_alt_flag AS INTEGER, GUI_ctl_flag AS INTEGER, GUI_shift_flag AS INTEGER
'default colors -- Values are set by GUI_init and are changable at any time
COMMON SHARED GUI_DEFAULT_COLOR_BOX as GUI_default_color_type, GUI_DEFAULT_COLOR_INPUT as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_COLOR_TEXT as GUI_default_color_type, GUI_DEFAULT_COLOR_LIST as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_COLOR_DROP as GUI_default_color_type, GUI_DEFAULT_COLOR_CHECKBOX as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_COLOR_MENU as GUI_default_color_type, GUI_DEFAULT_COLOR_BUTTON as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_COLOR_RADIO as GUI_default_color_type, GUI_DEFAULT_COLOR_LABEL as GUI_default_color_type

'Default colors for dialogs
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_BOX as GUI_default_color_type, GUI_DEFAULT_DIALOG_COLOR_INPUT as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_TEXT as GUI_default_color_type, GUI_DEFAULT_DIALOG_COLOR_LIST as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_DROP as GUI_default_color_type, GUI_DEFAULT_DIALOG_COLOR_CHECKBOX as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_MENU as GUI_default_color_type, GUI_DEFAULT_DIALOG_COLOR_BUTTON as GUI_default_color_type
COMMON SHARED GUI_DEFAULT_DIALOG_COLOR_RADIO as GUI_default_color_type, GUI_DEFAULT_DIALOG_COLOR_LABEL as GUI_default_color_type
COMMON SHARED GUI_MOUSE_QUEUE$

DIM SHARED GUI_alt_codes$(51) ' thanks to Galleon for alt-code stuff
