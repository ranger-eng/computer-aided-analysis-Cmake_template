A template for linking libport3.d into c programs using cmake to automate the build procedure. 
libport3.d is compiled form source, and a convenience header is autogenerated that guarentees predictable fortran to c function name mangling.

usage:
> git clone git@github.com:ranger-eng/computer-aided-analysis-Cmake_template.git  
> mkdir ./build  
> cd ./build  
> cmake ..  
> make  
> ./bin/*executables*  


