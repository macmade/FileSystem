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
