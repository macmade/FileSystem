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

#include <sys/mount.h>

@interface FSPartition: NSObject
{
@protected
    
    uint32_t    _blockSize;
    int32_t     _ioSize;
    uint64_t    _blocks;
    uint64_t    _freeBlocks;
    uint64_t    _availableBlocks;
    uint64_t    _fileNodes;
    uint64_t    _freeFileNodes;
    fsid_t      _fileSystemID;
    uid_t       _ownerID;
    uint32_t    _type;
    uint32_t    _flags;
    uint32_t    _subType;
    NSString *  _typeName;
    NSString *  _mountPoint;
    NSString *  _mountedFS;
    
@private
    
    id __FSPartition_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readonly ) uint32_t    blockSize;
@property( atomic, readonly ) int32_t     ioSize;
@property( atomic, readonly ) uint64_t    blocks;
@property( atomic, readonly ) uint64_t    freeBlocks;
@property( atomic, readonly ) uint64_t    availableBlocks;
@property( atomic, readonly ) uint64_t    fileNodes;
@property( atomic, readonly ) uint64_t    freeFileNodes;
@property( atomic, readonly ) fsid_t      fileSystemID;
@property( atomic, readonly ) uid_t       ownerID;
@property( atomic, readonly ) uint32_t    type;
@property( atomic, readonly ) uint32_t    flags;
@property( atomic, readonly ) uint32_t    subType;
@property( atomic, readonly ) NSString *  typeName;
@property( atomic, readonly ) NSString *  mountPoint;
@property( atomic, readonly ) NSString *  mountedFS;

+ ( NSArray * )availablePartitions;

@end
