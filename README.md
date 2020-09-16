# Examples

A simple way of writing tests in Racket.

```racket
#lang racket

(require examples)

(examples
 (check-equal? (add 2 4) 6))

(define (add x y)
    (+ x y))
```


All check expressions from [`rackunit`](https://docs.racket-lang.org/rackunit/index.html) are reexported by the examples module.
