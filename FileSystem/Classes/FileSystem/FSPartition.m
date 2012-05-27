/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "FSPartition.h"
#import "FSPartition+Private.h"

#include <sys/param.h>
#include <sys/ucred.h>
#include <sys/mount.h>

@implementation FSPartition

@synthesize blockSize       = _blockSize;
@synthesize ioSize          = _ioSize;
@synthesize blocks          = _blocks;
@synthesize freeBlocks      = _freeBlocks;
@synthesize availableBlocks = _availableBlocks;
@synthesize fileNodes       = _fileNodes;
@synthesize freeFileNodes   = _freeFileNodes;
@synthesize fileSystemID    = _fileSystemID;
@synthesize ownerID         = _ownerID;
@synthesize type            = _type;
@synthesize flags           = _flags;
@synthesize subType         = _subType;
@synthesize typeName        = _typeName;
@synthesize mountPoint      = _mountPoint;
@synthesize mountedFS       = _mountedFS;

+ ( NSArray * )availablePartitions
{
    NSMutableArray * partitions;
    FSPartition    * partition;
    struct statfs  * mntInfos;
    int              count;
    int              i;
    
    mntInfos   = NULL;
    partitions = [ NSMutableArray arrayWithCapacity: 10 ];
    
    if( ( count = getmntinfo( &mntInfos, MNT_WAIT ) ) )
    {
        for( i = 0; i < count; i++ )
        {
            partition = [ [ FSPartition alloc ] initWithStatFS: mntInfos ];
            
            [ partitions addObject: partition ];
            [ partition release ];
            
            mntInfos++;
        }
    }
    
    return [ NSArray arrayWithArray: partitions ];
}

- ( void )dealloc
{
    [ _typeName     release ];
    [ _mountPoint   release ];
    [ _mountedFS    release ];
    
    [ super dealloc ];
}

@end
