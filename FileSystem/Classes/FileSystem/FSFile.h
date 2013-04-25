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
