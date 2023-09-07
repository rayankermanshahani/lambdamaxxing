(require scheme)

; increment integer by 1
(define (inc x)
  (+ x 1))

; decrement integer by 1
(define (dec x)
  (- x 1))

; add two positive integers by decrementing the augend and incrementing the addend 
; until the augend reaches 0
(define (+ a b)
  (if (= a 0) 
    b
    (inc (+ (dec a) b))))

(display (+ 4 3))
(newline)


; illustrating the process generated by this first addition procedure:
; (+ 4 3)
; (inc (+ (dec 4) 3))
; (inc (inc (+ (dec 3) 3)))
; (inc (inc (inc (+ (dec 2) 3))))
; (inc (inc (inc (inc (+ (dec 1) 3)))))
; (inc (inc (inc (inc (3)))))
; (inc (inc (inc (4))))
; (inc (inc (5)))
; (inc (6))
; 7
;   this process is a recursive since there is the `inc` procedure still needs to be computed 
;   after the recursive call is completed. 
;   the generated process needs to remember the previous steps (keep track of deferred operations)


(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))
(display (+ 4 3))
(newline)

; illustrating the process generated by the second addition procedure:
; (+ 4 3)
; (+ (dec 4) (inc 3))
; (+ (+ (dec 3) (inc 4)))
; (+ (+ (+ (dec 2) (inc 5))))
; (+ (+ (+ (+ (dec 1) (inc 6)))))
; (+ (+ (+ (+ (0) (7)))))
; (+ (+ (+ (0) (7))))
; (+ (+ (0) (7)))
; (+ (0) (7))
; 7
;   this process is iterative because the interpreter doesn't need to keep track of the previous steps since the result of the recursive call is directly returned
