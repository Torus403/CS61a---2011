#lang racket
(require berkeley)

#|
  File: week_01/hw.rkt
  Author: Jack McNish
  Date: June 6, 2024
  Comments: Solutions to week 1 homework exercises
|#

;; Ignored Exercises: 1.

;; 2.
(define (squares numbers)
  (if (empty? numbers)
      '()
      (se (sqr (first numbers)) (squares (bf numbers)))))

(squares '(2 3 4 5))  ;; '(4 9 16 25)

;; 3.
(define (switch sent)
  (cond ((empty? sent) '())
        ((equal? (first sent) 'You) (se 'I (switch (bf sent))))
        ((equal? (first sent) 'you) (se 'me (switch (bf sent))))
        ((or (equal? (first sent) 'I) (equal? (first sent) 'me)) (se 'you (switch (bf sent))))
        (else (se (first sent) (switch (bf sent))))))

(switch '(You told me that I should wake you up))  ;; '(I told you that you should wake me up)

;; 4.
(define (ordered? numbers)
  (cond ((empty? (bf numbers)) #t)
        ((> (first numbers) (first (bf numbers))) #f)
        (else (ordered? (bf numbers)))))

;; 5.
(define (ends-e sent)
  (cond ((empty? sent) '())
        ((equal? (last (first sent)) 'e) (se (first sent) (ends-e (bf sent))))
        (else (ends-e (bf sent)))))

(ends-e '(please put the salami above the blue elephant)) ;; '(please the above the blue)

;; 6.
;; you can test this by making a cond with an error in one of the branches which isn't supposed to be
;; evaluated