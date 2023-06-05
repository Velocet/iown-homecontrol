/*******************
 *
 * Copyright 1998-2003 IAR Systems.  All rights reserved.
 *
 * $Revision: 38614 $  ( file changed by VELUX )
 *
 * Modified version of the template provided by IAR.
 *
 ********************/
#include <stdint.h>
#include <yfuns.h>
#include "debug.h"

#ifndef NDEBUG
  

#pragma module_name = "?__write"

/*
 * If the __write implementation uses internal buffering, uncomment
 * the following line to ensure that we are called with "buffer" as 0
 * (i.e. flush) when the application terminates.
 */

size_t __write(int handle, const unsigned char * buffer, size_t size)
{
  size_t nChars = 0;

  if (buffer == 0)
  {
	/*
	 * This means that we should flush internal buffers.  Since we
	 * don't we just return.  (Remember, "handle" == -1 means that all
	 * handles should be flushed.)
	 */
	return 0;
  }

  /* This template only writes to "standard out" and "standard err",
   * for all other file handles it returns failure. */
  if (handle != _LLIO_STDOUT && handle != _LLIO_STDERR)
  {
	return _LLIO_ERROR;
  }

  /* Hook into USART1 transmit function here */
  if (DEBUG_TxBuf((uint8_t *) buffer, size) != size)
  {
	return _LLIO_ERROR;
  }
  else
  {
	nChars = size;
  }

  return nChars;
}

#endif
