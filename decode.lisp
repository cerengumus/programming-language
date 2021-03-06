; *********************************************
; *  341 Programming Languages                *
; *  Fall 2019                                *
; *  Author: Yakup Genc                       *
; *  LEMYE CEREN GUMUS - 151044071            *
; *********************************************

;; utility functions 
(load "C:\\Users\\user\\Desktop\\151044071\\include.lisp") ;; "c2i and "i2c"
(defun read-as-list (filename)
	(print "read-as-list RESULTS :")
	(setq str nil)
	; Reads a file containing one word per line and returns a list of words (each word is in turn a list of characters)."
	(let ((in (open filename :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
        while line do (format t "~a~%" line) 
		do (setq str (concatenate 'string (string str) (string line)))
		do (print str)
		)
    (close in)))
	(setq str (subseq str 3))
	(print str)
	(split-by-one-space str)

)
(defun Gen-Decoder-A (paragraph)
	(print "Gen-Decoder-A RESULTS :")
	(setq temp nil)
	(setq newList nil)
	(setq encList nil)
	(setq dictionaryList nil)
	(setq mainList nil)
	(setq decodeList nil)
	(setq temp2 nil)
	(map 'list (lambda (it)
	(map 'list (lambda (c) 
	(setq w c) 
	(case w
		(#\a  (setq h #\d) (setq newList (nconc newList (list h))) (setq h nil))
		(#\b  (setq h #\e) (setq newList (nconc newList (list h))) (setq h nil))
		(#\c  (setq h #\f) (setq newList (nconc newList (list h))) (setq h nil))
		(#\d  (setq h #\p) (setq newList (nconc newList (list h))) (setq h nil))
		(#\e  (setq h #\q) (setq newList (nconc newList (list h))) (setq h nil))
		(#\f  (setq h #\a) (setq newList (nconc newList (list h))) (setq h nil))
		(#\g  (setq h #\b) (setq newList (nconc newList (list h))) (setq h nil))
		(#\h  (setq h #\k) (setq newList (nconc newList (list h))) (setq h nil))
		(#\i  (setq h #\l) (setq newList (nconc newList (list h))) (setq h nil))
		(#\j  (setq h #\c) (setq newList (nconc newList (list h))) (setq h nil))
		(#\k  (setq h #\r) (setq newList (nconc newList (list h))) (setq h nil))
		(#\l  (setq h #\s) (setq newList (nconc newList (list h))) (setq h nil))
		(#\m  (setq h #\t) (setq newList (nconc newList (list h))) (setq h nil))
		(#\n  (setq h #\g) (setq newList (nconc newList (list h))) (setq h nil))
		(#\o  (setq h #\y) (setq newList (nconc newList (list h))) (setq h nil))
		(#\p  (setq h #\z) (setq newList (nconc newList (list h))) (setq h nil))
		(#\q  (setq h #\h) (setq newList (nconc newList (list h))) (setq h nil))
		(#\r  (setq h #\i) (setq newList (nconc newList (list h))) (setq h nil))
		(#\s  (setq h #\j) (setq newList (nconc newList (list h))) (setq h nil))
		(#\t  (setq h #\m) (setq newList (nconc newList (list h))) (setq h nil))
		(#\u  (setq h #\n) (setq newList (nconc newList (list h))) (setq h nil))
		(#\v  (setq h #\o) (setq newList (nconc newList (list h))) (setq h nil))
		(#\w  (setq h #\u) (setq newList (nconc newList (list h))) (setq h nil))
		(#\x  (setq h #\v) (setq newList (nconc newList (list h))) (setq h nil))
		(#\y  (setq h #\w) (setq newList (nconc newList (list h))) (setq h nil))
		(#\z  (setq h #\x) (setq newList (nconc newList (list h))) (setq h nil))
		(otherwise (setq newList (nconc newList (list w)))))
		(setq w nil)
	) it )(setq encList (nconc encList (list newList)))(setq newList nil))paragraph)
		
			(print newList)
			(print encList)
			(setq decodeList nil)
			(Gen-Decoder-B-0 paragraph)
			(Gen-Decoder-B-1 paragraph)
			(Code-Breaker encList decodeList)
			(print "spell-checker-0 RESULTS :")
			(map 'list (lambda (it) (spell-checker-1 it)) encList)
			(print "spell-checker-1 RESULTS :")
			(map 'list (lambda (it) (spell-checker-0 it)) encList)
)
(defun spell-checker-0 (word)
	(setq d 1)
	(setq p 0)
	(setq str nil)
	(if (equalp word nil) (setq p 1))
	(map 'list (lambda (i) (setq str (concatenate 'string (string str) (string i))))word)
	(if (eq p 0)(setq str (subseq str 3)))
	(let ((in (open "C:\\Users\\user\\Desktop\\151044071\\dictionary2.txt":if-does-not-exist nil)))
			(when in
			(loop for line = (read-line in nil)
				while line 
				do (if (string-equal str line) (setq d 111))
				) 
		(close in)))
		(print word)
		(if (equalp d 111) 
		(format t "~a~% was found in dictionary" str) (format t "~a~% was not found in dictionary" str))
			
)
(defun count-word (n pathname)
  (with-open-file (s pathname :direction :input)
    (loop for line = (read-line s nil nil) while line
          nconc (list-symb (drop-noise line)) into words
          finally (return (subseq (sort (pair words)
                                        #'> :key #'cdr)
                                  0 n)))))
 
  (defun list-symb (s)
    (let ((*read-eval* nil))
      (read-from-string (concatenate 'string "(" s ")"))))
 
(defun drop-noise (s)
  (delete-if-not #'(lambda (x) (or (alpha-char-p x)
                                   (equal x #\space)
                                   (equal x #\-))) s))
 
(defun pair (words &aux (hash (make-hash-table)) ac)
  (dolist (word words) (incf (gethash word hash 0)))
  (maphash #'(lambda (e n) (push `(,e . ,n) ac)) hash) ac)
 





(defun spell-checker-1 (word)
		(setq str nil)
		(setq strWord nil)
		(setq count 0)
		(count-word 0 "C:\\Users\\user\\Desktop\\151044071\\dictionary2.txt")
		(let ((in (open "C:\\Users\\user\\Desktop\\151044071\\dictionary2.txt":if-does-not-exist nil)))
			(when in
			(loop for line = (read-line in nil)
				while line 
				do (setq str (concatenate 'string (string str) (string line)))
				do (if (eq count 0) (setq str (subseq str 3)))
				do (setq str (concatenate 'string (string str) " "))
				do (setq count (+ 1 count))
				) 
			(close in)))
			(map 'list (lambda (c) (setq strWord (concatenate 'string (string strWord) (string c))))word)
			(setq strWord (subseq strWord 3))
			(print strWord)
			(if (equalp (search strWord str) nil) (print "word couldnot find in dictionary") (print "word found in dictionary"))
)
(defun split-by-one-space (string)
	(print string)
	(setq wordList nil)
	(setq letList ())
	(setq temp 0)
	(setq mainList nil)
    (loop for i = 0 then (1+ j)
          as j = (position #\Space string :start i) 
        
          while j do (print (subseq string i j))
		  do (if (equalp (subseq string i j) "") (setq temp 1))
		  do (if (eq temp 0) (setq wordList (nconc wordList (list (subseq string i j)))))
		  do (setq temp 0)
		  )
			(print wordList)
			(map 'list (lambda (it) 
			(map 'list #'(lambda (c) (setq letList (nconc letList (list c)))) it )
			(setq mainList (nconc mainList (list letList)))
			(setq letList nil) ) wordList)
			(print letList)
			(print mainList)
			(Gen-Decoder-A mainList)
			 
		  ;(setq temp (nconc temp '(c)))
 )	 
 
 (defun Gen-Decoder-B-0 (paragraph)
  	;you should implement this function
		(print "Gen-Decoder-B-0 RESULTS : " )
		(setq freqRatio nil)
		(setq freqletterList (make-array 26 :initial-element 0))
		(setq freqRatio (make-array 26 :initial-element 0))
		(setq letterList (make-array 26
   :initial-contents '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n 
   #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z))
)
	(map 'list (lambda (it) (map 'list (lambda (c) 
	  (case c
		(#\a  (setf (aref freqletterList 0) (+ (aref freqletterList 0) 1)))
		(#\b  (setf (aref freqletterList 1) (+ (aref freqletterList 1) 1)))
		(#\c  (setf (aref freqletterList 2) (+ (aref freqletterList 2) 1)))
		(#\d  (setf (aref freqletterList 3) (+ (aref freqletterList 3) 1)))
		(#\e  (setf (aref freqletterList 4) (+ (aref freqletterList 4) 1)))
		(#\f  (setf (aref freqletterList 5) (+ (aref freqletterList 5) 1)))
		(#\g  (setf (aref freqletterList 6) (+ (aref freqletterList 6) 1)))
		(#\h  (setf (aref freqletterList 7) (+ (aref freqletterList 7) 1)))
		(#\i  (setf (aref freqletterList 8) (+ (aref freqletterList 8) 1)))
		(#\j  (setf (aref freqletterList 9) (+ (aref freqletterList 9) 1)))
		(#\k  (setf (aref freqletterList 10) (+ (aref freqletterList 10) 1)))
		(#\l  (setf (aref freqletterList 11) (+ (aref freqletterList 11) 1)))
		(#\m  (setf (aref freqletterList 12) (+ (aref freqletterList 12) 1)))
		(#\p  (setf (aref freqletterList 15) (+ (aref freqletterList 15) 1)))
		(#\s  (setf (aref freqletterList 18) (+ (aref freqletterList 18) 1)))
		(#\t  (setf (aref freqletterList 19) (+ (aref freqletterList 19) 1)))
		(#\u  (setf (aref freqletterList 20) (+ (aref freqletterList 20) 1)))
		(#\v  (setf (aref freqletterList 21) (+ (aref freqletterList 21) 1)))
		(#\w  (setf (aref freqletterList 22) (+ (aref freqletterList 22) 1)))
		(#\x  (setf (aref freqletterList 23) (+ (aref freqletterList 23) 1)))
		(#\y  (setf (aref freqletterList 24) (+ (aref freqletterList 24) 1)))
		(#\z  (setf (aref freqletterList 25) (+ (aref freqletterList 25) 1)))
		)
	    ) it)) paragraph)
		(print freqletterList)
		(setq counter 0)
		(map 'list (lambda (it)(setq counter (+ counter it))) freqletterList)
	
		(setf (aref freqRatio 0)  (/ (* (aref freqletterList 0) (float 100)) counter))
		(setf (aref freqRatio 1)  (/ (* (aref freqletterList 1) (float 100)) counter))
		(setf (aref freqRatio 2)  (/ (* (aref freqletterList 2) (float 100)) counter))
		(setf (aref freqRatio 3)  (/ (* (aref freqletterList 3) (float 100)) counter))
		(setf (aref freqRatio 4)  (/ (* (aref freqletterList 4) (float 100)) counter))
		(setf (aref freqRatio 5)  (/ (* (aref freqletterList 5) (float 100)) counter))
		(setf (aref freqRatio 6)  (/ (* (aref freqletterList 6) (float 100)) counter))
		(setf (aref freqRatio 7)  (/ (* (aref freqletterList 7) (float 100)) counter))
		(setf (aref freqRatio 8)  (/ (* (aref freqletterList 8) (float 100)) counter))
		(setf (aref freqRatio 9)  (/ (* (aref freqletterList 9) (float 100)) counter))
		(setf (aref freqRatio 10) (/ (* (aref freqletterList 10) (float 100)) counter))
		(setf (aref freqRatio 11) (/ (* (aref freqletterList 11) (float 100)) counter))
		(setf (aref freqRatio 12) (/ (* (aref freqletterList 12) (float 100)) counter))
		(setf (aref freqRatio 13) (/ (* (aref freqletterList 13) (float 100)) counter))
		(setf (aref freqRatio 14) (/ (* (aref freqletterList 14) (float 100)) counter))
		(setf (aref freqRatio 15) (/ (* (aref freqletterList 15) (float 100)) counter))
		(setf (aref freqRatio 16) (/ (* (aref freqletterList 16) (float 100)) counter))
		(setf (aref freqRatio 17) (/ (* (aref freqletterList 17) (float 100)) counter))
		(setf (aref freqRatio 18) (/ (* (aref freqletterList 18) (float 100)) counter))
		(setf (aref freqRatio 19) (/ (* (aref freqletterList 19) (float 100)) counter))
		(setf (aref freqRatio 20) (/ (* (aref freqletterList 20) (float 100)) counter))
		(setf (aref freqRatio 21) (/ (* (aref freqletterList 21) (float 100)) counter))
		(setf (aref freqRatio 22) (/ (* (aref freqletterList 22) (float 100)) counter))
		(setf (aref freqRatio 23) (/ (* (aref freqletterList 23) (float 100)) counter))
		(setf (aref freqRatio 24) (/ (* (aref freqletterList 24) (float 100)) counter))
		(setf (aref freqRatio 25) (/ (* (aref freqletterList 25) (float 100)) counter))
		;(print freqRatio)
		(setq temp1 nil)
		(map 'list (lambda (it) 
		(setq temp1 (nconc temp1 (list it)))) freqRatio)
		(setq temp nil)
		
		(sort freqRatio #'>)
		(setq counter 0)
		(setq r 1)
		(print temp1)
		(print freqRatio)
		(map 'list (lambda (it) 
		(map 'list (lambda (c) 
		(map 'list (lambda (i)(if (equalp i counter) (setq r 2)))temp)
		(if (< r 1)(if (equalp it c) (setq temp (nconc temp (list counter)))))
		(setq counter (+ counter 1))(setq r 0))
		temp1) (setq counter 0)) freqRatio)
		(setq temp1 nil)
		(map 'list (lambda (it) (setq temp1 (nconc temp1 (list (aref letterList it)))))temp)
		(print "frequency Sort :")
		(print temp1)
		(setq counter 0)
		(print "The most frequent six letters :")
		(map 'list (lambda (it) (if (< counter 6) (print it))(setq counter (+ counter 1)))temp1)
	
)

(defun Code-Breaker (document decoder)
	(print "Code-Breaker RESULTS:")
  	(map 'list (lambda (it)
	(map 'list (lambda (c) 
	(setq w c) 
	(case w
		(#\d  (setq h #\a) (setq newList (nconc newList (list h))) (setq h nil))
		(#\e  (setq h #\b) (setq newList (nconc newList (list h))) (setq h nil))
		(#\f  (setq h #\c) (setq newList (nconc newList (list h))) (setq h nil))
		(#\p  (setq h #\d) (setq newList (nconc newList (list h))) (setq h nil))
		(#\q  (setq h #\e) (setq newList (nconc newList (list h))) (setq h nil))
		(#\a  (setq h #\f) (setq newList (nconc newList (list h))) (setq h nil))
		(#\b  (setq h #\g) (setq newList (nconc newList (list h))) (setq h nil))
		(#\k  (setq h #\h) (setq newList (nconc newList (list h))) (setq h nil))
		(#\l  (setq h #\i) (setq newList (nconc newList (list h))) (setq h nil))
		(#\c  (setq h #\j) (setq newList (nconc newList (list h))) (setq h nil))
		(#\r  (setq h #\k) (setq newList (nconc newList (list h))) (setq h nil))
		(#\s  (setq h #\l) (setq newList (nconc newList (list h))) (setq h nil))
		(#\t  (setq h #\m) (setq newList (nconc newList (list h))) (setq h nil))
		(#\g  (setq h #\n) (setq newList (nconc newList (list h))) (setq h nil))
		(#\y  (setq h #\o) (setq newList (nconc newList (list h))) (setq h nil))
		(#\z  (setq h #\p) (setq newList (nconc newList (list h))) (setq h nil))
		(#\h  (setq h #\q) (setq newList (nconc newList (list h))) (setq h nil))
		(#\i  (setq h #\r) (setq newList (nconc newList (list h))) (setq h nil))
		(#\j  (setq h #\s) (setq newList (nconc newList (list h))) (setq h nil))
		(#\m  (setq h #\t) (setq newList (nconc newList (list h))) (setq h nil))
		(#\n  (setq h #\u) (setq newList (nconc newList (list h))) (setq h nil))
		(#\o  (setq h #\v) (setq newList (nconc newList (list h))) (setq h nil))
		(#\u  (setq h #\w) (setq newList (nconc newList (list h))) (setq h nil))
		(#\v  (setq h #\x) (setq newList (nconc newList (list h))) (setq h nil))
		(#\w  (setq h #\y) (setq newList (nconc newList (list h))) (setq h nil))
		(#\x  (setq h #\z) (setq newList (nconc newList (list h))) (setq h nil))
		(otherwise (setq newList (nconc newList (list w)))))
		(setq w nil)
	) it )(setq decodeList (nconc decodeList (list newList)))(setq newList nil))document)
	(print decodeList)
	(setq str nil)
	(map 'list (lambda (d)(map 'list (lambda (g) (setq str (concatenate 'string (string str) (string g)))) d)
	(setq str (concatenate 'string (string str) " ")) )decodeList)
	(print "------------*DECODE RESULT")
	(setq decoder (subseq str 3))
	(princ (subseq str 3))
	(print "")
	
)
(defun Gen-Decoder-B-1 (paragraph)
	(print "Gen-Decoder-B-1 RESULTS:")
	(setq letterList (make-array 26
   :initial-contents '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n 
   #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z)))
	(setq str nil)
	(print "(Gen-Decoder-B-1 mainList)")
	(map 'list (lambda (i) (map 'list (lambda (c) 
	(setq str (concatenate 'string (string i) (string c)))(setq str nil)) letterList)) letterList)
	(setq size 0)
	(map 'list (lambda (i) (map 'list (lambda (j) (setq size (+ 1 size))) i))paragraph)
	(setq Array (make-array size :initial-element 0))
	(setq k 0)
	(map 'list (lambda (i) (map 'list (lambda (j) (setf (aref Array k) j) (setq k (+ 1 k)))i))paragraph)
	(setq counter 0)
	(setq List nil)
	
	(setq str1 nil)
	(map 'list (lambda (i) (map 'list (lambda (j) (setq counter (+ 1 counter))
	(if (eq str1 nil)
	(setq str1 nil)
	(setq List (nconc List (list str1))))
	(if (< counter size)
	(setq str1 (concatenate 'string (string j) (string (aref Array counter))))) 
	) i)(setq str1 nil)
	)paragraph)
	(print List)
	(setq temp nil)
	(setq count 1)
	(setq b nil)
	(map 'list (lambda (j) 
	(map 'list (lambda (b) (if (equalp (string b) (string j)) (setq count 7)))temp)
	(if (< count 5)(setq temp (nconc temp (list j))) (setq count 1)) 
	) List)
	(print temp)
	
	(setq size 0)
	(map 'list (lambda (j) (setq size (+ 1 size)) )temp)
	(setq newArray (make-array size :initial-element 0))
	(setq counter 0)
	(setq k 0)
	(setq total 0)
	(map 'list (lambda (i) (map 'list (lambda (j) (if (equalp (string i) (string j)) (setq counter(+ 1 counter) )) 
	) List) (setf (aref newArray k) counter) (setq total (+ total counter))(setq k (+ 1 k)) (setq counter 0) 
	) temp)
	(setq k 0)
	(setq freq nil)
	(setq val nil)
	(setq biagram (make-array size :initial-element 0))
	(map 'list (lambda (i) (setf (aref biagram k) i) (setq k (+ 1 k)))temp)
	(setq k 0)
	(map 'list (lambda (i) (setf (aref newArray k) (/ (* (aref newArray k) (float 100)) total)) (setq k (+ 1 k)))temp)
	(print newArray)
	(setq k 0)
	(map 'list (lambda (i) 
	(if (< k size )
	(setq val (nconc val (list (aref newArray k))))) (setq k (+ 1 k)))temp)
	(setq k 0)
	(map 'list (lambda (i) 
	(if (< k size )
	(setq freq (nconc freq (list (aref newArray k)))) ) (setq k (+ 1 k)))temp)
	(sort val #'>)
		(setq counter 0)
		(setq r 1)
		(setq k 0)
		(setq tempfreq nil)
		(map 'list (lambda (it) 
		(map 'list (lambda (c) 
		(map 'list (lambda (i)(if (equalp i counter) (setq r 2)))tempfreq)
		(if (< r 1)(if (equalp it c) (setq tempfreq (nconc tempfreq (list counter)))))
		(setq counter (+ counter 1))(setq r 0))
		freq) (setq counter 0)  (setq k (+ 1 k))) val)
		(setq temp1 nil)
		(map 'list (lambda (it) (setq temp1 (nconc temp1 (list (aref biagram it)))))tempfreq)
		(print "frequency Sort :")
		(print temp1)
		(setq counter 0)
		(print "The most frequent six bi letters :")
		(map 'list (lambda (it) (if (< counter 6) (print it))(setq counter (+ counter 1)))temp1)
)

;;(read-as-list "C:\\Users\\user\\Desktop\\151044071\\document2.txt")
(defun test_on_test_data ()
	(print "....................................................")
	(print "Testing ....")
	(print "....................................................")
	(read-as-list "C:\\Users\\user\\Desktop\\151044071\\document2.txt")
)


;; test code...
(test_on_test_data)	
;;(load "C:\\Users\\user\\Desktop\\151044071\\decode.lisp")