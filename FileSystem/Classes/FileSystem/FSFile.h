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

typedef enum
{
    FSFileFlagsArchived         = 0x01,
    FSFileFlagsHidden           = 0x02,
    FSFileFlagsNoDump           = 0x04,
    FSFileFlagsOpaque           = 0x08,
    FSFileFlagsSystemAppendOnly = 0x10,
    FSFileFlagsSystemImmutable  = 0x20,
    FSFileFlagsUserAppendOnly   = 0x40,
    FSFileFlagsUserImmutable    = 0x80
}
FSFileFlags;

@interface FSFile: NSObject
{
@protected
    
    BOOL            _isDirectory;
    BOOL            _isRegularFile;
    BOOL            _isSymbolicLink;
    BOOL            _isSocket;
    BOOL            _isCharacterSpecial;
    BOOL            _isBlockSpecial;
    BOOL            _isUnknown;
    BOOL            _isImmutable;
    BOOL            _isAppendOnly;
    BOOL            _isBusy;
    BOOL            _extensionIsHidden;
    BOOL            _isReadable;
    BOOL            _isWriteable;
    BOOL            _isExecutable;
    BOOL            _isImage;
    BOOL            _isAudio;
    BOOL            _isVideo;
    FSFileFlags     _flags;
    NSUInteger      _size;
    NSUInteger      _referenceCount;
    NSUInteger      _deviceIdentifier;
    NSUInteger      _ownerID;
    NSUInteger      _groupID;
    NSUInteger      _permissions;
    NSUInteger      _octalPermissions;
    NSUInteger      _systemNumber;
    NSUInteger      _systemFileNumber;
    NSUInteger      _HFSCreatorCode;
    NSUInteger      _HFSTypeCode;
    NSUInteger      _numberOfSubFiles;
    NSString      * _path;
    NSString      * _filename;
    NSString      * _displayName;
    NSString      * _fileExtension;
    NSString      * _parentDirectoryPath;
    NSString      * _type;
    NSString      * _humanReadableSize;
    NSString      * _owner;
    NSString      * _group;
    NSString      * _humanReadablePermissions;
    NSDate        * _creationDate;
    NSDate        * _modificationDate;
    UIImage       * _icon;
    NSDictionary  * _attributes;
    NSFileManager * _fileManager;
    FSFile        * _targetFile;
    
@private
    
    id __FSFile_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readonly ) BOOL          isDirectory;
@property( atomic, readonly ) BOOL          isRegularFile;
@property( atomic, readonly ) BOOL          isSymbolicLink;
@property( atomic, readonly ) BOOL          isSocket;
@property( atomic, readonly ) BOOL          isCharacterSpecial;
@property( atomic, readonly ) BOOL          isBlockSpecial;
@property( atomic, readonly ) BOOL          isUnknown;
@property( atomic, readonly ) BOOL          isImmutable;
@property( atomic, readonly ) BOOL          isAppendOnly;
@property( atomic, readonly ) BOOL          isBusy;
@property( atomic, readonly ) BOOL          extensionIsHidden;
@property( atomic, readonly ) BOOL          isReadable;
@property( atomic, readonly ) BOOL          isWriteable;
@property( atomic, readonly ) BOOL          isExecutable;
@property( atomic, readonly ) BOOL          isImage;
@property( atomic, readonly ) BOOL          isAudio;
@property( atomic, readonly ) BOOL          isVideo;
@property( atomic, readonly ) FSFileFlags   flags;
@property( atomic, readonly ) NSUInteger    size;
@property( atomic, readonly ) NSUInteger    referenceCount;
@property( atomic, readonly ) NSUInteger    deviceIdentifier;
@property( atomic, readonly ) NSUInteger    ownerID;
@property( atomic, readonly ) NSUInteger    groupID;
@property( atomic, readonly ) NSUInteger    permissions;
@property( atomic, readonly ) NSUInteger    octalPermissions;
@property( atomic, readonly ) NSUInteger    systemNumber;
@property( atomic, readonly ) NSUInteger    systemFileNumber;
@property( atomic, readonly ) NSUInteger    HFSCreatorCode;
@property( atomic, readonly ) NSUInteger    HFSTypeCode;
@property( atomic, readonly ) NSUInteger    numberOfSubFiles;
@property( atomic, readonly ) NSString    * path;
@property( atomic, readonly ) NSString    * filename;
@property( atomic, readonly ) NSString    * displayName;
@property( atomic, readonly ) NSString    * fileExtension;
@property( atomic, readonly ) NSString    * parentDirectoryPath;
@property( atomic, readonly ) NSString    * type;
@property( atomic, readonly ) NSString    * owner;
@property( atomic, readonly ) NSString    * group;
@property( atomic, readonly ) NSString    * humanReadableSize;
@property( atomic, readonly ) NSString    * humanReadablePermissions;
@property( atomic, readonly ) NSDate      * creationDate;
@property( atomic, readonly ) NSDate      * modificationDate;
@property( atomic, readonly ) UIImage     * icon;
@property( atomic, readonly ) FSFile      * targetFile;

+ ( FSFile * )fileWithPath: ( NSString * )filePath;
- ( id )initWithPath: ( NSString * )filePath;

@end
