/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *  -   Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *  -   Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *  -   Neither the name of 'Jean-David Gadina' nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   (c) 2013, Jean-David Gadina - www.xs-labs.com
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
