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
            <td class="c2" colspan="2">process_readall</td>
          </tr>
          <tr valign="top">
            <td width="6%"> </td>
            <td>Assuming sufficient memory is available all the output of the system command are concatenated into a string with spaces added between the
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
</pre>Read all output of a command to an array using <b>split</b>(3f)
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
        <blockquote>
          <table cellpadding="3">
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">1</td>
              <td valign="bottom">[Articles]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">2</td>
              <td valign="bottom">[LIBRARY]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">3</td>
              <td valign="bottom">[PC]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">4</td>
              <td valign="bottom">[SHIP]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">5</td>
              <td valign="bottom">[SPEC]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">6</td>
              <td valign="bottom">[crib.dat]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">7</td>
              <td valign="bottom">[doc]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">8</td>
              <td valign="bottom">[html]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">9</td>
              <td valign="bottom">[index.html]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">10</td>
              <td valign="bottom">[plan.txt]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">11</td>
              <td valign="bottom">[questions]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">12</td>
              <td valign="bottom">[scripts]</td>
            </tr>
            <tr valign="top">
              <td class="c2" width="6%" nowrap="nowrap">13</td>
              <td valign="bottom">[tmp]</td>
            </tr>
          </table>
        </blockquote>
      </blockquote><a name="5"></a>
      <h3><a name="5">SEE ALSO</a></h3>
      <blockquote>
        <b>M_process</b>(3fm)
      </blockquote><a name="6"></a>

    </div>
  </div>
</body>
