!-==================================================================================================================================
program gnuplotexample
use, intrinsic :: iso_fortran_env, only : &
 & stdin=>input_unit, &
 & stdout=>output_unit, &
 & stderr=>error_unit
use m_process ,only: process_open_write, process_writeline
use m_process ,only: streampointer, process_close
implicit none
character(len=80)             ::  line  
character(len=*),parameter    :: g='(*(g0,1x))'
integer  ::  ierr, ios
integer  ::  i, j, k
integer , parameter  ::  n = 300 
real  ::  x(n) , y(n)            
type(streampointer) :: fp
   call process_open_write('gnuplot --persist',fp,ierr)
   write(stdout,*)'WRITETEST: process is opened with status ',ierr
   ! remember C and Fortran I/O are often independent of each other
   flush(stdout)
   call process_writeline( [character(len=80) :: &
    'set terminal X11',&
    'set nokey',&
    'set title " example of gnuplot data and command file generation"'],&
    fp,ierr)
   do j = 1 , 30000 , 1
      do i = 1 , n                            !*! set x() values as whole numbers 1 to n
         x(i) = i
         y(i) = sin(x(i)/25.0+j/40.0)
      enddo
      call plotit()
   enddo
   call process_close(fp,ierr)
   write(*,*)'WRITETEST: process closed with status ',ierr
contains
subroutine plotit()
   call process_writeline( '$set1 <<eod' ,fp,ierr)
   ierr=0
   do i = 1 , n
      write (line,g)' ', x(i) , y(i) !*! write the x,y array as coordinates to be plotted.
      call process_writeline(trim(line),fp,ierr)
      if(ierr.lt.0)then
        write(*,*)'WRITETEST: ierr is ',ierr
        exit
      endif
   enddo
   call process_writeline('eod',fp,ierr)
   call process_writeline('plot $set1 with lines lw 4',fp,ierr)
end subroutine plotit
end program gnuplotexample
