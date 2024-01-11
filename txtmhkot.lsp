(DEFUN makeblock()
  (if (not (tblsearch "BLOCK" "XU"))
    (progn
  (entmake '((0 . "BLOCK")
        (2 . "XU")

	     (70 . 2)
        (10 0.0 0.0 0.0)))
(entmake (list '(0 . "ATTDEF")
	       '(10 -0.8 -0.43333333 0.0)
	       ;'(10 -2.6 -0.125 0.0)
		'(62 . 256)
		'(40 . 2.0)
		'(73 . 0)
	       '(11 -0.8 0.0 0.0)
	       ;'(11 -2.6 0.0 0.0)
		'(1 . "0")
		;'(51 . 0.0)
	       '(74 . 2)
		'(3 . "KM")	       
	       '(2 . "KM")
	       
	       '(8 . "0")
	         ;'(50 . 0.0)
	       (cons 7 (getvar "TEXTSTYLE")) '(70 . 0)  '(71 . 0) '(72 . 2)   
	       )
	 )
  
(entmake (list
	   '(0 . "TEXT")
	   '(10 0.0 -0.4333333 0.0)
	   '(11 0.0  0.0 0.0)
	   ;'(10 -2.4 -0.125 0.0)
	   ;'(11 -2.4  0.0 0.0)
	    '(1 . "+")
	   
	   '(72 . 1)
	   '(73 . 2)
	    '(8 .  "0")
	   '(62 . 256)
	   
	   '(40 . 2.0)
	   ;'(41 . 1.0)
	   ;'(50 . 0.0)
	   '(71 . 0)
	   (cons 7 (getvar "TEXTSTYLE"))
	   )
	 )
	 (entmake (list	 '(0 . "ATTDEF")  '(8 . "0")  '(10 0.8 -0.4333333 0.0) '(40 . 2.0) '(62 . 256) '(1 . "000.00") '(2 . "M") '(3 . "M")
			 ;'(50 . 0.0)
		  ;'(51 . 0.0)
			 (cons 7 (getvar "TEXTSTYLE")) '(70 . 0) '(71 . 0) '(72 . 0) '(11 0.8 0.0 0.0) '(280 . 0)  '(73 . 0) '(74 . 2) ;(280 . 1)
		 )
	 )


 (entmake '((0 . "ENDBLK")))
)
    )



)

  
 
