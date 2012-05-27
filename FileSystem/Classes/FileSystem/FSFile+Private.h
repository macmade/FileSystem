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

#import "FSFile.h"

@interface FSFile( Private )

- ( void )getPathInfos;
- ( void )getFileType;
- ( void )getOwnership;
- ( void )getPermissions;
- ( void )getFlags;
- ( void )getSize;
- ( void )getDates;
- ( void )getFileSystemAttributes;
- ( void )getSubTypes;
- ( UIImage * )iconByAddingEmblemsToImage: ( UIImage * )baseIcon;
- ( void )getIcon;

@end
