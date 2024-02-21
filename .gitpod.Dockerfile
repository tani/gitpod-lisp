FROM gitpod/workspace-full
RUN brew install sbcl
RUN wget https://beta.quicklisp.org/quicklisp.lisp && \
    sbcl --eval '(load "quicklisp.lisp")' \
         --eval '(quicklisp-quickstart:install)' \
         --eval '(ql:quickload `(bordeaux-threads usocket cl-json flexi-streams))' \
         --eval '(quit)' && \
    rm quicklisp.lisp && \
    echo '#-quicklisp' >> ~/.sbclrc && \
    echo '(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))' >> ~/.sbclrc && \
    echo '  (when (probe-file quicklisp-init) (load quicklisp-init)))' >> ~/.sbclrc && \
    echo '(asdf:initialize-source-registry `(:source-registry (:tree ,*default-pathname-defaults*) :inherit-configuration))' >> ~/.sbclrc
