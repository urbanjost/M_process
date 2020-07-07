<?
<body>
  <a name="top"></a>
  <div id="Container">
    <div id="Content">
      <div class="c1">
      </div><a name="0"></a>
      <h3><a name="0">NAME</a></h3>
      <blockquote>
        <b>process_readall(3f)</b> - [M_process] read all lines from process into single string <b>(LICENSE:PD)</b>
      </blockquote><a name="contents"></a>
      <h3><a name="8">SYNOPSIS</a></h3>
      <blockquote>
        <pre>
syntax:
<br />
   function process_readall(cmd,delim,ierr)  result(string)
<br />
      character(len=*),intent(in)              :: cmd
      character(len=*),intent(in),optional     :: delim
      integer,intent(out),optional             :: ierr
      character(len=:),allocatable             :: string
</pre>
      </blockquote><a name="2"></a>
      <h3><a name="2">OPTIONS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">cmd</td>
            <td valign="bottom">command to pass to system</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">delim</td>
            <td valign="bottom">delimiter to place between output lines when they are concatenated. Defaults to a space</td>
          </tr>
          <tr valign="top">
            <td class="c2" width="6%" nowrap="nowrap">ierr</td>
            <td valign="bottom">check status of call.</td>
          </tr>
        </table>
      </blockquote><a name="3"></a>
      <h3><a name="3">RESULTS</a></h3>
      <blockquote>
        <table cellpadding="3">
          <tr valign="top">
            <td class="c2" colspan="1">process_readall</td>
            <td>Assuming sufficient memory is available all the output of the system command is concatenated into a string with spaces added between the
            output lines of the command.</td>
          </tr>
        </table>
      </blockquote><a name="4"></a>
      <h3><a name="4">EXAMPLE</a></h3>
      <blockquote>
        <p>Read all output of a command to a single string</p>
        <pre>
      program test_process_readall
      use M_process ,only: process_readall
      implicit none
      integer :: ierr
      character(len=:),allocatable :: string
         string=process_readall('ls',ierr=ierr)
         write(*,*)ierr,string
      end program test_process_readall
<br />
</pre>
Read all output of a command to an array using <b>split</b>(3f)
<em>(requires the M_strings(3f) module to split the string)</em>
        <pre>
      program demo_process_readall
      use M_process ,only: process_readall
      use M_strings ,only: split
      implicit none
      integer                      :: ierr
      integer                      :: i
      character(len=:),allocatable :: string
      character(len=:),allocatable :: array(:)
         string=process_readall('ls',delim=NEW_LINE("A"),ierr=ierr)
         call split(string,array,delimiters=NEW_LINE("A"))
         do i=1,size(array)
            write(*,'(i0,t10,"[",a,"]")')i,trim(array(i))
         enddo
      end program demo_process_readall
<br />
</pre>Results:
      <pre>
    1  [Articles]
    2  [LIBRARY]
    3  [PC]
    4  [SHIP]
    5  [SPEC]
    6  [crib.dat]
    7  [doc]
    8  [html]
    9  [index.html]
    10 [plan.txt]
    11 [questions]
    12 [scripts]
    13 [tmp]
</pre>

      </blockquote><a name="5"></a>
      <h3><a name="5">SEE ALSO</a></h3>
      <blockquote>
        <b>M_process</b>(3fm)
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
