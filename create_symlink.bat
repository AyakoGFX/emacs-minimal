@echo off
rem Create symbolic link for .emacs.d
mklink /D "C:\Users\ayako\AppData\Roaming\.emacs.d" "C:\Users\ayako\emacs-minimal\emacs-mini\.emacs.d"
echo Symbolic link created successfully.
