# PicConv_XWcF14

Convert a png to an Atari 8-bit graphics screen and make an Atari executable program that loads and shows the screen.

---

**Original Picture:**

[![OriginalPic](https://github.com/kenjennings/PicConv_XWcF14/blob/main/XWcF14.png)](#features)

**Atari800 Emulator Displaying The Graphics:**

[![AtariPic](https://github.com/kenjennings/PicConv_XWcF14/blob/main/XWcF14_ATARI800_640.png)](#features)

---

**Lame Programs And Stuff**

Presented more or less in order of use...

XWcF14.png -- Original graphics file.

XWcF14_160x96.png -- The graphics file resized to 160x96 to fit the Atari Graphics Mode 7 screen resolution.   This is what was run through GIMP to produce the C Array of pixel data.

XWcF14.c -- Lame C program that builds into the XWcF14 Linux program to convert the GIMP-created C array into the ASCII version of text letters representing pixels.

XWcF14 -- Lame Linux executable program that outputs the GIMP-created C array as a more manageable ASCII file of letters representing pixel values.

XWcF14.asc -- ASCII text version of the screen graphics.  This is output by the XWcF14 Linux executable program.

XWcF14.BXL -- Lame OSS BASIC XL program (SAVE'd, tokenized version) that reads the text representation of pixels output from the Lame XWcF14 program, plots the data in graphics mode 7, and then creates the binary executable file XWcF14.xex that can be run from Atari DOS (48K mem or more)

- XWcF14.LXL -- LIST'd version, in ATASCII format, of the Lame XWcF14.BXL BASIC XL program 

- XWcF14.TXL -- LIST'd version, in regular ASCII (normal line feeds) of the Lame XWcF14.BXL BASIC XL program.

XWcF14.xex -- Lame Atari executable program that loads the display list, screen memory, color registers, and then waits.  This is created by the Lame XWcF14.BXL BASIC XL program.

XWcF14_ATARI800_640.png -- Screen grab from the Atari800 emulator running the Lame XWcF14.xex program.

---

**Atari800 Emulator Displaying The Image With Red Modification Added Via DLI**

[![AtariPic](https://github.com/kenjennings/PicConv_XWcF14/blob/main/XWcF14_redmod.png)](#features)

Added a Display List Interrupt to change two color registers to red values.

In order to make this work a tree on the right had to be moved up a little and the little house on the left had to be moved down so that the DLI does not occur in the middle of these objects.

Additionally, I revisited the image acquisition, conversion and executable creation to be easier (for me) to repeat.  

The BASIC XL program does not create the Atari executable to load and present the graphics.  There were too many new things to add, and forcing bytewise output of an Atari executable from BASIC was just going become too tedious.   Instead, the BASIC XL program outputs the graphics data as assembly language .BYTE statements.   

The loading and presentation program is a real assembly language program and when it is assembled it includes the assembly language file of graphics data.  

I also reorganized the code to behave a little bit better by shuttting of screen DMA at the beginning, so the Display List and graphics loading into the memeory where the current Display List is running does not not cause any glitches and potentially crash the system.

---

**Mo' Lame Programs And Stuff**

Presented more or less in order of use...

image.c  -- The graphics file output by GIMP as a C array of pixel data.   This is #included by the rgb2ascii executable which converts the pixel color array data to ASCII characters representing pixels.

rgb2ascii.c -- Lame C program that builds into the rgb2ascii Linux program to convert the GIMP-created C array into the ASCII version of text letters representing pixels.

rgb2ascii -- Lame Linux executable program that outputs the GIMP-created C array as a more manageable ASCII file of letters representing pixel values.

image.asc -- ASCII text version of the screen graphics.  This is output by the rgb2ascii Linux executable program and read by the RGB2ASCII.BXL program to convert this to Atari graphics.

RGB2ASCII.BXL -- Lame OSS BASIC XL program (SAVE'd, tokenized version) that reads the text representation of pixels output from the Lame rgb2ascii program (the image.asc file), plots the data in graphics mode 7, and then outputs the Display List and screen data as assembly language .BYTE statements.

- RGB2ASCII.LXL -- LIST'd version, in ATASCII format, of the Lame RGB2ASCII.BXL BASIC XL program 

- RGB2ASCII.TXL -- LIST'd version, in regular ASCII (normal line feeds) of the Lame RGB2ASCII.BXL BASIC XL program.

picload.asm -- Atari assembly language program (assemble with MADS) that includes the image.asm data output by the RGB2ASCII.BXL program resulting in an executable program that presents the graphics image.

picload.xex -- Lame Atari executable program that loads the display list, screen memory, color registers, and then waits.  This is created by assembling the Lame picload.asm program.

XWcF14_redmod.png -- Screen grab from the Atari800 emulator running the Lame picload.xex program.

---
