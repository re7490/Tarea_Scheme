#lang scheme
;;ROMPEHIELOS

;; ´PARA EJECUTAR EN BASH:: racket P1.rkt

(define (icebreaker-simple daemon puertos)
    (cond
        ((null? puertos) '())
        (else
            (cons (daemon (car puertos))
                (icebreaker-simple daemon (cdr puertos)))
        )
    )
)

;; ir hasta el final para empezar a aplicar lambda
(define (icebreaker-cola daemon puertos)
    (cond
        ((null? puertos) '())
        (else
        )
    )
)



(icebreaker-simple (lambda (x) (* x 2)) '(4 8 15))

