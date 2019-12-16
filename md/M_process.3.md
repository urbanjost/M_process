<?
<body>
  <a name="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c1">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>M_process(3fm)</b> - [M_process] Fortran Module for calling process-related C functions from Fortran <b>(LICENSE:PD)</b>
      </blockquote><a name="contents"></a>
      <h3><a name="8">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
<b>use</b> M_process, <i>only</i> : process_open_read, process_open_write, <i>process_close</i>
<b>use</b> M_process, <i>only</i> : process_readline, process_readall, <i>process_writeline</i>
<b>use</b> M_process, <i>only</i> : streampointer, <i>process_debug</i>
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">DESCRIPTION</a></h3>
      <blockquote>
        Module <b>M_process</b>(3f) lets Fortran code read/write lines from/to processes.
        <p>These Fortran procedures <b>use</b> the ISO_C_BINDING interface to define Fortran-callable versions of the C procedures
        <b>popen</b>(3c)/pclose(3c) and <b>fgets</b>(3c)/fputs(3c). A set of record-oriented wrapper routines are then used to create a simple
        Fortran-callable interface.</p>
        <p>Basically, you</p>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>
            <td>Open a process for either reading from or writing to using formatted sequential text records (eg. "lines"); much like with a regular
            file.</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>pass a CHARACTER variable to/from the process that represents a record.</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>Use internal READs and internal WRITEs or parsing routines to create or interpret the lines.</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>when done close the process much like closing a file.</td>
          </tr>
        </table>The procedures defined are:
        <pre>
    ! open process to read from
    subroutine process_open_read(cmd,fp,ierr)
<br />
    ! open process to write to
    subroutine process_open_write(cmd,fp,ierr)
<br />
    ! read line from process
    subroutine process_readline(string,fp,ierr)
    ! read all of process output into a string string
    function process_readall(cmd,ierr) result (string)
<br />
    ! write lines to process
    subroutine process_writeline(string|string_array,fp,ierr[,trm=.t.|.f.])
<br />
    ! close process
    subroutine process_close(fp,ierr)
<br />
</pre>where the variable types are
        <pre>
      character(len=*)    :: cmd
      type(streampointer) :: fp
      character(len=*)    :: string
      integer             :: ierr
<br />
</pre>
      </blockquote><a name="3"></a>
      <h3><a name="3">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">cmd</td>
            <td valign="bottom">command passed to system to start process</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">fp</td>
            <td valign="bottom">C file pointer returned by process_open_*()</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">string</td>
            <td valign="bottom">data line to send or receive from process</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">ierr</td>
            <td valign="bottom">
              error flag returned. 
	      <br/><i>process_writeline</i>(3f) : negative indicates an error
              <br/><i>process_readline</i>(3f) : Non-zero indicates an error
             </td>
          </tr>
        </table>maximum character value length is currently 4096
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLES</a></h3>
      <blockquote>
        <p>An example that places all the output of a command into a single string variable (see <b>process_readall</b>(3) for an even simpler way to do
        this) ...</p>
        <pre>
      program read_ex
      use M_process ,only: process_open_read, process_readline
      use M_process ,only: streampointer, process_close
      implicit none
      ! C file pointer returned by process_open()
      type(streampointer) :: fp
      ! check status of calls to process module routines
      integer :: ierr
      ! hold results, assuming sufficient memory is available
      character(len=:),allocatable :: string
      ! long enough to hold any expected line
      character(len=4096) :: line
<br />
         string=''
<br />
         !###! open process to read from
         call process_open_read('ls',fp,ierr)
<br />
         !###! read output of process till end
         do
            call process_readline(line,fp,ierr)
            if(ierr.ne.0)exit
            !###! append output lines together
            string=string//trim(line)//' '
            write(*,*)'['//string//']'
         enddo
<br />
         write(*,*)trim(string)
<br />
         !###! Wrap up
         call process_close(fp,ierr)
<br />
<<<<<<< HEAD
      end program read_ex
</pre>
=======
</pre>
        <blockquote>
          end program read_ex
        </blockquote>
