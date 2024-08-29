Dim response
response = MsgBox("Welcome to CMD GUI! (Yes=About No=Text GUI)(Its in Work In Progress)", vbYesNo + vbQuestion, "Confirmation")
If response = vbYes Then
    MsgBox "Creator:A random 14 yrs old, program is in work in progress(WIP), I like bash!"
Else
    MsgBox "Press 'OK' to proceed!"
Set objShell = CreateObject("WScript.Shell")
objShell.Run "CMDGUI.bat", 1, True
End If

    