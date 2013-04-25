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

#import "FSFile.h"
#import "FSFile+Private.h"

@implementation FSFile

@synthesize isDirectory                 = _isDirectory;
@synthesize isRegularFile               = _isRegularFile;
@synthesize isSymbolicLink              = _isSymbolicLink;
@synthesize isSocket                    = _isSocket;
@synthesize isCharacterSpecial          = _isCharacterSpecial;
@synthesize isBlockSpecial              = _isBlockSpecial;
@synthesize isUnknown                   = _isUnknown;
@synthesize isImmutable                 = _isImmutable;
@synthesize isAppendOnly                = _isAppendOnly;
@synthesize isBusy                      = _isBusy;
@synthesize isImage                     = _isImage;
@synthesize isAudio                     = _isAudio;
@synthesize isVideo                     = _isVideo;
@synthesize flags                       = _flags;
@synthesize extensionIsHidden           = _extensionIsHidden;
@synthesize isReadable                  = _isReadable;
@synthesize isWriteable                 = _isWriteable;
@synthesize isExecutable                = _isExecutable;
@synthesize size                        = _size;
@synthesize referenceCount              = _referenceCount;
@synthesize deviceIdentifier            = _deviceIdentifier;
@synthesize ownerID                     = _ownerID;
@synthesize groupID                     = _groupID;
@synthesize permissions                 = _permissions;
@synthesize octalPermissions            = _octalPermissions;
@synthesize systemNumber                = _systemNumber;
@synthesize systemFileNumber            = _systemFileNumber;
@synthesize HFSCreatorCode              = _HFSCreatorCode;
@synthesize HFSTypeCode                 = _HFSTypeCode;
@synthesize numberOfSubFiles            = _numberOfSubFiles;
@synthesize path                        = _path;
@synthesize filename                    = _filename;
@synthesize displayName                 = _displayName;
@synthesize fileExtension               = _fileExtension;
@synthesize parentDirectoryPath         = _parentDirectoryPath;
@synthesize type                        = _type;
@synthesize owner                       = _owner;
@synthesize group                       = _group;
@synthesize humanReadableSize           = _humanReadableSize;
@synthesize humanReadablePermissions    = _humanReadablePermissions;
@synthesize creationDate                = _creationDate;
@synthesize modificationDate            = _modificationDate;
@synthesize icon                        = _icon;
@synthesize targetFile                  = _targetFile;

+ ( FSFile * )fileWithPath: ( NSString * )filePath
{
    FSFile * fileInfos;
    
    fileInfos = [ [ FSFile alloc ] initWithPath: filePath ];
    
    return [ fileInfos autorelease ];
}

- ( id )initWithPath: ( NSString * )filePath
{
    NSString * symLinkTarget;
    NSError  * e;
    
    if( ( self = [ super init ] ) )
    {
        _path        = [ filePath copy ];
        _fileManager = [ NSFileManager defaultManager ];
        
        if( [ _fileManager fileExistsAtPath: _path ] == NO )
        {
            [ self autorelease ];
            
            return nil;
        }
        
        e           = nil;
        _attributes = [ [ _fileManager attributesOfItemAtPath: _path error: &e ] retain ];
        
        if( _attributes == nil || e != nil )
        {
            [ self autorelease ];
            
            return nil;
        }
        
        [ self getPathInfos ];
        [ self getFileType ];
        [ self getOwnership ];
        [ self getPermissions ];
        [ self getFlags ];
        [ self getSize ];
        [ self getDates ];
        [ self getFileSystemAttributes ];
        
        if( _isDirectory == YES )
        {
            _numberOfSubFiles = [ [ _fileManager contentsOfDirectoryAtPath: _path error: NULL ] count ];
        }
        
        if( _isSymbolicLink == YES )
        {
            symLinkTarget = [ _fileManager destinationOfSymbolicLinkAtPath: _path error: NULL ];
            
            if( [ symLinkTarget characterAtIndex: 0 ] != '/' )
            {
                if( [ _parentDirectoryPath characterAtIndex: [ _parentDirectoryPath length ] - 1 ] == '/' )
                {
                    symLinkTarget = [ _parentDirectoryPath stringByAppendingString: symLinkTarget ];
                }
                else
                {
                    symLinkTarget = [ NSString stringWithFormat: @"%@/%@", _parentDirectoryPath, symLinkTarget ];
                }
            }
            
            _targetFile = [ [ FSFile alloc ] initWithPath: symLinkTarget ];
        }
        
        [ self getSubTypes ];
        [ self getIcon ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _path                     release ];
    [ _filename                 release ];
    [ _displayName              release ];
    [ _fileExtension            release ];
    [ _parentDirectoryPath      release ];
    [ _attributes               release ];
    [ _owner                    release ];
    [ _group                    release ];
    [ _humanReadablePermissions release ];
    [ _type                     release ];
    [ _humanReadableSize        release ];
    [ _creationDate             release ];
    [ _modificationDate         release ];
    [ _icon                     release ];
    [ _targetFile               release ];
    
    [ super dealloc ];
}

- ( NSString * )description
{
    return [ NSString stringWithFormat: @"%@ - %@", [ super description ], self.path ];
}

@end
