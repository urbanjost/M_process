# M_process.f90 and associated files
![process](images/M_process.gif)

## NAME

*M_process* - read and write lines to or from a process from Fortran via a C wrapper

## DESCRIPTION

The M_process Fortran module ( A fortran-lang.org [package](https://fortran-lang.org/packages/) )
reads and writes from processes by calling the C popen(3c) procedure.

## DOWNLOAD AND BUILD
Just download the github repository, enter the src/ directory and run make:

```bash
     git clone https://github.com/urbanjost/M_process.git
     cd M_process/src
     # change Makefile if not using gfortran(1)
     make
     # optionally
     make test # run the unit tests
     make run  # run all the demo programs from the manpages
     make help # see other developer options
```

This will compile the M_process module and optionally build all the example programs from
the document pages in the PROGRAMS/ sub-directory and run the unit tests.


## SUPPORTS FPM (registered at the [fpm(1) registry](https://github.com/fortran-lang/fpm-registry) )

Alternatively, download the github repository and build it with 
fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )

```bash
     git clone https://github.com/urbanjost/M_XXXXXXX.git
     cd M_XXXXXXX
     fpm build
     fpm test
```

or just list it as a dependency in your fpm.toml project file.

     [dependencies]
     M_XXXXXXX        = { git = "https://github.com/urbanjost/M_XXXXXXX.git" }

## SAMPLE PROGRAMS

The manpages contain small sample programs that have been extracted
and placed in the PROGRAMS/ directory. 

## DOCUMENTATION
There are currently several different ways to view the documentation ...

+ [BOOK_M_process](https://urbanjost.github.io/M_process/BOOK_M_process.html).
+ [manpage index](https://urbanjost.github.io/M_process/index.html)
+ [doxygen(1) output](https://urbanjost.github.io/M_process/doxygen_out/html/index.html).

_and there are manpages_ in the distribution in man/.

# RESPONSES

Discussion is welcome here as well as at
 - [Fortran Discourse](https://fortran-lang.discourse.group)
 - [Fortran Wiki](http://fortranwiki.org)
 - [Google Fortran newsgroup](https://groups.google.com/forum/#!forum/comp.lang.fortran)

## ALTERNATIVES

The Fortran Wiki [ fortranwiki.org ](http://fortranwiki.org) contains
information on other libraries and modules that provide I/O from 
procedures.
