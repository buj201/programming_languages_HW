
;------------------------------------------------------------------------;
;Question a: foldr
;------------------------------------------------------------------------;

(define (foldr f s L)
  (cond
    ((null? L) s)
    (else (f (car L) (foldr f s (cdr L))))
  )
)

;------------------------------------------------------------------------;
;Question b: paramreverse
;------------------------------------------------------------------------;

(define (paramreverse F AL)
  (let* ((single? (lambda (x) (null? (cdr x))))
        (reverse (lambda (L) (if (single? L)
                               (list (car L))
                               (append (reverse (cdr L)) (list (car L)))
                              )
                  )
        ))
    (apply F (reverse AL))
  )
)


;------------------------------------------------------------------------;
;Question c: highest
;------------------------------------------------------------------------;

(define (getmax L max)
  ;Get the maxmimum element in list L
  ;Args: L is target list, max is list with current max for recursive call
  (cond
      ((null? L) max) ;Reached end of list
      ((null? max) (getmax (cdr L) (cons (car L) '()))) ;List not null, but no current max- make (car L) max
      (else (cond
              ((> (car L) (car max)) (getmax (cdr L) (cons (car L) '())))
              ((<= (car L) (car max)) (getmax (cdr L) max))
             ))
  )
)

(define (popelem elemtopop L accumL)
  ;Helper function that pops elemtopop from L
  ;Returns all elements in L beside elemtopop (accumulated in accumL)
  ;Note assumes elemtopop is in popelem (or L empty)
  ;Doesn't handle elemtopop not in L (since called as helper
  ;only when max already found
  (cond
    ((null? L) '())
    ((not (= (car elemtopop) (car L))) (popelem elemtopop (cdr L) (append accumL (cons (car L) '()))))
    (else (append accumL (cdr L)))
  )
)


(define (accumulatemax L maxlist k)
  ;Proceeds recursively, decrementing k (number of max to find)
  ;Finds current max, then pops from L and appends to maxlist
  ;When k=0 then returns maxlist (accumulated maximum values)
  (let* ((max (getmax L '())) (newL (popelem max L '())))
   (if (>= 0 k)
      maxlist
      (accumulatemax newL (append maxlist max) (- k 1))
    )
  )
)
  
(define (highest L k)
  (accumulatemax L '() k)
)


;------------------------------------------------------------------------;
;Q4 mapfun
;------------------------------------------------------------------------;

(define (mapfun FL L)
  (let ((single? (lambda (x) (null? (cdr x)))))
    (cond
      ((or (null? FL) (null? L)) '()) ;Only true if either initial list null
      ((single? FL) (list ((car FL) (car L))))
      ((single? L) (list ((car FL) (car L))))
      (else (append (list ((car FL) (car L))) (mapfun (cdr FL) (cdr L))))
    )
  )
)

;------------------------------------------------------------------------;
;Q5 filter
;------------------------------------------------------------------------;
(define (filter pred L)
  (let ((single? (lambda (x) (null? (cdr x))))
        (pred_filter_non_single (lambda (L)
                                 (if (pred (car L))
                                     (list (car L))
                                     '()
                                 )
                                 )
        ))
    (cond
      ((null? L) '()) ;handle null lists to avoid infinite loop
      ((and (single? L) (pred (car L))) L) ;Test car L and return L if pred true
      ((and (single? L) (not (pred (car L)))) '());Note (append L '()) -> L
      (else (append (pred_filter_non_single L) (filter pred (cdr L))))
    )
  )
)