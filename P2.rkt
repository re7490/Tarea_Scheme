#lang scheme

(define (crear-gusano vulnerabilidad)
    (lambda (memoria)
        (letrec 
            ((loop (lambda (m)
                (cond
                    ((null? m) '())
                    ((list? (car m))
                        (cons (loop (car m)) (loop (cdr m)))
                    )
                    ((vulnerabilidad (car m))
                        (cons (car m) (loop (cdr m)))
                    )
                    (else
                        (cons 'X (loop (cdr m)))
                    )
                )
            )))
            (loop memoria)
        )   
    )
)

(define (vulnerable-a-viejos? x) (<= x 15))
(define gusano-windowsXP (crear-gusano vulnerable-a-viejos?))

(gusano-windowsXP '(1 2 3 (1 3 8) 15 (20 6 76 09 90 21 3) 4 5 9 8 0 20 36 7 76 7 8 67))