(defun insxu (pt sc gon xu)
  

 ; (setq util (vla-get-utility 
  ;                 (vla-get-activedocument 
   ;                     (vlax-get-acad-object))))
 
(setq dimz (getvar "DIMZIN"))
(setvar "DIMZIN" 1)

(if (>= xu 0.0)
 (setq km (rtos (fix (/ (abs xu) 1000.0)) 2 0))
 (setq km (strcat "-" (rtos (fix (/ (abs xu) 1000.0)) 2 0)))
)
(setq ekat (rem (abs xu) 1000.0))

  (setq m (rtos (abs ekat) 2 0))

(if (< ekat 10.0)
  (setq m (strcat "00" m))
  (if (< ekat 100.0) (setq m (strcat "0" m)))
 )
(entmake (list (cons 0 "INSERT")
              (cons 8 "0")
              (cons 66 1)
	      (cons 2 "XU")
              (cons 10 pt)
              (cons 41 sc)
              (cons 42 sc)
	      (cons 43 sc)
              (cons 50 gon)
	      
              (cons 70 0)
              (cons 71 0)
              (cons 44 0)
              (cons 45 0)
              ;(cons 210 (list 0 0 1))
              (cons 62 256)
              (cons 39 0)
              (cons 6 "BYLAYER")))
(entmake (list (cons 0 "ATTRIB")
              (cons 8 "0")
	
	      (cons 10 (polar
			 pt   
		    	 (angle '(0.0 0.0 0.0) '(-1.0 -0.4333333 0.0))
		    	(distance '(0.0 0.0 0.0) (mapcar '* (list sc sc sc) (list -1.00 -0.4333333 0.0)))
		    )
		    )
		 
	
	      ;(cons 51 0.0)
	      
              (cons 40 (* sc 2.0))
              (cons 1 km)
              (cons 2 "KM")
              (cons 70 0)
              (cons 73 0)
              (cons 50 gon)
              (cons 41 1)
              (cons 7 "Standard")
              (cons 71 0)
              (cons 72 2)
	
	      (cons 11 (polar pt 
	 		(+ gon (angle '(0.0 0.0 0.0) '(-1.0 0.0 0.0)))
		    	(distance '(0.0 0.0 0.0) (mapcar '* (list sc sc sc) (list -1.0 0.0 0.0))))
		    )
		 
	
              ;(cons 210 (list 0 0 1))
              (cons 74 2)
              (cons 62 256)
              (cons 39 0)
              (cons 6 "BYLAYER")
	 )
  )
  (entmake (list (cons 0 "ATTRIB")
              (cons 8 "0")
	
	      (cons 10	(polar
		pt 
 		(angle '(0.0 0.0 0.0) '(1.0 0.0 0.0))
		(distance '(0.0 0.0 0.0)  (mapcar '* (list sc sc sc) (list 1.0 0.0 0.0)))
		)
	
	      
	   )
              (cons 40 (* sc 2.0))
              (cons 1 m)
              (cons 2 "M")
              (cons 70 0)
              (cons 73 0)
              (cons 50 gon)
	      ;(cons 51 0.0)
	      
	      (cons 41 1)
              (cons 7 "Standard")
              (cons 71 0)
              (cons 72 0)
	
	      (cons 11	(polar
		pt 
 		(+ gon (angle '(0.0 0.0 0.0) '(1.0 0.0 0.0)))
		    (distance '(0.0 0.0 0.0) (mapcar '* (list sc sc sc) (list 1.0 0.0 0.0)))

		)
	      )
	
	;(cons 210 (list 0 0 1))
              (cons 74 2)
		 
              (cons 62 256)
              (cons 39 0)
              (cons 6 "BYLAYER")))
(entmake (list (cons 0 "SEQEND")
              ))
(setvar "DIMZIN" dimz)
  )
