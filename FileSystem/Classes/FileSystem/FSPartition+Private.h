/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @header      ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "FSPartition.h"

#include <sys/param.h>
#include <sys/ucred.h>
#include <sys/mount.h>

@interface FSPartition( Private )

- ( id )initWithStatFS: ( struct statfs * )infos;

@end
