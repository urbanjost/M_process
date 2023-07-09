
[![process](docs/images/M_process.gif)](https://urbanjost.github.io/M_process/fpm-ford/index.html)
# [M_process](https://urbanjost.github.io/M_process/man3.html)

## Name

*M_process* - read and write lines to or from a process from Fortran via a C wrapper

## Description

The M_process Fortran module ( A fortran-lang.org [package](https://fortran-lang.org/packages/) )
reads and writes from processes by calling the C popen(3c) procedure.

__NB. These procedures require a platform that supports POSIX routines
and the popen(3c) procedure in particular__.

## Download and Build using make(1)![GNU](docs/images/gnu.gif)
Just download the github repository, enter the src/ directory and run make:

```bash
     git clone https://github.com/urbanjost/M_process.git
     cd M_process/src

     # change Makefile if not using one of the listed compilers

     # for gfortran
     make clean
     make F90=gfortran gfortran

     # for ifort
     make clean
     make F90=ifort ifort

     # for nvfortran
     make clean
     make F90=nvfortran nvfortran

     # optionally
     make test               # run the unit tests (needs M_framework(3f) module)
     make run  --example "*" # run all the demo programs from the man-pages
     make help               # see other developer options
```

This will compile the M_process module and optionally build all the
example programs from the document pages in the example/ sub-directory
and run the unit tests.

## Supports FPM ![fpm](docs/images/fpm_logo.gif)
#### (registered at the [fpm(1) registry](https://github.com/fortran-lang/fpm-registry) )

Alternatively, download the github repository and
build it with fpm ( as described at [Fortran Package
Manager](https://github.com/fortran-lang/fpm) )

```bash
     git clone https://github.com/urbanjost/M_process.git
     cd M_process
     fpm build
     fpm test
```

or just list it as a dependency in your fpm.toml project file.

```toml
     [dependencies]
     M_process        = { git = "https://github.com/urbanjost/M_process.git" }
```

## Demo Programs![demos](docs/images/demo.gif)

The man-pages contain small sample programs that have been extracted
and placed in the [example/](example/) directory.

## Documentation   ![docs](docs/images/docs.gif)

### User
There are currently several different ways to view the documentation ...

+ [BOOK_M_process](https://urbanjost.github.io/M_process/BOOK_M_process.html).
+ [manpage index](https://urbanjost.github.io/M_process/man3.html)

_and there are man-pages_ in the distribution in
+ [manpages.tgz](https://urbanjost.github.io/M_process/manpages.tgz) or
+ [manpages.zip](https://urbanjost.github.io/M_process/manpages.zip)
+ [CHANGELOG](docs/CHANGELOG.md) provides a history of significant changes

### Developer
   + [ford(1) output](https://urbanjost.github.io/M_process/fpm-ford/index.html).
   + [doxygen(1) output](https://urbanjost.github.io/M_process/doxygen_out/html/index.html).
   + [github action status](docs/STATUS.md)

## Alternatives

The Fortran Wiki [ fortranwiki.org ](http://fortranwiki.org) contains
information on other libraries and modules that provide access to processes and threads.
