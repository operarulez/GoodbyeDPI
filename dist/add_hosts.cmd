@ECHO OFF
PUSHD "%~dp0"
echo This script should be run with administrator privileges.
echo Right click - run as administrator.
echo Press any key if you're running it as administrator.
pause
icacls "%windir%\system32\drivers\etc\hosts" /save hosts.acl
takeown /a /f "%windir%\system32\drivers\etc\hosts" && icacls "%windir%\system32\drivers\etc\hosts" /reset
attrib -r -h -s "%windir%\system32\drivers\etc\hosts"
type %CD%\hosts.txt >>"%windir%\system32\drivers\etc\hosts"
attrib +r "%windir%\system32\drivers\etc\hosts"
icacls "%windir%\system32\drivers\etc" /restore hosts.acl
del hosts.acl
POPD
