/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
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
