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

@class FSPartition;
@class FSFile;

FOUNDATION_EXPORT NSString * const FSPartitionTableViewCellID;

@interface FSPartitionTableViewCell: FSTableViewCell
{
@protected
    
    UILabel     * _nameLabel;
    UILabel     * _diskLabel;
    UILabel     * _spaceLabel;
    UILabel     * _typeLabel;
    FSPartition * _partition;
    FSFile      * _mountPoint;
    
@private

    id __FSPartitionTableViewCell_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readwrite, retain ) FSPartition * partition;
@property( atomic, readonly )          FSFile      * mountPoint;

- ( id )initWithPartition: ( FSPartition * )partition;

@end
