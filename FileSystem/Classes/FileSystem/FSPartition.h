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
 * @header      ...
 * @copyright   (c) 2013, Jean-David Gadina - www.xs-labs.com
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
