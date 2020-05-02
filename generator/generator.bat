:: this script must be executed in this directory
:: all the output goes to generator/output folder
:: .cpp and .h files:
:: cimgui.h and cimgui.cpp with gcc preprocess
:: cimgui_nopreprocess.h and cimgui_nopreprocess.cpp generated without preprocess
:: cimgui_impl.h with implementation function cdefs
:: lua and json files:
:: definitions.lua for function definitions
:: structs_and_enums.lua with struct and enum information-definitions
:: impl_definitions.lua for implementation function definitions

@echo off
for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
  set InstallDir=%%i
)
:: I think this path changed for 2019, so this may not work for older versions
call "%InstallDir%\VC\Auxiliary\Build\vcvars64.bat"

::process  files
:: arg[1] compiler name gcc, clang or cl
:: arg[2] imgui_internal functions generation: true or false
:: arg[3..n] name of implementations to generate
.\luajit\luajit generator.lua cl true

::leave console open
pause

