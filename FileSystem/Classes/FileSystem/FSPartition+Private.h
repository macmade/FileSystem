/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @header      ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "FSPartition.h"

#include <sys/param.h>
#include <sys/ucred.h>
#include <sys/mount.h>

@interface FSPartition( Private )

- ( id )initWithStatFS: ( struct statfs * )infos;

@end
