#lang racket
(require berkeley)

#|
  File: week_01/lab.rkt
  Author: Jack McNish
  Date: June 5, 2024
  Comments: Solutions to week 1 lab exercises
|#

(+ 1 (+ 2 3))

;; Week 1 First Lab
;; Ignored Exercises: 1., 2., 3., 4., 5.

;; Week 1 Second Lab
;; Ignored exercises: 1., 2.

;; 3.
(define (sum-max-squares a b c)
  (+ (* (max a b c) (max a b c))
     (* (- (+ a b c)
           (max a b c)
           (min a b c))
        (- (+ a b c) (max a b c) (min a b c)))))

;; 4.
(define (dupls-removed sent)
  (cond ((empty? sent) '())
        ((member? (first sent) (butfirst sent)) (dupls-removed (bf sent)))
        (else (se (first sent) (dupls-removed (bf sent))))))

(dupls-removed '(a b c a e d e b))  ;; '(c a d e b)
(dupls-removed '(a b c))            ;; '(a b c)
(dupls-removed '(a a a a b a a))    ;; '(a b c)