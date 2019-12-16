
# M_process.f90 and associated files

## NAME

   M_process - read and write lines to or from a process from Fortran via a C wrapper

## DESCRIPTION

This package is a self-contained version of the M_process library from
the GPF (General Purpose Fortran) package that has been extracted for
those just interested in a library of string-related functions. In the
GPF package this library is intertwined with several other large modules.

    git clone https://github.com/urbanjost/M_process.git
    cd M_process/src
    # change Makefile if not using gfortran(1)
    make

This will compile the M_process module and build all the example programs from
the document pages in the PROGRAMS/ sub-directory.

<?
<blockquote>
<table cellpadding="3">
<tr><td><a href="md/M_process.3.md">          M_process          </a></td><td> Fortran Module for calling process-related C functions from Fortran with the basic procedures:
<table>
<tr><td>  process_open_read  </td><td> open a process for reading</td></tr>
<tr><td>  process_readline   </td><td> read a line from the process</td></tr>
<tr><td>  process_open_write </td><td> open a process for writing</td></tr>
<tr><td>  process_writeline  </td><td> write a line to the process</td></tr>
<tr><td>  process_close      </td><td> close the process</td></tr>
</table>
</td>
</tr>

<tr><td><a href="md/process_readall.3.md">    process_readall    </a></td><td> read all output from the process</td></tr>
</table>
