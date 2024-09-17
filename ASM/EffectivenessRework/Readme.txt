This hack allows easy definition of weapon effectiveness and an unlimited amount of Delphi Shield-like item,
by using three of the four bytes formerly devoted to an item's effectiveness pointer, and two of the unused bytes in
class data.

To install:
-IF YOU HAVE MOVED THE ITEM TABLE:
	-In "Effectiveness.txt" for the game you are hacking, between the two code blocks is a pointer to
	the default offset of the item data table. Change this to point to wherever you have placed this table.
-Use Event Assembler to assemble "Effectiveness.txt" to your FE7/FE8 ROM, as appropriate.

How it works:
-Bytes +0x10-0x11 in item data (where the first half of the Effectiveness pointer is by default) serve as a bitfield of class types for the item to be effective against;
these correspond to an identical bitfield in bytes +0x50-0x51 in class data (where "Unknown Pointer" is in the Nightmare Module; don't worry, it's safe to overwrite)
-If the attacker's weapon and the defender's class share at least one bit in their respective class type bitfields, the weapon is considered effective against the target.
-So, if you had Knights and other armored units use bit 0x1, you'd have Armorslayers, Rapiers, etc set bit 0x1 in their halfword.

-Making Delphi Shield-like items works the same way; any item with the Delphi Shield ability (0x40 in Ability Byte 2)
will instead use its class type bitfield as a list of effectivenesses to strip from the attacker's weapon - so if
the Flying type was bit 0x4, the Delphi shield should have bit 0x4 set in its class type bitfield. This would make
weapons unable to apply the Flying (0x4) effectiveness against the Delphi Shield's bearer, though he or she would still
be weak to other types (eg Wyvern Riders against Wyrmslayers)

The Variable Effectiveness Multiplier
This hack takes byte +0x12 in item data as the multiplier to weapon Mt if the weapon is effective against the target.

-Vennobennu