>>>>>>> aa2aa99ef26471e2518082e08fe9a98dfb36a7d4
        <p>When calling a line-mode program from another program the most natural way is to open a process and write to it.</p>
        <p>Following is an example program that calls the M_process module to start a plotting program called <b>gnuplot</b>(1) and give it enough commands
        to generate a plot. It then lets you interactively interact with the <b>gnuplot</b>(1) program or continue on in the program.</p>
        <pre>
    program gnuplotExample
    use M_process ,only: process_open_write, process_writeline
    use M_process ,only: streampointer, process_close
    implicit none
    !
    ! Example of Fortran writing GNUPLOT command and data file.
    !
    character(len=4096) :: line                             !*! line of data to write (assumed long enough to hold any command line)
    type(streampointer) :: fp                               !*! C file pointer returned by process_open()
    integer :: ierr                                         !*! check status of calls to process module routines
    integer :: i                                            !*! DO loop counter
    integer,parameter   :: n=50                             !*! number of points to put into curve to be plotted
    real                :: x(n),y(n)                        !*! arrays to fill with curve data to be plotted
    integer             :: ios
<br />
    !*! Define sample X,Y array.
    do i=1,n                                                !*! set X() values as whole numbers 1 to N
       x(i)=i
       !*!
       y(i)=(x(i)+0.5)**2
    enddo
                                                            !*! Write the GnuPlot commands
    call process_open_write('gnuplot',fp,ierr)              !*! open process to write to (ie. start gnuplot(1) program)
    call process_writeline('$SET1 &lt;&lt;EOD',fp,ierr)           !*! create in-line dataset $SET1
    do i=1,n
       write(line,'(2(f10.3,1x))')x(i),y(i)                 !*! Write the X,Y array as coordinates to be plotted.
       call process_writeline(line,fp,ierr)
    enddo
<br />
    call process_writeline([character(len=128) ::                        &amp;
    &amp;'EOD                                                             ', &amp;
    &amp;'set title " Example of GNUPlot data and command file generation"', &amp;
    &amp;'set nokey'                                                       , &amp;
    &amp;'plot $SET1 with lines'                                           , &amp;
    &amp;''],fp,ierr)
<br />
    write(*,'(a)')'enter gnuplot commands or "." to exit'   !*! Additional gnuplot commands; in this case interactively entered
    do
       write(*,'(a)',advance='no')'gnu&gt;&gt;'
       read(*,'(a)',iostat=ios)line
       if(line.eq.'.')exit
       call process_writeline(trim(line),fp,ierr)
    enddo
                                                            !*! Wrap up
    call process_close(fp,ierr)
    write(*,*)'CLOSED THE PROCESS. RETURNING TO PROGRAM'
    end program gnuplotExample
<br />
</pre>
      </blockquote>This program starts a bash shell that, among other things, calls sqlite3 and gnuplot. In this case the text is fixed to keep the example
      simple. More typically the text would be conditionally selected or generated by the program.
      <pre>
    program demo_M_process
    use M_process ,only : process_open_write, process_writeline
    use M_process ,only : streampointer, process_close
    implicit none
    type(streampointer) :: fp                     ! C file pointer returned by process_open()
    integer :: ierr                               ! check status of calls to process module routines
    character(len=:),allocatable :: text(:)
<br />
    !!call process_open_write('cat',fp,ierr)       ! open process to write to (ie. start gnuplot(1) program)
    call process_open_write('bash',fp,ierr)       ! open process to write to (ie. start gnuplot(1) program)
