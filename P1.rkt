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


(define (icebreaker-cola daemon puertos)
    (define (voltear lista resp)
        (if (null? lista)
            resp
            (voltear (cdr lista) (cons (car lista) resp))
        )
    )
    (let operacion ((ls puertos)(respuesta '()))
        (if (null? ls) 
            (voltear respuesta '())
            (let ((i (daemon (car ls))))
                (operacion (cdr ls) (cons i respuesta))
            )
        )
    )    
)



(icebreaker-simple (lambda (x) (* x 2)) '(4 8 15 2 7 14 1))


(icebreaker-cola (lambda (x) (* x 2)) '(4 8 15 2 7 14 1))

