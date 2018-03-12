(define (script-fu-save-xamarin-overlay-button-icons-png image folder name interpolation x80 x160 x280 x60 x120 x180 interlace compression bKGD gAMA oFFs pHYs tIME comment svtrans)

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
(aset formats 0 80)
(aset formats 1 160)
(aset formats 2 280)
(aset formats 3 60)
(aset formats 4 120)
(aset formats 5 180)

;Values - Selected Formats
(aset formatsSelected 0 x80)
(aset formatsSelected 1 x160)
(aset formatsSelected 2 x280)
(aset formatsSelected 3 x60)
(aset formatsSelected 4 x120)
(aset formatsSelected 5 x180)

;names
(aset names 0 80)
(aset names 1 160)
(aset names 2 280)
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

(script-fu-register	"script-fu-save-xamarin-overlay-button-icons-png"
					_"<Image>/Script-Fu/Xamarin Save Icons/Add Button Overlay Icons"
					"Save Xamarin overlay-button Icons PNG"
					"(c) Andrew Hoefling ( https://hoeflingsoftware.com ) 2018"
					"License GPLv3"
					"January 2018"
					"RGB* GRAY* INDEXED*"
					SF-IMAGE 	"Image"				0
					SF-DIRNAME	"Folder"			""
					SF-STRING 	"Name" 				""
					SF-ENUM 	"Interpolation" 	'("InterpolationType" "cubic")
					SF-TOGGLE	"PNG hdpi 80 x 80px"		TRUE
					SF-TOGGLE	"PNG xhdpi 160 x 160px"		TRUE
					SF-TOGGLE	"PNG xxhdpi 280 x 280px"	TRUE
					SF-TOGGLE	"PNG @1 60 x 60px"			TRUE
					SF-TOGGLE	"PNG @2 120 x 120px"			TRUE
					SF-TOGGLE	"PNG @3 180 x 180px"			TRUE
					
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