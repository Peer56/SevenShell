pal2EA v2.2 input example

-if no input file is detected you will be prompted for one at the start of the program

Explanation

the format for this is a # line which marks the start of an entry and holds the informationon what to do with the palette
followed by the palettes in hexadecimal. You should be able to paste the palette hex from ferecolor or any hex editor.
The palettes go and separate lines and are ordered Player, Enemy, NPC, and P4 Arena; with a P1 Arena at the end for character palettes

You can also use auto to have the palette autofilled with the autofill palette, which is the first palette by default

After running Pal2EA #include "Palette Setup.event" in your buildfile to insert all your palettes
	
Theses are the commands that go into the # line
	char{pal_id}
		insert palette at the entry pal_id in the character palette table
	
	gen{anim_id}
		insert a generic palette for a battle sprite animation
		you can set the same generic palette to multiple animations by doing gen{id1, id2, id3, ...}
	
	"Label"
		name of label for the palette that will be used in EA output
		If a label is not found a basic one will be generated automatically

	set{char_id, palnum, class_id} set{char_id,palnum}
		insertion information; assigns the palette to a character
		for character palettes only; class_id is only necessary in FE8
		
		palnum
			if FE8, use 0x0-0x6 for the 7 palettes a character can have
			if FE6/FE7, use U for the unpromoted palette and P for the promoted palette

	[nc]
		skip autofilll and compression
		not fully supported yet
	
	auto{palette}
		change which palette is used for autofill
		this how the palettes are numbered for this:
		
		0   player palette
		1   enemy palette
		2   NPC palette
		3   Arena Team 4
		4   Arena Team 1
		
		the player palette will be used for autofill by default
		
	at{offset}
		insert the palette at the given offset;

	//this is a comment
		This is single line comment; pal2EAwill ignore everything from \\ to newline
		Multi-line comments may be implemented in a future update

examples

//the normal way
# char{palette_id} "Label" set{char_id, palette number, class_id}
   // use this to make single-line comments
   player palette
   enemy palette
   NPC palette
   Arena Team 4
   Arena Team 1

//the lazy way
# char{palette_id} "Label" set{char_id, palette number, class_id}
	player palette
	//pal2ea will autofill the rest for you
	
# char{0x6D} "Eirika_Mage" set{0x1, 0x1, 0x26} auto{1}

	//this is a comment
	auto //autofill this one with the enemy palette
	5553FF7FFF6B1F4B2E19707F0C7BE25DFF1B9E1A9401182A9C19D80C6F0CA514 
	5553FF7FFF6B1F4B2E19707F0C7BE25DFF1B9E1A9401182A8C1B060FE30DA514 
	5553FF7FFF6B1F4B2E19707F0C7BE25DFF1B9E1A9401182A9971D5606C3CA514 
	5553FF7FFF6B1F4B2E19707F0C7BE25DFF1B9E1A9401182A8671C360633CA514
	
# gen{0x6C} "MageF"
//female mage generic palette, this line is a comment
5553FF7FFF6B1F4B2E198C5308430432187B5262293D392AA07A8055E03CA514 
5553FF7FFF6B1F4B2E199C5118419030187B5262293D392A3E01D5008F00A514 
5553FF7FFF6B1F4B2E19943310230C12187B5262293D392AC6330327E019A514 
5553FF7FFF6B1F4B2E19947110618C40187B5262293D392A3E3DD8306F24A514

//set the new recruit generic palette to both the lance and disarmed animations
# gen{0x96,0x97} "Recruit Recolor"
	5553FF7FFF6B1F4B2E197063AA4AE431 182AE5798461C130757B8B626439A514 
	5553FF7FFF6B1F4B2E195B4A722DCC18 182AFE14D8101004787B8E5E6739A514 
	5553FF7FFF6B1F4B2E197243AC2AE611 182AC53F04338119757B8B626439A514 
	5553FF7FFF6B1F4B2E195B6E9555CF3C 182A3879D2606C30757B8B626439A514
	
//example using EA's standard definitions
#char{0x3D} "Hero Franz" set{Franz, 0x3, Hero}
	5553FF7FFF6B1F4B2E1DDE1BD716D21D196B52568C41772BB22ACC11372EA514	

//FE7/FE6 Example
//use U in set{} to assign this as the unpromoted palette
#char{0x1} "Lyn Lord" set{Lyn,U}
	5553FF7FFF6B3F3F711D4933641A8415567B6F5ECA499E1A927FA87E4369A514
//use P in set{} to assign this as the promoted palette
#char{0x1B} "Lyn Blade Lord" set{Lyn,P}
	5553FF7FFF6B3F3F711D4933641AA311997F12770B569E1A496F69628255A514	
Changelog
v2.0
	all palettes are read from one file
	
v2.1
	fixed mistake in FE7/FE6 macros in definitions file
	added auto{} to change autofill palette
v2.2
	slightly altered definitions file
	added U and P shortcuts for set{}
	implemented at{} so you can insert at a fixed offset
	converted all () to {} for the sake of consistency
	slightly improved error handling
v2.3
	improved syntax error handling
	fixed problem that caused the program to crash if symbols were in the label name
	added system for showing errors and warnings if there are any problems detected in the input file
