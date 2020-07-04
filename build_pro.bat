
set qt_path=C:\Qt\Qt5.14.2\5.14.2\msvc2017\bin\
set qt_jom=C:\Qt\Qt5.14.2\Tools\QtCreator\bin\jom.exe
set vc_path=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\

cd /d %qt_path%
call qtenv2.bat

cd /d %vc_path%
call vcvars32.bat

cd /d %~dp0
rd MSVC2017_32bit-Release
md MSVC2017_32bit-Release
cd /d MSVC2017_32bit-Release
qmake %~dp0\QtProject.pro -spec win32-msvc "CONFIG+=qtquickcompiler" "CONFIG+=force_debug_info" "CONFIG+=separate_debug_info"

%qt_jom% clean
%qt_jom% qmake_all
%qt_jom%

del /f /q %~dp0\bin\Release\vc_redist.x86.exe