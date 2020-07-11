program demo_process_readall
use M_process,  only : process_readall
implicit none
integer                      :: ierr
character(len=:),allocatable :: string
   string=process_readall('ls',delim=NEW_LINE("A"),ierr=ierr)
   write(*,*)string
end program demo_process_readall
