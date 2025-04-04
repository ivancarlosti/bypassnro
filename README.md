# bypassnro
A simple script to bypass required online Microsoft Account during Windows installation

# Instructions
1. Download project (here)
2. Extract the files into a flash drive (you can use the same flash drive used to install Windows or any other acessible storage device)
3. During Windows Installation, when it asks for a Microsoft account, press Shift + F10 to open Command Prompt
4. Reach the flash drive letter (D:, E:, F:... you can try each letter and check drive content using command `dir`)
5. Execute the batch file `bypass.bat`, just type the filename on Command Prompt after opening drive letter
6. The system will reboot
7. Proceed with Windows 11 installation without online account
8. As soon you complete the installation, you can execute the bath file `restore.bat` to recover network connectivity.
