	  
  /* readahead -- set & get the read_ahead value for the specified 
device
  */

  #include "stdio.h"
  #include "stdlib.h"
  #include "linux/fs.h"
  #include "asm/fcntl.h"

  void usage()
  {
    printf( "usage:  readahead <device> [newvalue]\n" );

  }/* usage() */


  int main( int args, char **argv )
  {
    int fd;
    int oldvalue;
    int newvalue;

    if ( args <= 1 ) {
      usage();
      return(1);
    }

    if ( args >= 3 && !isdigit(argv[2][0]) ) {
      printf( "readahead: invalid number.\n" );
      return(1);
    }

    fd = open( argv[1], O_RDONLY );
    if ( fd == -1 ) {
      printf( "readahead: unable to open device %s\n", argv[1] );
      return(1);
    }

    if ( ioctl(fd, BLKRAGET, &oldvalue) ) {
      printf( "readahead: unable to get read_ahead value from "
              "device %s\n", argv[1] );
      close (fd);
      return(1);
    }

    if ( args >= 3 ) {
      newvalue = atoi( argv[2] );
      if ( ioctl(fd, BLKRASET, newvalue) ) {
        printf( "readahead: unable to set %s's read_ahead to %d\n",
                argv[1], newvalue );
        close (fd);
        return(1);
      }
    }
    else {
      printf( "%d\n", oldvalue );
    }

    close (fd);
    return(0);

  }/* main */

