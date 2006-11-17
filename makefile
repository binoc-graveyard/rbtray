# Microsoft Developer Studio Generated NMAKE File, Based on RBTray.dsp
!IF "$(CFG)" == ""
CFG=RBTray - Win32 Release
!MESSAGE No configuration specified. Defaulting to RBTray - Win32 Release
!ENDIF 

!IF "$(CFG)" != "RBTray - Win32 Release" && "$(CFG)" != "RBTray - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "RBTray.mak" CFG="RBTray - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "RBTray - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "RBTray - Win32 Debug" (based on "Win32 (x86) Application")
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
MAKEFLAGS=


!IF  "$(CFG)" == "RBTray - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\RBTray.exe"

!ELSE 

ALL : "RBHook - Win32 Release" "$(OUTDIR)\RBTray.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"RBHook - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\rbtray.obj"
	-@erase "$(INTDIR)\rbtray.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\RBTray.exe"

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Fp"$(INTDIR)\RBTray.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/D "NDEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x419 /fo"$(INTDIR)\rbtray.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/o"$(OUTDIR)\RBTray.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\RBTray.pdb" /machine:I386 /out:"$(OUTDIR)\RBTray.exe" 
LINK32_OBJS= \
	"$(INTDIR)\rbtray.obj" \
	"$(INTDIR)\rbtray.res" \
	"$(OUTDIR)\RBHook.lib"

"$(OUTDIR)\RBTray.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
	$(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "RBTray - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\RBTray.exe"

!ELSE 

ALL : "RBHook - Win32 Debug" "$(OUTDIR)\RBTray.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"RBHook - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\rbtray.obj"
	-@erase "$(INTDIR)\rbtray.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\RBTray.exe"
	-@erase "$(OUTDIR)\RBTray.ilk"
	-@erase "$(OUTDIR)\RBTray.pdb"

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /Fp"$(INTDIR)\RBTray.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 
MTL_PROJ=/D "_DEBUG" /mktyplib203 /win32 
RSC_PROJ=/l 0x419 /fo"$(INTDIR)\rbtray.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/o"$(OUTDIR)\RBTray.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\RBTray.pdb" /debug /machine:I386 /out:"$(OUTDIR)\RBTray.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\rbtray.obj" \
	"$(INTDIR)\rbtray.res" \
	".\RBHook___Win32_Debug\RBHook.lib"

"$(OUTDIR)\RBTray.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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
!IF EXISTS("RBTray.dep")
!INCLUDE "RBTray.dep"
!ELSE 
!MESSAGE Warning: cannot find "RBTray.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "RBTray - Win32 Release" || "$(CFG)" == "RBTray - Win32 Debug"

!IF  "$(CFG)" == "RBTray - Win32 Release"

"RBHook - Win32 Release" : 
	cd "."
	$(MAKE) /$(MAKEFLAGS) /F .\RBHook.mak CFG="RBHook - Win32 Release" 
	cd "."

"RBHook - Win32 ReleaseCLEAN" : 
	cd "."
	$(MAKE) /$(MAKEFLAGS) /F .\RBHook.mak CFG="RBHook - Win32 Release" RECURSE=1 CLEAN 
	cd "."

!ELSEIF  "$(CFG)" == "RBTray - Win32 Debug"

"RBHook - Win32 Debug" : 
	cd "."
	$(MAKE) /$(MAKEFLAGS) /F .\RBHook.mak CFG="RBHook - Win32 Debug" 
	cd "."

"RBHook - Win32 DebugCLEAN" : 
	cd "."
	$(MAKE) /$(MAKEFLAGS) /F .\RBHook.mak CFG="RBHook - Win32 Debug" RECURSE=1 CLEAN 
	cd "."

!ENDIF 

SOURCE=.\rbtray.c

"$(INTDIR)\rbtray.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\rbtray.rc

"$(INTDIR)\rbtray.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)



!ENDIF 

