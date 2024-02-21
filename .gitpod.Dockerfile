FROM gitpod/workspace-full
RUN brew install sbcl
RUN wget https://beta.quicklisp.org/quicklisp.lisp && \
    sbcl --eval '(load "quicklisp.lisp")' \
         --eval '(quicklisp-quickstart:install)' \
         --eval '(ql:quickload `(bordeaux-threads usocket cl-json flexi-streams))' \
         --eval '(ql:add-to-init-file)' \
         --eval '(quit)' && \
    rm quicklisp.lisp && \
    echo "(asdf:initialize-source-registry '(:source-registry (:tree ,*default-pathname-defaults*) :inherit-configuration))" >> ~/.sbclrc
