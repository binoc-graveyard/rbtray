# Microsoft Developer Studio Generated NMAKE File, Based on RBHook.dsp
!IF "$(CFG)" == ""
CFG=RBHook - Win32 Debug
!MESSAGE No configuration specified. Defaulting to RBHook - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "RBHook - Win32 Release" && "$(CFG)" != "RBHook - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "RBHook.mak" CFG="RBHook - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "RBHook - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "RBHook - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe 
MTL=midl.exe 
RSC=rc.exe 

!IF  "$(CFG)" == "RBHook - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\RBHook.dll"


CLEAN :
	-@erase "$(INTDIR)\rbhook.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\RBHook.dll"
	-@erase "$(OUTDIR)\RBHook.exp"
	-@erase "$(OUTDIR)\RBHook.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ= /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RBHOOK_EXPORTS" /Fp"$(INTDIR)\RBHook.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ= /D "NDEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS= /o"$(OUTDIR)\RBHook.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib  /dll /incremental:no /pdb:"$(OUTDIR)\RBHook.pdb" /machine:I386 /out:"$(OUTDIR)\RBHook.dll" /implib:"$(OUTDIR)\RBHook.lib" 
LINK32_OBJS= \
	"$(INTDIR)\rbhook.obj"

"$(OUTDIR)\RBHook.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "RBHook - Win32 Debug"

OUTDIR=.\RBHook___Win32_Debug
INTDIR=.\RBHook___Win32_Debug
# Begin Custom Macros
OutDir=.\RBHook___Win32_Debug
# End Custom Macros

ALL : "$(OUTDIR)\RBHook.dll"


CLEAN :
	-@erase "$(INTDIR)\rbhook.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\RBHook.dll"
	-@erase "$(OUTDIR)\RBHook.exp"
	-@erase "$(OUTDIR)\RBHook.ilk"
	-@erase "$(OUTDIR)\RBHook.lib"
	-@erase "$(OUTDIR)\RBHook.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ= /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "RBHOOK_EXPORTS" /Fp"$(INTDIR)\RBHook.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ  /c 
MTL_PROJ= /D "_DEBUG" /mktyplib203 /win32 
BSC32=bscmake.exe
BSC32_FLAGS= /o"$(OUTDIR)\RBHook.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib  /dll /incremental:yes /pdb:"$(OUTDIR)\RBHook.pdb" /debug /machine:I386 /out:"$(OUTDIR)\RBHook.dll" /implib:"$(OUTDIR)\RBHook.lib" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\rbhook.obj"

"$(OUTDIR)\RBHook.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("RBHook.dep")
!INCLUDE "RBHook.dep"
!ELSE 
!MESSAGE Warning: cannot find "RBHook.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "RBHook - Win32 Release" || "$(CFG)" == "RBHook - Win32 Debug"
SOURCE=.\rbhook.c

"$(INTDIR)\rbhook.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

