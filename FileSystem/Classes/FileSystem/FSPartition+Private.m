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

#import "FSPartition+Private.h"

@implementation FSPartition( Private )

- ( id )initWithStatFS: ( struct statfs * )infos
{
    ( void )infos;
    
    if( infos == NULL )
    {
        return nil;
    }
    
    if( ( self = ( [ self init ] ) ) )
    {
        _blockSize          = infos->f_bsize;
        _ioSize             = infos->f_iosize;
        _blocks             = infos->f_blocks;
        _freeBlocks         = infos->f_bfree;
        _availableBlocks    = infos->f_bavail;
        _fileNodes          = infos->f_files;
        _freeFileNodes      = infos->f_ffree;
        _fileSystemID       = infos->f_fsid;
        _ownerID            = infos->f_owner;
        _type               = infos->f_type;
        _flags              = infos->f_flags;
        _subType            = infos->f_fssubtype;
        _typeName           = [ [ NSString alloc ] initWithCString: infos->f_fstypename  encoding: NSUTF8StringEncoding ];
        _mountPoint         = [ [ NSString alloc ] initWithCString: infos->f_mntonname   encoding: NSUTF8StringEncoding ];
        _mountedFS          = [ [ NSString alloc ] initWithCString: infos->f_mntfromname encoding: NSUTF8StringEncoding ];
    }
    
    return self;
}

@end
