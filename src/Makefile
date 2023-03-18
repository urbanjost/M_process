#@(#) Makefile started by makeout(1) 2019-12-16 14:36:23
NULL=
PROGFILES = \
   ../example/demo_M_process.f90 \
   ../example/demo_process_close.f90 \
   ../example/demo_process_open_read.f90 \
   ../example/demo_process_open_write.f90 \
   ../example/demo_process_readall.f90 \
   ../example/demo_process_readline.f90 \
   ../example/demo_process_writeline.f90 \
   $(NULL)
TESTFILES = ../test/test_suite_M_process.f90
TEST = ${TESTFILES:.f90=}
PROG = ${PROGFILES:.f90=}
SRCS =  M_process.f90 
OBJS =  M_process.o 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# platform-specific values you will probably change
# 
LIBS := 
CC := cc
CFLAGS := -O
FC := gfortran
FFLAGS := -O
LDFLAGS := 
# 
# You can either ignore it, or disable the "may be used uninitialized"
# warnings with -Wno-maybe-uninitialized or compile with optimizations
# (-O1 and more).
gfortran: F90=gfortran
gfortran: F90FLAGS := -g -O -Wall -std=f2018 -Wextra -Wno-maybe-uninitialized -Wno-uninitialized
gfortran: all
	@echo built with $(F90)

nvfortran: F90=nvfortran
nvfortran: F90FLAGS := -Minform=inform -Mbackslash -traceback
nvfortran: all
	@echo built with $(F90)

ifort: F90=ifort
ifort: F90FLAGS := -warn all -traceback
ifort: all
	@echo built with $(F90)

nagfor: F90=nagfor
nagfor: F90FLAGS := -C all
nagfor: all
	@echo built with $(F90)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
all: $(PROG) $(CPROG)
	@echo "That's all folks!"
$(PROG): $(OBJS)
	-$(F90) $(FFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)||echo "ouch: $@.f90 "
clean:
	rm -f $(PROG) $(CPROG) $(OBJS) $(TEST) *.mod sqlite1.db
.PHONY: help
help:
	: make         '-- build M_time module'
	: make run     '-- run manpage demo programs and test program'
	: make test    '-- run test program'
	: make man     '-- show all manpages as text'
	: make clean   '-- clean directory of object files and executables'
	: make doxygen '-- run doxygen(1) if you have it'
	: make help    '-- display this text'
.PHONY: run
run: $(PROG)
	# run everything
	echo $? |xargs -n 1|xargs -iXX time XX
.PHONY: test
test: $(OBJS)
	# compile and load
	$(F90) $(LDFLAGS) $(TESTFILES) -o ${TESTFILES:.f90=} $(OBJS) $(LIBS)
	# run 
	${TESTFILES:.f90=}
.PHONY: doxygen
doxygen: 
	doxygen dox.in
.PHONY: man
man:
	@mandb ../man 1>&2
	@env MANPATH=../man MANWIDTH=256 man -k .|col -b
	@env MANPATH=../man MANWIDTH=80  man -Tutf8 --regex '.*'|col -b
########################################
.SUFFIXES: $(SUFFIXES) .f90 .F90
.f90.o:
	$(F90) $(F90FLAGS) -c $<
.F90.o:
	$(F90) $(F90FLAGS) -c $<
########################################
