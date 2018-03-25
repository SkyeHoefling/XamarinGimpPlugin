(define (script-fu-save-xamarin-iOS-App-icons-png image folder name interpolation x16 x32 x20 x29 x40 x48 x55 x58 x60 x64 x76 x80 x87 x88 x120 x128 x152 x167 x172 x180 x196 x256 x512 x1024 interlace compression bKGD gAMA oFFs pHYs tIME comment svtrans)

(let* (
	(newImage 0)
	(newDraw 0)
	(newName "")
	(rawName "")
	;(folderNew "")
	(y 0)
	(partName "")
	(formats (cons-array 24 'byte))
	(formatsSelected (cons-array 24 'byte))
	(names (cons-array 24 'byte))
	(fS 0)
)


;Values - Formats
(aset formats 0 16)
(aset formats 1 32)
(aset formats 2 20)
(aset formats 3 29)
(aset formats 4 40)
(aset formats 5 48)
(aset formats 6 55)
(aset formats 7 58)
(aset formats 8 60)
(aset formats 9 64)
(aset formats 10 76)
(aset formats 11 80)
(aset formats 12 87)
(aset formats 13 88)
(aset formats 14 120)
(aset formats 15 128)
(aset formats 16 152)
(aset formats 17 167)
(aset formats 18 172)
(aset formats 19 180)
(aset formats 20 196)
(aset formats 21 256)
(aset formats 22 512)
(aset formats 23 1024)

;Values - Selected Formats
(aset formatsSelected 0 x16)
(aset formatsSelected 1 x32)
(aset formatsSelected 2 x20)
(aset formatsSelected 3 x29)
(aset formatsSelected 4 x40)
(aset formatsSelected 5 x48)
(aset formatsSelected 6 x55)
(aset formatsSelected 7 x58)
(aset formatsSelected 8 x60)
(aset formatsSelected 9 x64)
(aset formatsSelected 10 x76)
(aset formatsSelected 11 x80)
(aset formatsSelected 12 x87)
(aset formatsSelected 13 x88)
(aset formatsSelected 14 x120)
(aset formatsSelected 15 x128)
(aset formatsSelected 16 x152)
(aset formatsSelected 17 x167)
(aset formatsSelected 18 x172)
(aset formatsSelected 19 x180)
(aset formatsSelected 20 x196)
(aset formatsSelected 21 x256)
(aset formatsSelected 22 x512)
(aset formatsSelected 23 x1024)

;names
(aset names 0 16)
(aset names 1 32)
(aset names 2 20)
(aset names 3 29)
(aset names 4 40)
(aset names 5 48)
(aset names 6 55)
(aset names 7 58)
(aset names 8 60)
(aset names 9 64)
(aset names 10 76)
(aset names 11 80)
(aset names 12 87)
(aset names 13 88)
(aset names 14 120)
(aset names 15 128)
(aset names 16 152)
(aset names 17 167)
(aset names 18 172)
(aset names 19 180)
(aset names 20 196)
(aset names 21 256)
(aset names 22 512)
(aset names 23 1024)


(while (< y 24)

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

(script-fu-register	"script-fu-save-xamarin-iOS-App-icons-png"
					_"<Image>/Script-Fu/Xamarin Save Icons/App Icons/iOS Icons"
					"Save Xamarin iOS App Icons PNG"
					"(c) Andrew Hoefling ( https://hoeflingsoftware.com ) 2018"
					"License GPLv3"
					"March 2018"
					"RGB* GRAY* INDEXED*"
					SF-IMAGE 	"Image"				0
					SF-DIRNAME	"Folder"			""
					SF-STRING 	"Name" 				""
					SF-ENUM 	"Interpolation" 	'("InterpolationType" "cubic")
					SF-TOGGLE	"PNG 16 x 16px"			TRUE
					SF-TOGGLE	"PNG 32 x 32px"			TRUE
					SF-TOGGLE	"PNG 20 x 20px"			TRUE
					SF-TOGGLE	"PNG 29 x 29px"			TRUE
					SF-TOGGLE	"PNG 40 x 40px"			TRUE
					SF-TOGGLE	"PNG 48 x 48px"			TRUE
					SF-TOGGLE	"PNG 55 x 55px"			TRUE
					SF-TOGGLE	"PNG 58 x 58px"			TRUE
					SF-TOGGLE	"PNG 60 x 60px"			TRUE
					SF-TOGGLE	"PNG 64 x 64px"			TRUE
					SF-TOGGLE	"PNG 76 x 76px"			TRUE
					SF-TOGGLE	"PNG 80 x 80px"			TRUE
					SF-TOGGLE	"PNG 87 x 87px"			TRUE
					SF-TOGGLE	"PNG 88 x 88px"			TRUE
					SF-TOGGLE	"PNG 120 x 120px"		TRUE
					SF-TOGGLE	"PNG 128 x 128px"		TRUE
					SF-TOGGLE	"PNG 152 x 152px"		TRUE
					SF-TOGGLE	"PNG 167 x 167px"		TRUE
					SF-TOGGLE	"PNG 172 x 172px"		TRUE
					SF-TOGGLE	"PNG 180 x 180px"		TRUE
					SF-TOGGLE	"PNG 196 x 196px"		TRUE
					SF-TOGGLE	"PNG 256 x 256px"		TRUE
					SF-TOGGLE	"PNG 512 x 512px"		TRUE
					SF-TOGGLE	"PNG 1024 x 1024px"		TRUE

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
