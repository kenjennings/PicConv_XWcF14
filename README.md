# PicConv_XWcF14

Convert a png to an Atari 8-bit graphics screen and make an Atari executable program that loads and shows the screen.

---

**Original Picture:**

[![OriginalPic](https://github.com/kenjennings/PicConv_XWcF14/blob/main/XWcF14.png)](#features)

**Atari800 emulator displaying the graphics:**

[![AtariPic](https://github.com/kenjennings/PicConv_XWcF14/blob/main/XWcF14_ATARI800_640.png)](#features)

---

**Lame Programs and Stuff**

XWcF14.png -- Original graphics file.

XWcF14_160x96.png -- The graphics file resized to 160x96 to fit the Atari Graphics Mode 7 screen resolution.   This is what was run through GIMP to produce the C Array of pixel data.

XWcF14.c -- Lame C program that builds into the XWcF14 Linux program to convert the GIMP-created C array into the ASCII version of text letters representing pixels.

XWcF14 -- Lame Linux executable program that outputs the GIMP-created C array as a more manageable ASCII file of letters representing pixel values.

XWcF14.asc -- ASCII text version of the screen graphics.  This is output by the XWcF14 Linux executable program.

XWcF14.BXL -- Lame OSS BASIC XL program (SAVE'd, tokenized version) that reads the text representation of pixels output from the Lame XWcF14 program, plots the data in graphics mode 7, and then creates the binary executable file XWcF14.xex that can be run from Atari DOS (48K mem or more)

XWcF14.LXL -- LIST'd version, in ATASCII format, of the Lame XWcF14.BXL BASIC XL program 

XWcF14.TXL -- LIST'd version, in regular ASCII (normal line feeds) of the Lame XWcF14.BXL BASIC XL program.

XWcF14.xex -- Lame Atari executable program that loads the display list, screen memory, color registers, and then waits.  This is created by the Lame XWcF14.BXL BASIC XL program.

XWcF14_ATARI800_640.png -- Screen grab from the Atari800 emulator running the Lame XWcF14.xex program.

---
