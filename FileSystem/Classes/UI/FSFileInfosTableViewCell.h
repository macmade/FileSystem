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

#import "FSTableViewCell.h"

@class FSFile;

FOUNDATION_EXPORT NSString * const FSFileInfosTableViewCellID;

@interface FSFileInfosTableViewCell: FSTableViewCell
{
@protected
    
    FSFile  * _file;
    UILabel * _mainLabel;
    UILabel * _alternateLabel;
    
@private

    id __FSFileInfosTableViewCell_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readwrite, retain ) FSFile * file;

@end
