#lang racket

(require rackunit)
(require rackunit/text-ui)

(provide examples
         (all-from-out rackunit))

(define test-cases '())

(begin-for-syntax
  ;; #t iff run-tests was added to the end of the file.
  (define run-tests? #f))

(define (add-test-case suite)
  (set! test-cases (cons suite test-cases)))

;; Special form to create testable examples
;; (examples exprs ...)
(define-syntax (examples stx)
  (syntax-case stx ()
    [(_ expr ...)
     (unless run-tests?
       (syntax-local-lift-module-end-declaration
        #'(begin (run-tests (make-test-suite "All tests" (reverse test-cases)))
                 (void)))
       (set! run-tests? #t))
     #'(add-test-case (test-suite "" expr ...))]))