<br />
    text=[character(len=128) :: &amp;
    "rm -f sqlite1.db", &amp;
    "sqlite3 sqlite1.db &lt;&lt;\EOF", &amp;
    "-- *****************************************************************************", &amp;
    "CREATE TABLE IF NOT EXISTS animals(", &amp;
    "   name        TEXT           NOT NULL   PRIMARY KEY ,", &amp;
    "   hair        INT            NOT NULL   ,", &amp;
    "   mobility    INT            NOT NULL   ,", &amp;
    "   vision      INT            NOT NULL   );", &amp;
    "-- *****************************************************************************", &amp;
    "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'kittens'  , 4, 5, 1 ) ;", &amp;
    "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'mice'     , 6, 7, 2 ) ;", &amp;
    "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'rats'     , 2, 3, 3 ) ;", &amp;
    "-- *****************************************************************************", &amp;
    ".quit", &amp;
    "EOF", &amp;
    "################################################################################", &amp;
    "sqlite3 -header -column sqlite1.db  'select * from animals'", &amp;
    "sqlite3 sqlite1.db  'select name, hair, mobility, vision from animals'", &amp;
    "################################################################################", &amp;
    "gnuplot --persist &lt;&lt;\EOF                                                              ", &amp;
    "########################################                                              ", &amp;
    "#set terminal gif                                                                     ", &amp;
    "#set output 'M_process.3.gif'                                                         ", &amp;
    "########################################                                              ", &amp;
    "#set terminal png                                                                     ", &amp;
    "#set output 'bar.png'                                                                 ", &amp;
    "########################################                                              ", &amp;
    "#set terminal pdf enhanced                                                            ", &amp;
    "#set output 'bar.pdf'                                                                 ", &amp;
    "########################################                                              ", &amp;
    "#set style data lines                                                                 ", &amp;
    "########################################                                              ", &amp;
    "set datafile separator ""|""                                                          ", &amp;
    "set style data histogram                                                              ", &amp;
    "set style histogram cluster gap 1                                                     ", &amp;
    "set style fill solid border rgb ""black""                                             ", &amp;
    "set auto x                                                                            ", &amp;
    "set yrange [0:*]                                                                      ", &amp;
    "plot ""&lt; sqlite3 sqlite1.db  'select name, hair, mobility, vision  from animals'"" \  ", &amp;
    "      using 2:xtic(1) title ""hair"",  \                                              ", &amp;
    "   '' using 4:xtic(1) title ""vision"", \                                             ", &amp;
    "   '' using 3:xtic(1) title ""mobility""                                              ", &amp;
    "quit                                                                                  ", &amp;
    "EOF                                                                                   ", &amp;
    " "]
<br />
       !!write(*,'(a)')text
       call process_writeline(text,fp,ierr)
       call process_close(fp,ierr)
       write(*,'(a)')'CLOSED THE PROCESS. RETURNING TO PROGRAM'
<br />
</pre>
      <blockquote>
        end program demo_M_process
      </blockquote>
      <p>This example shows a routine to read the output of one command and other routine to write data to.</p>
      <pre>
   program test
      call readit('ls -l')
      call writeit('cat -n')
   contains
   !-------------------------------------------------------------------------------
   subroutine readit(cmd)
      use M_process ,ONLY: process_open_read, process_readline, streampointer, process_close
      type(streampointer) :: fp    ! C file pointer returned by process_open()
      character(len=*)    :: cmd   ! command line executed to start process
      character(len=4096) :: line  ! line of data to read (assumed long enough to hold any input line)
      integer ierr
      call process_open_read(cmd,fp,ierr)   ! open process to read from
      write(*,*)'READTEST: process is opened with status ',ierr
      ierr=0
      do while(ierr .eq. 0)
         call process_readline(line,fp,ierr)  ! read a line from the process
         if(ierr.ne.0)then
            write(*,*)'READTEST: ierr is ',ierr
            exit
         endif
         write(*,*)'READTEST: line:'//trim(line)
      enddo
      call process_close(fp,ierr)
      write(*,*)'READTEST: process closed with status ',ierr
   end subroutine readit
   !-------------------------------------------------------------------------------
   subroutine writeit(cmd)
   use M_process ,ONLY: process_open_write, process_writeline, streampointer, process_close
   type(streampointer) :: fp       ! C file pointer returned by process_open()
   character(len=*) :: cmd         ! command line executed to start process
      character(len=4096) :: line  ! line of data to write (assumed long enough to hold any output line)
      integer ierr
      integer i
      call process_open_write(cmd,fp,ierr)   ! open process to write to
      write(*,*)'WRITETEST: process is opened'
      ierr=0
      do i=1,10
         write(line,'("WRITETEST: line ",i0)')i
         call process_writeline(line,fp,ierr)
         if(ierr.lt.0)then
            write(*,*)'WRITETEST: process write error ',ierr
            exit
         endif
      enddo
      call process_close(fp,ierr)
      write(*,*)'WRITETEST: process closed with status ',ierr
   end subroutine writeit
   end program test
<br />
</pre><a name="5"></a>
      <h3><a name="5">SEE ALSO</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td width="3%">o</td>
            <td>PIPES: <b>pipe</b>(3c), <b>popen</b>(3c), <b>pclose</b>(3c), <b>fflush</b>(3c)</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>NAMED PIPES: <b>mkfifo</b>(3c), <b>mknod</b>(3c)</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>SUBPROCESSES: <b>fork</b>(3c)</td>
          </tr>
          <tr valign="top">
            <td width="3%">o</td>
            <td>OTHER: <b>fflush</b>(3c)</td>
          </tr>
        </table>
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
