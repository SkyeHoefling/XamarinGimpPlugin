(define (script-fu-save-xamarin-earnie-login-logo-png image folder name interpolation x375 x500 x750 x300 x600 x900 interlace compression bKGD gAMA oFFs pHYs tIME comment svtrans)

(let* (
	(newImage 0)
	(newDraw 0)
	(newName "")
	(rawName "")
	;(folderNew "")
	(y 0)
	(partName "")
	(formats (cons-array 8 'byte))
	(formatsSelected (cons-array 8 'byte))
	(names (cons-array 8 'byte))
	(fS 0)
)



;Values - Formats
(aset formats 0 375)
(aset formats 1 500)
(aset formats 2 750)
(aset formats 3 300)
(aset formats 4 600)
(aset formats 5 900)

;Values - Selected Formats
(aset formatsSelected 0 x375)
(aset formatsSelected 1 x500)
(aset formatsSelected 2 x750)
(aset formatsSelected 3 x300)
(aset formatsSelected 4 x600)
(aset formatsSelected 5 x900)

;names
(aset names 0 375)
(aset names 1 500)
(aset names 2 750)
(aset names 3 1)
(aset names 4 2)
(aset names 5 3)


(while (< y 8)

	(set! fS (aref formatsSelected y))

	(cond
		((= fS TRUE)
			;New Image
			(set! newImage (car (gimp-image-duplicate image)))
			(gimp-image-merge-visible-layers newImage 0)
			(gimp-image-scale-full newImage (aref formats y) (aref formats y) interpolation)
			(set! newDraw (car (gimp-image-get-active-drawable newImage)))
			
			;Name
			(set! partName (number->string (aref names y)))
			;(set! folderNew (string-append folder "/" partName "/"))
			;(set! newName (string-append folderNew "/" name "_" partName ".png"))
			(set! newName (string-append folder "/" name "_" partName ".png"))
			(set! rawName (string-append name "_" partName "0.png"))
			
			;Save
			(file-png-save2 1 newImage newDraw newName rawName interlace compression bKGD gAMA oFFs pHYs tIME comment svtrans)
			
			;Delete
			(gimp-image-delete newImage)
		)
	)
	
	(set! y (+ y 1))
)


)
)

(script-fu-register	"script-fu-save-xamarin-earnie-login-logo-png"
					_"<Image>/Script-Fu/Xamarin Save Icons/Earnie Jr/Login Logo Icons"
					"Save Xamarin Standard Icons PNG"
					"(c) Andrew Hoefling ( https://hoeflingsoftware.com ) 2018"
					"License GPLv3"
					"January 2018"
					"RGB* GRAY* INDEXED*"
					SF-IMAGE 	"Image"				0
					SF-DIRNAME	"Folder"			""
					SF-STRING 	"Name" 				""
					SF-ENUM 	"Interpolation" 	'("InterpolationType" "cubic")
					SF-TOGGLE	"PNG hdpi 375 x 375px"		TRUE
					SF-TOGGLE	"PNG xhdpi 500 x 500px"		TRUE
					SF-TOGGLE	"PNG xxhdpi 750 x 750px"	TRUE
					SF-TOGGLE	"PNG @1 300 x 300px"			TRUE
					SF-TOGGLE	"PNG @2 600 x 600px"			TRUE
					SF-TOGGLE	"PNG @3 900 x 900px"			TRUE
					
					SF-TOGGLE		"Use Adam7 interlacing?"				FALSE
					SF-ADJUSTMENT	"Deflate Compression factor (0--9)"  	'(9 0 9 1 10 0 0)
					SF-TOGGLE		"Write bKGD chunk?"						TRUE
					SF-TOGGLE		"Write gAMA chunk?"						FALSE
					SF-TOGGLE		"Write oFFs chunk?"						FALSE
					SF-TOGGLE		"Write pHYs chunk?"						TRUE
					SF-TOGGLE		"Write tIME chunk?"						TRUE
					SF-TOGGLE		"Write comment?"						TRUE
					SF-TOGGLE		"Preserve color of transparent pixels?" TRUE
					
)