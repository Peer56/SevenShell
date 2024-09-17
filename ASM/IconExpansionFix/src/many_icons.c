#include "types.h"

extern fu16 IconSlot2Chr(int slot_num);
extern void RegisterDataMove(void const * src, void * dst, int size);

#define CHR_SIZE 0x20
#define VRAM ((void *) 0x06000000)

#define MAX_LOADED_ICONS 0x20

extern u16 * const ActiveIconUsageTable;
extern u8 const * const IconSheet;

fu16 NuggetIconChr(int icon);
void NuClearIcons(void);
void NuClearIcon(int icon);
int NuggetNewIconSlot(int icon);
int GetActiveIconSlot(int icon);

// replaces GetIconChr @ fe7us:08004DBC
fu16 NuggetIconChr(int icon)
{
    int slot, chr;

    slot = GetActiveIconSlot(icon);

    // Check if icon is already loaded
    if (slot != -1)
        return IconSlot2Chr(slot);

    // Register new icon
    slot = NuggetNewIconSlot(icon);
    chr = IconSlot2Chr(slot);

    // Register icon graphics
    RegisterDataMove(IconSheet + icon * CHR_SIZE * 4, VRAM + CHR_SIZE * chr, CHR_SIZE * 4);

    return chr;
}

// replaces ClearIcons @ fe7us:08004CF4
void NuClearIcons(void)
{
    for (unsigned int i = 0; i < MAX_LOADED_ICONS; i++)
        ActiveIconUsageTable[i] = UINT16_MAX;
}

// replaces ClearIcon @ fe7us:08004E78
void NuClearIcon(int icon)
{
    for (unsigned int i = 0; i < MAX_LOADED_ICONS; i++)
    {
        if (ActiveIconUsageTable[i] == icon)
        {
            ActiveIconUsageTable[i] = UINT16_MAX;
            break;
        }
    }
}

// replaces CountActiveIcons @ fe7us:08004D5C
int NuCountActiveIcons(void)
{
    int result = 0;

    for (unsigned int i = 0; i < MAX_LOADED_ICONS; i++)
    {
        if (ActiveIconUsageTable[i] != UINT16_MAX)
            result++;
    }

    return result;
}

// replaces GetNewIconSlot @ fe7us:08004D90
int NuggetNewIconSlot(int icon)
{
    for (unsigned int i = 0; i < MAX_LOADED_ICONS; i++)
    {
        if (ActiveIconUsageTable[i] == UINT16_MAX)
        {
            ActiveIconUsageTable[i] = icon;
            return i + 1;
        }
    }

    return -1;
}

int GetActiveIconSlot(int icon)
{
    for (unsigned int i = 0; i < MAX_LOADED_ICONS; i++)
    {
        if (ActiveIconUsageTable[i] == icon)
            return i + 1;
    }

    return -1;
}
