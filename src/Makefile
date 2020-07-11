#@(#) Makefile started by makeout(1) 2019-12-16 14:36:23
NULL=
#   ../PROGRAMS/demo_M_process/demo_M_process.f90 
#   had to remove capital M from program name because of fpm bug 20200711
PROGFILES = \
   ../PROGRAMS/demo_M_process/demo_m_process.f90        \
   ../PROGRAMS/demo_process_readall/demo_process_readall.f90  \
   $(NULL)
TESTFILES = ../test/test_suite.f90
TEST = ${TESTFILES:.f90=}
PROG = ${PROGFILES:.f90=}
SRCS =  M_process.f90 
OBJS =  M_process.o 
# platform-specific values you will probably change
# 
LIBS := 
F90 := gfortran
FFLAGS := -O
LDFLAGS := 
all: $(PROG) $(CPROG)
	@echo "That's all folks!"
$(PROG): $(OBJS)
	-$(F90) $(FFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)||echo "ouch: $@.f90 "
clean:
	rm -f $(PROG) $(CPROG) $(OBJS) *.mod sqlite1.db
.PHONY: help
help:
	: make    '-- build M_time module'
	: run     '-- run manpage demo programs and test program'
	: test    '-- run test program'
	: man     '-- show all manpages as text'
	: clean   '-- clean directory of object files and executables'
	: doxygen '-- run doxygen(1) if you have it'
	: help    '-- display this text'
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
	@env MANPATH=../man MANWIDTH=80  man --regex '.*'|col -b
########################################
.SUFFIXES: $(SUFFIXES) .f90 .F90
.f90.o:
	$(F90) $(F90FLAGS) -c $<
.F90.o:
	$(F90) $(F90FLAGS) -c $<
########################################
