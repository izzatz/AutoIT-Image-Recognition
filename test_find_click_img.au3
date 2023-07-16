;Created by Izzat Zainol

#include "ImageSearch2015.au3"

; Define image paths and search parameters
Global $img1 = ".\Images\1.png" ;img1 to be click
Global $img2 = ".\Images\2.png" ;img2 to be click
Global $toleranceLevel = 0
Global $transparencyLevel = 0

; Launch the program
Run("C:\Program Files (x86)\list-your-program.exe here")
Sleep(3000)

; Search for and click the img1
If ImageSearchAndClick($img1) Then
    Sleep(3000)

    ; Search for and click the img2
    If ImageSearchAndClick($img2) Then
        Send("some random text")
        Send("{ENTER}")
    Else
        MsgBox(1, "Not found", "Image Not Found")
    EndIf
Else
    MsgBox(1, "Not found", "Image Not Found")
EndIf

; Function to search for and click an image
Func ImageSearchAndClick($imagePath)
    Local $positionToReturn = 1
    Local $targetImageXCoord = 0
    Local $targetImageYCoord = 0
    Local $resultImageSearch = _ImageSearch($imagePath, $positionToReturn, $targetImageXCoord, $targetImageYCoord, $toleranceLevel, $transparencyLevel)

    If $resultImageSearch = 1 Then
        MouseClick("left", $targetImageXCoord, $targetImageYCoord)
        Return True
    Else
        Return False
    EndIf
EndFunc
