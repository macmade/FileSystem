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

#import "FSTableViewCell.h"

FOUNDATION_EXPORT NSString * const FSFileListTableViewCellID;

@class FSFile;

@interface FSFileListTableViewCell: FSTableViewCell
{
@protected
    
    FSFile  * _file;
    UILabel * _mainLabel;
    UILabel * _alternateLabel;
    BOOL      _showInfos;
    BOOL      _alternateBackground;
    
@private

    id __FSFileListTableViewCell_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readwrite, retain ) FSFile * file;
@property( atomic, readwrite, assign ) BOOL     alternateBackground;

- ( IBAction )toggleDisplay: ( id )sender;

@end
