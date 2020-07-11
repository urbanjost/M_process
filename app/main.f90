program backwords
use M_process,  only : process_readall
implicit none
integer                      :: ierr
integer                      :: i
character(len=:),allocatable :: string
character(len=4096)          :: command
   write(*,'(a)',advance='no')'Enter command to read output from:'
   read(*,'(a)')command
   string=process_readall(command,delim=NEW_LINE("A"),ierr=ierr)
   ! parse on newline character and process the data
   ! using routines like split(3f) from M_strings(3fm) or in
   ! thi case, just echo it back reversed
   write(*,'(a)')'BACKWARDS' 
   write(*,'(*(a))',advance='no')(string(i:i),i=len(string),1,-1)
   write(*,'(a)')
   write(*,*)'FORWARDS' 
   write(*,'(a)',advance='no')string
end program backwords
