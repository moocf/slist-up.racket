#lang racket

; (up.sexp sexp to)
; removes a pair of parentheses from s-exp to list "to"
; : sexp=list -> (sexp .. to) (append)
; : else      -> (sexp . to)
(define up.sexp
  (lambda (sexp to)
    (if (list? sexp)
        (append sexp to)
        (cons sexp to))))

; (up.lst lst to): L X L -> L
; removes a pair of parentheses from each top-level element of lst to list "to"
; : lst=null -> to
; : else     -> (up.sexp lst[0] (up.lst lst[1..end] to))
(define up.lst
  (lambda (lst to)
    (if (null? lst)
        to
        (up.sexp (car lst) (up.lst (cdr lst) to)))))

; (up lst): L -> L
; removes a pair of parentheses from each top-level element of lst
(define up
  (lambda (lst)
    (up.lst lst (list))))