(defun c:txtmhkot()
  (makeblock)
  (setq exob nil step -12.0)
  ;(setq globalx 0.0 globaly 0.0)
(setq exob (vlax-get-object "Excel.Application"))
  (if (not exob)
    (progn
	;Ket = Kingsoft Office	
	(setq exob (vlax-get-object "KET.Application"))
		(if (not exob) 
		(progn
  			(princ "\nΠαρακαλώ φορτώστε λίστες στο excel/Wps office")
			(exit)
			
		
  
    )
    )
      )
    )
    
 
 
(setq acadobj (vlax-get-acad-object))
(setq name (vlax-get-property acadobj 'Name))
(setq acaddoc (vlax-get-property acadobj 'ActiveDocument))
 (setq tmp nil)
 
   


(setq acadobj (vlax-get-acad-object))
(setq name (vlax-get-property acadobj 'Name))

(setq cells (vlax-get-property exob 'Cells))
  (setq accell (vlax-get-property exob 'ActiveCell))
(setq r1 (1+ (vlax-get-property accell 'Row)) c1 (vlax-get-property accell 'Column) r1tmp r1 c1tmp c1)
  (setq startxutmp nil endxutmp nil)
 
  (setq cells (vlax-get-property exob 'Cells))
(setq r1tmp r1 mhkotstr nil)
(if (and scx scy)
	  	(progn
		(setq tmpscx (getreal (strcat "\nΚλίμακα μηκών <" (rtos (/ 1000.0 scx) 2 0) "> ")) tmpscy (getreal (strcat "\nΚλίμακα υψών <" (rtos (/ 1000.0 scy) 2 0) "> ")))
		(if tmpscx (setq scx (/ 1000.0 tmpscx)))
		(if tmpscy (setq scy (/ 1000.0 tmpscy)))
		)
	  	(progn
  		(setq scx (getreal "\nΚλίμακα μηκών ") scy (getreal "\nΚλίμακα υψών ") scx (/  1000.0 scx) scy (/ 1000.0 scy))
		
		)
)
(setvar "DIMZIN" 1)
(if (eq name "GstarCAD")
;GSTARCAD

(progn
  ;ΧΘ τελευταία στήλη
(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
(setq xustr (vlax-variant-value (vlax-variant-change-type item 8)))
(while  (not (eq (vlax-variant-value (vlax-variant-change-type item 11)) :vlax-false))
  	(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
	(setq xustr (vlax-variant-value (vlax-variant-change-type item 8)))
  	(if (not mhkotstr)
	  (setq mhkotstr (list xustr))
	  (setq mhkotstr (append mhkotstr  (list xustr)))
        )
  	(setq c1 (1+ c1))
  	(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
  )
	;Kοιτάει τελευταία στήλη με ΧΘ
  	(setq item (vlax-get-property cells 'Item     r1  (1- c1) ) )
	(setq xutel (vlax-variant-value (vlax-variant-change-type item 5)))
	(while  (not (eq (vlax-variant-value (vlax-variant-change-type item 11)) :vlax-false))
	(setq r1 (1+ r1))
  	(setq item (vlax-get-property cells 'Item r1  (1- c1)))
	)
	(setq r1 (1- r1))
	(setq item (vlax-get-property cells 'Item r1  (1- c1)))
	(setq xuarx (vlax-variant-value (vlax-variant-change-type item 5)))
)
(progn
(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
(setq xustr (vlax-variant-value  item ))

(while  (vlax-variant-value  (vlax-get-property (vlax-variant-value item)  'Value2))
  	(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
	(setq xustr (vlax-variant-value (vlax-get-property  (vlax-variant-value item) 'Value2)))
  	(if (not mhkotstr)
	  (setq mhkotstr (list  xustr))
	  (setq mhkotstr (append mhkotstr  (list xustr)))
        )
  	(setq c1 (1+ c1))
  	(setq item (vlax-get-property cells 'Item    (1- r1)  c1 ) )
  )
    	(setq item (vlax-get-property cells 'Item  r1 (1- c1) ))
    	(setq xutel (vlax-variant-value (vlax-get-property (vlax-variant-value item) 'Value2)))
    	(while (vlax-variant-value (vlax-get-property (vlax-variant-value item) 'Value2 ))
	  	(Setq r1 (1+ r1))
	  	(setq item (vlax-get-property cells 'Item r1 (1- c1)))
		(setq xu1 (vlax-variant-value (vlax-get-property (vlax-variant-value item) 'Value2)))

   )
    	(setq r1 (1- r1))
	(setq item  (vlax-get-property cells 'Item r1 (1- c1)))
	(setq xuarx (vlax-variant-value (vlax-get-property (vlax-variant-value item) 'Value2)))
    
    )
  )
  (setq mhkotstr (append mhkotstr (list "ΑΠΟΣΤΑΣΕΙΣ ΜΕΤΑΞΥ")))
  (setq mhkotstr (append mhkotstr (list "ΧΙΛΙΟΜΕΤΡΗΣΗ")))
  (setq telos xuarx arxh xutel)
 ;(xiliometrisi arxh telos scx)
  (pinakaki arxh telos  scx)
  ;(princ (strcat "endxu " (rtos endxu 2 2)))
  (setq r11 (1- r1tmp))  
  (setq r2 r1)
  
  (setq r1 r1tmp)
 
  (setq mhkotar nil)
  ;(princ (strcat "r1=" (rtos r1 2 0) " r2=" (rtos r2 2 0)))
  (setq passalos (1+ (- R2 R1)))
  
(if (eq name "GstarCAD")
;GSTARCAD
(progn
  	(SETQ c2  C1 c1 c1tmp mhkotar nil)
  	(setq minn 9e9 maxx -9e9)
	(setq item (vlax-get-property cells 'Item r1 c1))
  	
	;(while  (not (eq (vlax-variant-value (vlax-variant-change-type item 11)) :vlax-false))
  	(while  (<= r1 r2)
	  	(setq sthlh nil)
		(while (< c1 c2)
	  	
		(setq item (vlax-get-property cells 'Item r1	c1))
	
		(setq arit (vlax-variant-value (vlax-variant-change-type item 5)))
		;interpolated
		(if (not arit) 
			(progn
   			  (setq arit (vlax-variant-value (vlax-variant-change-type item 8)))
			  	 (if (< c1 (1- c2))
		      (progn
		    
			  (setq minn (min (atof arit) minn) maxx (max (atof arit) maxx))
			)
				   )
			)
		  	(progn
	 (if (< c1 (1- c2))
		      (progn
		    
			  (setq minn (min arit minn) maxx (max arit maxx))
			)
	   )
	   
		
			 (setq arit (rtos arit 2 2))
			)
		  	)
		  (if (= c1 (- c2 1)) (setq arit (atof arit)))	
		  (if (not sthlh)
		    (setq sthlh (list arit))
		    (setq sthlh (append sthlh (list arit)))
		    )
		  (setq c1 (1+ c1))
		  )
	       (setq c1 c1tmp)
	       (if (not mhkotar) 
			(setq mhkotar  (list sthlh))
			(setq mhkotar (append mhkotar (list sthlh)))
		)
		(setq r1 (1+ r1))
		(setq item (vlax-get-property cells 'Item r1	c1))
	  )

	  )
  ;ACAD
  (progn
    	(SETQ c2  C1 c1 c1tmp mhkotar nil)
    	(setq minn 9e9 maxx -9e9)
	(setq item (vlax-variant-value (vlax-get-property cells 'Item r1 c1)))
    	     (while  (<= r1 r2)
	        (setq sthlh nil)
	       	(while (< c1 c2)
		(setq item (vlax-variant-value (vlax-get-property cells 'Item r1 c1)))
		(setq arit (vlax-variant-value (vlax-get-property item 'Value2)))
	        (if (eq (type arit) 'REAL)
		  (progn
		    (if (< c1 (1- c2))
		      (progn
		    (setq minn (min arit minn) maxx (max arit maxx))
		    (setq arit (rtos arit 2 2))
		    )
		      )
		   
		  )
		  
		  )
		  (if (not sthlh)
		    (setq sthlh (list arit))
		    (setq sthlh (append sthlh (list arit)))
		    )
		  (setq c1 (1+ c1))
		)  
		(setq c1 c1tmp)
	       (if (not mhkotar) 
			(setq mhkotar  (list sthlh))
			(setq mhkotar (append mhkotar (list sthlh)))
			)
		(setq r1 (1+ r1))
		   
	  )
  
)
  )
  


  (setq uu 0)
  
  (setq arxh  (car (reverse (nth 0 mhkotar))) telos (car (reverse (nth 0 (reverse mhkotar)))) )
   	;(setq lista (vl-sort mhkotar '(lambda (e1 e2) (< (caddr e1) (caddr e2)))))
  	;(setq mmin (caddr (nth 0 mhkotar)))
  	;(setq mmax (max  (car (reverse (last mhkotar))) (cadddr (last mhkotar))))
  	(setq eyros (* (- (+ (fix maxx) 1.0) (fix (- minn 5.0))) (/ scy scx)))
  	(setq perit 400.0)
  	(setq bimata (1+ (/ eyros perit)))
  	(setq hstep (fix (/ (/ eyros bimata) scy)))
  	(setq allagh (list (list 0 (fix (- minn 5.0)))))
  	(setq c 1)
  	(setq minor (cadr (last allagh)))
  	;(while (< c (length mhkotar))
	;(setq minor (cadr (last allagh)))      
	;      (if  (> (* (/ scy scx) (- (caddr (nth c mhkotar)) minor))	perit)
	;	    (setq allagh (append allagh (list (list (1- c) (+ (cadr (last allagh)) hstep))))))
	;  (if  (< (* (/ scy scx) (- (caddr (nth c mhkotar)) minor))	10.0)
	;	    (setq allagh (append allagh (list (list (1- c) (- (cadr (last allagh)) hstep)))))
	;	      )
	;  (setq c (1+ c))
	;  )
  	(xiliometrisi arxh telos scx)
  ;	(pinakaki arxh telos  scx)
	(stext "ΜΗΚΟΤΟΜΗ" (/ -40.0  scx) (/ 30.0 scx)  (/ 4.0  scx) 7 90 1 0)
	(stext (strcat 	"ΚΛΙΜΑΚΑ ΜΗΚΩΝ:  1:" (rtos (/ 1000.0 scx) 2 0)) (/ -60.0  scx) (/ 15.0 scx)  (/ 3.0  scx) 7  0 1 0)
	(stext (strcat "ΚΛΙΜΑΚΑ ΥΨΩΝ: 1:" (rtos (/ 1000 scy) 2 0)) (/ -60.0  scx) (/ 10.0 scx)  (/ 3.0  scx) 7 0 1 0)
  	(setq minor (cadr (nth 0 allagh)))
  	` (setq allagh (cdr allagh))
  	
  	(horiz 0.0  0.0 (strcat "H = " (replacedc minor )))
  	
  	
  	
  	(setq stelexos (list
		'(0 . "LWPOLYLINE") '(100 . "AcDbEntity") '(100 . "AcDbPolyline") (cons 90 (+ (1- (length allagh)) (length mhkotar)))))
	
  	;(while (< y1 (- (length (nth 0 mhkotar)) 2))
	;  (if (not polyadd) (setq polyadd (list stelexos))
	;    (setq polyadd (append polyadd (list stelexos))))
	;  (setq y1 (1+ y1))
	;  )
 	
  	(Setq y2 1 thesi 0.0 offset -6.0 step -12.0)
  	
  	(while (< y2 (- (length (nth 0 mhkotar)) 1))
	(setq c 0)
	(setq polyadd1 nil)
	  (while (< c (length mhkotar))
	  
	  (setq diat1 (vl-string-trim " " (car (nth c mhkotar))))
	  (setq y1 1)
	  (setq maxline -9e9)
	  (if (= y2 1.0)
	    (progn
	  (while (< y1 (- (length (nth 0 mhkotar)) 1))
  		(setq maxline (max maxline (atof (nth y1 (nth c mhkotar)))))
    		(setq y1 (1+ y1))
          )
		
	  (line (- (car (reverse (nth c mhkotar))) arxh) 0.0 (- (car (reverse (nth c mhkotar))) arxh)
		(* (/ scy scx) (- maxline minor)) 3)
  
	(line (-  (car (reverse (nth c mhkotar))) arxh)
	      (/ (* (length (nth 0 mhkotar)) step) scx)
	      (- (car (reverse (nth c mhkotar))) arxh)
		  (/ (+ step (* (length (nth 0 mhkotar)) step) ) scx) 7)
	(if (> c 0) 
	  (progn
	    (stext (rtos (- (car (reverse (nth c mhkotar))) prev) 2 2) (* 0.5 (+ (- (car (reverse (nth c mhkotar))) arxh) (- prev arxh)))
		   (/ (+   (* (length (nth 0 mhkotar)) step) (* 0.5 step))   scx) (/ 2.0  scx) 7 0 1 5)
	  )
	  )
	  (setq prev (car (reverse (nth c mhkotar))))
	(stext (car (nth c mhkotar)) (- (car (reverse (nth c mhkotar))) arxh) (/ (+ thesi  offset) scx) (/ 1.5  scx) 7 90 1 5)
	(stext (rtos (car (reverse (nth c mhkotar))) 2 2) (- (car (reverse (nth c mhkotar))) arxh) (/ (+  (* (1- (length (nth 0 mhkotar))) step)  offset) scx) (/ 1.5  scx) 7 90 1 5)
	  )
	    )
		(setq diat1 (vl-string-trim " " (nth y2 (nth c mhkotar))))
	  
	      
	      ;(stext (car (nth c mhkotar))              (- (atof diat1) arxh) (/ -30.0 scx) (/ 1.5  scx) 7 90 1 5)
	      ;(stext (replacedc (caddr (nth c mhkotar)) ) (- (atof diat1) arxh) (/ -18.0 scx)  (/ 1.5  scx) 7 90 1 5)
	      ;(stext (replacedc (cadddr (nth c mhkotar)) ) (- (atof diat1) arxh) (/ -6.0 scx)  (/ 1.5  scx) 4 90 1 5)
	  (stext diat1 (- (car (reverse (nth c mhkotar))) arxh) (/ (+ (+ thesi step) offset) scx) (/ 1.5  scx) y2 90 1 5)
	  ;(setq diat1 (vl-string-trim " " (nth y2 (nth c mhkotar))))
	 (if (not polyadd1)
	   (setq polyadd1  (list (cons 10 (list (- (car (reverse (nth c mhkotar))) arxh)
		(+ 0.0 (* (/ scy scx) (- (atof (nth y2 (nth c mhkotar))) minor)))))))
	  (setq polyadd1 (append polyadd1 (list (cons 10 (list (- (car (reverse (nth c mhkotar))) arxh)
		(+ 0.0 (* (/ scy scx) (- (atof (nth y2 (nth c mhkotar))) minor))))))))
	   )
	  ;(if (and allagh (= c (car (nth 0 allagh))))
	  ;  (progn
	  ;    (setq minor (cadr (nth 0 allagh)))
	  ;   (horiz (+ 0.0 (- (cadr (nth c mhkotar)) arxh))  0.0 (strcat "H = " (replacedc minor )))
	  ;    (setq polyadd (append polyadd (list (cons 10 (list (+ 0.0 (- (atof diat1) arxh))
	;	(+ 0.0 (* (/ scy scx) (- (caddr (nth c mhkotar)) minor))))))))
	;      
	;	(setq allagh (cdr allagh))
	;      )
	;    )
	  (setq c (1+ c))
	
	  )
	  (setq thesi (+ thesi step))
  	(setq polyadd1 (append stelexos polyadd1 (list (cons 62 y2))))
  	(entmake polyadd1)
	  (setq y2 (1+ y2))
	  )
  	
 
(vlax-release-object exob)	
(princ)
  
  )
(defun xiliometrisi (arxh telos scx)
  
(setq sta (- (* 100.0 (+ 1 (fix (/ arxh 100.0) ))) arxh))
(if (equal sta 100.0 1e-3) (Setq sta 0.0))
(setq ste (- telos arxh))
(setq h sta)
(while (< h ste)
  (line h (/ (+ (* 1.0 step) (* step (length (nth 0 mhkotar)))) scx) h
	  (/ (+ -1.2 (* 1.0 step) (* step (length (nth 0 mhkotar)))) scx)  7)
  (line h (/ (+ (* 1.5 step) (* step (length (nth 0 mhkotar)))) scx) h (/  (+ 1.2 (+ (* 1.5 step) (* step (length (nth 0 mhkotar))))) scx)   7)
  (if (> (+ arxh h) -1000.0)
    (setq strr (rtos (- (/ (fix (+ arxh h)) 1000.0) 0.5) 2 0))
    (setq strr (rtos (- (/ (fix (+ arxh h)) 1000.0) 0.5) 2 0))
  )
    
  

  (setq strr (strcat strr  " + " (rtos (fix (/ (rem (+ arxh h) 1000.0) 100.0))  2 0)
		     (rtos (rem (fix (/ (+ arxh h) 10.0)) 10.0) 2 0)
		     (rtos (fix (rem (+ arxh h) 10.0))  2 0)))
  (insxu (list h (/ (+ (* 1.25 step) (* step (length (nth 0 mhkotar)))) scx) 0.0) (/ 1.0 scx) 0.0 (+ arxh h))
  
  (setq h (+ h 100.0))
  )
  
  )
(defun pinakaki(arxh telos scx)
;(setq acadobj (vlax-get-acad-object))

;(setq name (vlax-get-property acadobj 'Name))

;(setq acaddoc (vlax-get-property acadobj 'ActiveDocument))

(setq thesi 0.0 offset -7.5 startx -80.0 minx startx)
(setq cs 0 ce (1- (length mhkotstr)))
(foreach stri mhkotstr
  (progn
      (stext stri (/ (+ startx (/ 2.5  scx))) (/ (+ thesi offset) scx) (/ 3.0  scx) 4 0 1 0)
      (setq enn  (entlast))
      (setq boxx (car (nth 1 (Textbox (entget enn)))))
      (setq upx (/ (+ (/ 2.5  scx) (+ (/ -77.5 scx) ) boxx) ))
      (if (> upx 0.0) (setq startx (- 0.0 boxx )))
      (if (< startx minx) (setq minx startx))
      (entdel enn)
      ;(entmod (subst (cons 10 (list minx (caddr (assoc 10 enn)))) (assoc 10 enn) en))
      (Redraw)
      ;(setq thesi (+ thesi step))
  )
  )
  (setq cst 0 cen (length mhkotstr))
  (foreach stri mhkotstr
  (progn
      
      (stext stri (- minx (/ 2.5 scx)) (/ (+ thesi offset) scx) (/ 3.0  scx) 4 0 1 0)
      ;(setq enn  (entlast))
      ;(setq boxx (car (nth 1 (Textbox (entget enn)))))
      ;(setq upx (/ (+ (/ 2.5  scx) (+ (/ -77.5 scx) ) boxx) ))
      ;(if (> upx 0.0) (setq startx (- 0.0 boxx (/ 2.5 scx))))
      ;(if (< startx minx) (setq minx startx))
      ;(entdel enn)
      ;(entmod (subst (cons 10 (list minx (caddr (assoc 10 enn)))) (assoc 10 enn) en))
      (Redraw)
      (if (= cst (- cen 2)) (setq thesi (+ thesi (* 3.0 (/ step 4.0))))
      (setq thesi (+ thesi step))
      )
	    (setq cst (1+ cst))
      
  )
  )

  (Setq thesi 0.0)
(foreach stri mhkotstr
  (progn
    (line (- minx (/ 5.0 scx)) (/ thesi  scx) (- telos  arxh) (/ thesi  scx) 7)
    (setq thesi (+ thesi step))
  )
  )
  (setq thesi (- thesi (/ step 2.0)))
  (line (- minx (/ 5.0 scx)) (/ thesi  scx) (- telos  arxh) (/ thesi  scx) 7)
  (line (- minx (/ 5.0 scx)) (/ thesi scx) (- minx (/ 5.0 scx)) 0.0 7)
)
(defun shmaia (x1 y1 strr)
(setq scx 1.0)
  )
  
(defun replacedc (str / symb)
  
  (setq symb (vl-registry-read "HKEY_CURRENT_USER\\Control Panel\\International" "sDecimal"))
  (vl-string-subst symb "." (rtos str 2 2))
  
  )
(defun replaceddc (str / symb)
  
  (setq symb (vl-registry-read "HKEY_CURRENT_USER\\Control Panel\\International" "sDecimal"))
  (vl-string-subst symb "." (rtos str 2 3))
  
  )
  
(defun replacedotcomma( str / symb)
  (setq symb (vl-registry-read "HKEY_CURRENT_USER\\Control Panel\\International" "sDecimal"))
  (vl-string-subst symb "." (rtos str 2 4))
  ;(setq inter (vlax-get-property appl 'Item 3))
)
(defun LINE (x1 y1 x2 y2 co / lintype)
  (setq x1 (+ x1 0.0) y1 (+ y1 0.0))
  (setq x2 (+ x2 0.0) y2 (+ y2 0.0))
  (entmake (list '(0 . "LINE")
		 (cons 10 (list x1 y1 0.0))
		 (cons 11 (list x2 y2 0.0))
	;	 (cons 6 lintype)
	;	 (cons 48 ltscale)
		 (cons 62 co)
		 )
	   )
  )
(defun STEXT(STRIG tx ty tH color angl scal al)
  (setq tx (+ tx 0.0) ty (+ ty 0.0))
  (if (or (equal angl 90.0 1e-4) (equal angl 270.0 1e-4))
    (progn
      (if (= al 1) (setq tx (+ tx (* th scal))))
      (if (= al 2) (setq tx (+ tx th scal)))
      )
    )
  (if (or (equal angl 0.0 1e-4) (equal angl 180.0 1e-4))
    (progn
      (if (= al 1) (setq tx (+ tx th scal)))
      (if (= al 2) (setq tx (+ tx (* th scal))))
      )
    )
  (if (or (= al 0) (= al 1) (= al 2)) (progn
  (entmake (list '(0 . "TEXT")
		 (cons 10 (list tx ty 0.0))
		 (cons 1 STRIG)
		 (cons 40 th)
		 (cons 41 scal)
		 (cons 7 (vlax-get-property (vla-get-activetextstyle acaddoc) 'Name))
		 (cons 50 (* angl (/ pi 180.0)))
		 (cons 72 0)
		 (cons 73 0)
		 (cons 62 color)
		 
		 )
	   )
  )
    )
    
      (if (= al 5)
      (entmake (list '(0 . "TEXT")
		 (cons 10 (list tx ty 0.0))
		 (cons 11 (list tx ty 0.0))
		 (cons 1 STRIG)
		 (cons 40 th)
		 (cons 41 scal)
		 (cons 7 (vlax-get-property (vla-get-activetextstyle acaddoc) 'Name))
		 (cons 50 (* angl (/ pi 180.0)))
		 (cons 72 4)
		 (cons 73 0)
		 (cons 62 color)
		 
		 )
	   )
	)
   
    )
	(defun solid (x1 y1 x2 y2 x3 y3 x4 y4)
	  
	(entmake (list '(0 . "SOLID")
				   (cons 10 (list x1 y1 0.0))
				   (cons 11 (list x2 y2 0.0))
				   (cons 12 (list x3 y3 0.0))
				   (cons 13 (list x4 y4 0.0))
				   (cons 8 (getvar "CLAYER"))
				   )
	)
	)
	(defun horiz(x1 y1 srt)
	 
	(solid x1 y1 x1 (+ y1 (/ 3.0 scx)) (+ x1 (/ 2.0 scx)) (+ y1 (/ 3.0 scx)) (+ x1 (/ 2.0 scx)) (+ y1 (/ 3.0 scx)))
	(stext srt x1 (+ y1 (/ 5.5 scx)) (/ 2.0 scx)  7 0 1 0)
	(line x1 y1 x1 (+ y1 (/ 5.0 scx)) 7)
	
	(line x1 y1 (- x1 (/ 2.0 scx)) (+ y1 (/ 3.0 scx)) 7)
	(line (- x1 (/ 2.0 scx)) (+ y1 (/ 3.0 scx))  x1  (+ y1 (/ 3.0 scx)) 7)
	(line  x1  (+ y1 (/ 5.0 scx))  (+ x1 (/ 15.0 scx))  (+ y1 (/ 5.0 scx)) 7)
	)
	