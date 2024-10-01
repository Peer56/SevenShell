The alternate version is similar to the normal effectiveness hack - effective weapons and their classed are tied
together by a bitfield. This version differs in that item data retains the use of the vanilla effectiveness pointer - 
only the format of the effectiveness list itself (and class data) is different.

Make sure that the offset of the effectiveness list is word-aligned; that is, divisible by four. Otherwise problems
will arise.

The purpose of this difference is to allow a single weapon to have different effectiveness multipliers depending on
what class types it targets - for instance, a Cleave bow that triples Might against fliers, but only doubles it against
Knights - or a divine bow that doubles Might against dragons while retaining the triple bonus against fliers.

Instead of a list of class IDs, the effectiveness list must now be composed of four bytes per entry - two for the class
type bitfield -  little-endian, meaning that 0x0010 should be written as 10 00. The third byte is for the effectiveness
multiplier against those class types. The fourth is padding to make it 2-aligned. To end the effectiveness list, use two 00 bytes.
Should a weapon have multiple entries that apply to the defender (eg. 2x vs Dragons and 3x vs fliers against a Wyvern Lord),
the highest multiplier will be used.

So for a Horseslayer doing x3 effective damage, and where Mounted units use bit 0x2, the entry would look like:
0200 03 00 0000 - two bytes for the class type, one for the multipler, one byte for padding, and the list is terminated by 0000.

Delphi-shield type items use the normal effectiveness pointer as well; it should point to two bytes containing the bits
of all the class types it protects from effective damage.

Like the base version, to install use Event Assembler to assemble "FE7 Effectiveness Alternate" to your ROM. Remember to update
the item table pointer in this file if you've relocated your item data table!

-Vennobennu