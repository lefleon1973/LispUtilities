(defun *error*(msg)
  
     ;(if item1    (vlax-release-object item1))

  ;(if cells (vlax-release-object cells))
  ;(if exob (vlax-release-object exob))
  ;(setq exob nil cells nil item1 nil item nil)
  (princ msg)
       )
(defun c:ptxl()
  (setq acadApp (vlax-get-acad-object))
(setq name  (vlax-get-property acadApp 'Name))
  (setq exob (vlax-get-object "Excel.Application"))
  (if (not exob)
	(setq exob (vlax-get-object "KET.Application"))
  )
  (if exob 
 (progn
  (setq cells (vlax-get-property exob 'Cells))
  (setq accell (vlax-get-property exob 'ActiveCell))
  (setq r1 (vlax-get-property accell 'Row ))
  (setq c1 (vlax-get-property accell 'Column ))

  
  (Setq t1 t)
  (while  t1 
  (setq h1 (entsel "\nΕπιλογή polyline "))
    (if (and h1 (/= (cdr (assoc 0 (entget (car h1)))) "LWPOLYLINE"))
      (progn
 	(princ "\nΕπιλέξτε polyline ")
        (setq t1 t))
      )
    (if (and h1 (= (cdr (assoc 0 (entget (car h1)))) "LWPOLYLINE"))
      (progn
 	
        (setq t1 nil))
      )
    )
  (if (or (= (substr name 1 4) "Auto") (= (substr name 1 5) "Brics"))
  (progn 
  (setq kk (vlax-ename->vla-object  (Car h1)))
  (setq cend (cdr (assoc 90 (entget (Car h1)))))
  (setq c 0)
  
  (while (< c cend)
    (setq coords (vlax-get-property kk 'Coordinate c))
    (setq item2 (vlax-variant-value coords))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'Value2 (1+ c))
    (setq c1 (1+ c1))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'Value2 (vlax-safearray-get-element item2 0) )
    (setq c1 (1+ c1))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'Value2 (vlax-safearray-get-element item2 1) )

    (setq c1 (- c1 2))
    (setq r1 (1+ r1))
  
    (setq jj (vlax-get-property Cells 'item r1 c1))
    (setq jj1 (vlax-variant-value jj))
  ;(vlax-invoke-method jj1 'Activate)
    (setq c (1+ c))
  )
  )
(progn
  
  (setq kk (vlax-ename->vla-object  (Car h1)))
  (setq cend (cdr (assoc 90 (entget (Car h1)))))
  (setq c 0)
  
  (while (< c cend)
    (setq coords (vlax-get-property kk 'Coordinate c))
    (setq item2 (vlax-variant-value coords))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'FormulaR1C1Local (1+ c))
    (setq c1 (1+ c1))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'FormulaR1C1Local (vlax-safearray-get-element item2 0) )
    (setq c1 (1+ c1))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'FormulaR1C1Local (vlax-safearray-get-element item2 1) )

    (setq c1 (- c1 2))
    (setq r1 (1+ r1))
  
    (setq jj (vlax-get-property Cells 'item r1 c1))
    (setq jj1 (vlax-variant-value jj))
  ;(vlax-invoke-method jj1 'Activate)
    (setq c (1+ c))
  )
  )
)
  (vlax-release-object kk)
  (vlax-release-object item1)
  (vlax-release-object cells)
  (vlax-release-object exob)
  (setq exob nil cells nil item1 nil item nil)
  )
    (progn
    ;Δεν υπάρχει excel τότε libreoffice
    (setq libreoffice (vlax-create-object "com.sun.star.ServiceManager"))
    (if libreoffice
      	(progn
	  (setq oDesk (vlax-invoke-method libreoffice 'createInstance "com.sun.star.frame.Desktop"))
(setq model (vlax-invoke-Method oDesk 'getCurrentComponent ))
  
  (setq currentcontroller (vlax-invoke-Method model 'getCurrentController ))
	  (setq getactivesheet (vlax-invoke-Method  currentcontroller 'getActiveSheet))
(Setq t1 t)
  (while  t1 
  (setq h1 (entsel "\nΕπιλογή polyline "))
    (if (and h1 (/= (cdr (assoc 0 (entget (car h1)))) "LWPOLYLINE"))
      (progn
 	(princ "\nΕπιλέξτε polyline ")
        (setq t1 t))
      )
    (if (and h1 (= (cdr (assoc 0 (entget (car h1)))) "LWPOLYLINE"))
      (progn
 	
        (setq t1 nil))
      )
    )
  

(setq kk (vlax-ename->vla-object  (Car h1)))
  (setq cend (cdr (assoc 90 (entget (Car h1)))))
  (setq c 0)
  (setq cellp (vlax-invoke-Method  model 'getCurrentSelection))
  (setq cellAddress (vlax-invoke-Method  cellp 'getCellAddress))
   (setq r1 (vlax-get-property     cellAddress 'Row))
    (setq c1 (vlax-get-property  cellAddress 'Column))
  ;ThisComponent.LockControllers
  
  (while (< c cend)
    (setq coords (vlax-get-property kk 'Coordinate c))
    (setq item2 (vlax-variant-value coords))
    (vlax-invoke-method cellp 'setValue (1+ c))
    (setq c1 (1+ c1))
    (setq cellp (vlax-invoke-Method getActiveSheet 'GetCellByPosition c1 r1))
    (vlax-invoke-method cellp 'setValue (vlax-safearray-get-element item2 0) )
    (setq c1 (1+ c1))
    (setq cellp (vlax-invoke-Method getActiveSheet 'GetCellByPosition c1 r1))
    (vlax-invoke-method cellp 'setValue (vlax-safearray-get-element item2 1) )
    (setq c1 (- c1 2))
    (setq r1 (1+ r1))
    (setq cellp (vlax-invoke-Method getActiveSheet 'GetCellByPosition c1 r1))
    (setq c (1+ c))
  )
	    
  (setq cellp (vlax-invoke-Method getActiveSheet 'GetCellByPosition c1 r1))
     (vlax-invoke-method currentcontroller 'select cellp)
  

	  )
      )
    (progn "\nΠαρακαλώ φορτώστε το excel")
    )
    
    )
  )
(defun c:yy2()

  (setq ar (vla-get-Area en))
  )

(defun c:yx1()
;(setq exob (vlax-get- "Excel.Application"))
  (setq en1 (vlax-ename->vla-object  (car (entsel))))
  (setq en2 (vlax-ename->vla-object  (car (entsel))))
(setq ac (vlax-get-acad-object))
  (setq doc (vlax-get-property ac 'ActiveDocument))
 (setq modspace (vlax-get-property doc 'Modelspace))
  
  (setq p1 (vlax-make-safearray  vlax-vbDouble  '(0 . 2) ))
  (vlax-safearray-put-element p1  0 0.0)
  (vlax-safearray-put-element p1  1 0.0)
  (vlax-safearray-put-element p1  2 0.0)
  
  (setq p2 (vlax-make-safearray vlax-vbDouble '(0 . 2) ))
  (setq f 0)
  (while (< f (* 1 pi))
    (vlax-safearray-put-element p2  0 (cos f))
  (vlax-safearray-put-element p2  1 (sin f))
  (vlax-safearray-put-element p2  2 0.0)
 (setq int1 nil int2 nil)
 (setq ent1 (vlax-invoke-method modspace 'AddXLine p1 p2))
 (setq col (vlax-put-property ent1 'Color 7))
  (setq int1 (vlax-invoke-method ent1 'IntersectWith en1 0))
  
  (setq inters1 (vlax-safearray->list (vlax-variant-value int1)))
  
  (setq int2 (vlax-invoke-method ent1 'IntersectWith en2 0))
  
  (setq inters2 (vlax-safearray->list (vlax-variant-value int2)))
  
	  
 (setq ent2 (vlax-invoke-method ent1 'Delete))
    (setq f (+ f (/ pi 180)))
  )
(vlax-release-object modspace)
  (vlax-release-object doc)
 (vlax-release-object ac)
  
  (setq v1 v1)
 
  )


(defun c:Gk1()
  
  (setq exob (vlax-get-object "Excel.Application"))
  (setq cells (vlax-get-property exob 'Cells))
  (setq accell (vlax-get-property exob 'ActiveCell))
  (setq r1 (vlax-get-property accell 'Row ))
  (setq c1 (vlax-get-property accell 'Column ))

  
  (setq a (ssget '((0 . "TEXT"))))
  (setq b (ssadd))
  ; eyresh toy mikroteroy x
  (setq i 0 i1 0 i2 0)
   (while (> (sslength a) 0)
    
    (setq minx 99999999999999)
  (while (< i (sslength a))
    (setq ent1 (entget (ssname a i)))
    (if (and (= (Car (assoc 72 ent)) 0) (= (Car (assoc 73 ent)) 0))
    	(setq x1 (cadr (assoc 10 ent1)))  
    	(setq x1 (cadr (assoc 11 ent1)))
    )
    (if (< x1 minx)
	    (progn
	      (setq minx x1)
	      (setq i1 i)
	    )
	  )
    (setq i (1+ i))
    )
  (while (/= i1 -1)
  (setq i 0)
      (if (/= i1 -1) (progn
     (ssadd (ssname a i1) b)
     (ssdel (ssname a i1) a)
     )
      )
    (setq i1 -1)
  )
     
     )
  



(setq i 0)
  (while (< i (sslength b))
    (setq h1 (cdr (assoc 1 (entget (ssname b i)))))
    (setq item (vlax-get-property cells 'Item r1 c1))
    (setq item1 (vlax-variant-value item))
    (vlax-put-property item1 'Value2 h1 )
    (setq r1 (1+ r1))
  
  (setq jj (vlax-get-property Cells 'item r1 c1))
  (setq jj1 (vlax-variant-value jj))
  
    (setq i (1+ i))
  )
  (setq r1 (+ r1 2))
  (setq jj (vlax-get-property Cells 'item r1 c1))
  (setq jj1 (vlax-variant-value jj))
  (vlax-invoke-method jj1 'Activate)
  (vlax-release-object item1)
  (vlax-release-object cells)
  (vlax-release-object exob)
  (setq exob nil cells nil item1 nil item nil)
  
  )  
  


