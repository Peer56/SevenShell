@echo off

@rem defining buildfile config

set "source_rom=%~dp0FE7_clean.gba"

set "main_event=%~dp0Buildfile.event"

set "target_rom=%~dp0FE7_hack.gba"
set "target_ups=%~dp0FE7_hack.ups"

@rem defining tools

set "c2ea=%~dp0_Tools\c2ea\c2ea"
set "textprocess=%~dp0_Tools\textprocess\text-process-classic"
set "ups=%~dp0_Tools\ups\ups"
set "parsefile=%~dp0_EventAssembler\Tools\ParseFile.exe"
set "tmx2ea=%~dp0_Tools\tmx2ea\tmx2ea"

set "base_dir=%~dp0"

@rem do the actual building

echo Copying ROM

copy "%source_rom%" "%target_rom%"

  echo:
  echo Processing tables

  cd "%base_dir%Tables"
  echo: | ("%c2ea%" "%source_rom%" -installer "%base_dir%Tables/TableInstaller.event")

  echo:
  echo Processing text

  cd "%base_dir%Text"
  echo: | ("%textprocess%" TextBuildfile.event --parser-exe "%parsefile%" --installer "InstallTextData.event" --definitions "TextDefinitions.event")

  echo:
  echo Processing maps

  cd "%base_dir%Maps"
  echo: | ("%tmx2ea%" -s -O "MasterMapInstaller.event")

echo:
echo Assembling

cd "%base_dir%_EventAssembler"
ColorzCore A FE7 "-output:%target_rom%" "-input:%main_event%"

echo:
echo Generating patch

cd "%base_dir%"
"%ups%" diff -b "%source_rom%" -m "%target_rom%" -o "%target_ups%"

echo:
echo Done!

pause