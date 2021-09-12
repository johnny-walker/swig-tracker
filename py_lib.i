%module py_lib

%include <opencv.i>
%cv_instantiate_all_defaults

%{
    #include "py_lib.hpp"
%}

%include "py_lib.hpp"