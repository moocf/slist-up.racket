#lang racket

; (slist.up-sexp-to sexp to)
; removes a pair of parentheses from s-exp to list "to"
; : sexp=list -> (sexp .. to) (append)
; : else      -> (sexp . to)
(define slist.up-sexp-to
  (lambda (sexp to)
    (if (list? sexp)
        (append sexp to)
        (cons sexp to))))

; (slist.up-to lst to): L X L -> L
; removes a pair of parentheses from each top-level element of lst to list "to"
; : lst=null -> to
; : else     -> (slist.up-sexp-to lst[0] (slist.up-to lst[1..end] to))
(define slist.up-to
  (lambda (lst to)
    (if (null? lst)
        to
        (slist.up-sexp-to (car lst) (slist.up-to (cdr lst) to)))))

; (slist.up lst): L -> L
; removes a pair of parentheses from each top-level element of lst
(define slist.up
  (lambda (lst)
    (slist.up-to lst (list))))
