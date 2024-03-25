wget https://www.reqrypt.org/download/WinDivert-2.2.0-A.zip
unzip WinDivert-2.2.0-A.zip
cp WinDivert-2.2.0-A/x86/WinDivert.dll ../dist/x86
cp WinDivert-2.2.0-A/x86/*.sys ../dist/x86
cp WinDivert-2.2.0-A/x64/WinDivert.dll ../dist/x86_64
cp WinDivert-2.2.0-A/x64/*.sys ../dist/x86_64
rm -rf WinDivert-2.2.0-A WinDivert-2.2.0-A.zip

cd ../dist
zip -r ../goodbyedpi-openvpn.zip *
cd ../src
