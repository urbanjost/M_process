#@(#) Makefile started by makeout(1) 2019-12-16 14:36:23

PROGFILES = PROGRAMS/demo_M_process.f90 PROGRAMS/process_readall_3_.f90

CPROGFILES = 

PROG = ${PROGFILES:.f90=}

CPROG = ${CPROGFILES:.c=}

SRCS =  M_process.f90 

OBJS =  M_process.o 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# platform-specific values you will probably change
# 
LIBS := -lncurses -lsqlite3 -lreadline
CC := cc
CFLAGS := -O
FC := gfortran
FFLAGS := -O
F90 := gfortran
F90FLAGS := -O
LDFLAGS := 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
all: $(PROG) $(CPROG)
	@echo "That's all folks!"

$(PROG): $(OBJS)

	-$(F90) $(LDFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)||echo "ouch: $@.f90 "

clean:
	rm -f $(PROG) $(CPROG) $(OBJS) *.mod

.SUFFIXES: $(SUFFIXES) .f90 .F90

.f90.o:
	$(F90) $(F90FLAGS) -c $<

.F90.o:
	$(F90) $(F90FLAGS) -c $<
