CG Editing Notes by Fire Blazer
http://www.feshrine.net

Each entry for a CG is made of 16 bytes. The first byte is either 01 or 00. This is a flag of sorts.
If it is 01 it does not use graphics directly but the graphics pointer points to what I think is more graphics... I haven't confirmed this. If it is 00, the graphics pointer points directly to the graphics. This is unconfirmed but I am very sure of this.

After that is the TSA pointer. If you have knowledge of TSA you can make custom TSA and use multiple palettes in order to make your CG more than 16 colors (at least 64 colors, possibly more). You can also leave it blank and manipulate your image around the existing TSA. However, if you plan on inserting a CG with 16 colors and leave the TSA pointer blank, your image will fuck up when it shows.

In order to fix this, point it to TSA that is meant for a 16 color palette. There is already TSA for this inside of a game at a certain offset. This offset is 0x850BE54 or
in a hex editor ("pointer form"), 54BE5008. This will optimize the TSA for a normal 16 color palette image but as you guessed, this means you can only have 16 colors in your image including the background.

Note that the pointer table for CG's is at 0xCED888 and I have NOT identified what each CG is-- however, if you load the data in a graphics editor like GBA Graphics Editor by Nintenlord, you should be able to recognize the CG.

Enjoy making your own CG's (and give me credit or thanks if this helps, please!)