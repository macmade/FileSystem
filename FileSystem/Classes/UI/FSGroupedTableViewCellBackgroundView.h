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
    FSGroupedTableViewCellBackgroundViewTypeTop    = 0x00,
    FSGroupedTableViewCellBackgroundViewTypeMiddle = 0x01,
    FSGroupedTableViewCellBackgroundViewTypeBottom = 0x02,
    FSGroupedTableViewCellBackgroundViewTypeSingle = 0x03
}
FSGroupedTableViewCellBackgroundViewType;

@interface FSGroupedTableViewCellBackgroundView: UIView
{
@protected
    
    UIColor                                * _borderColor;
    UIColor                                * _fillColor;
    CGFloat                                  _borderWidth;
    CGFloat                                  _borderRadius;
    FSGroupedTableViewCellBackgroundViewType _backgroundViewType;
    
@private
    
    id __FSGroupedTableViewCellBackgroundView_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, retain, readwrite ) UIColor                                * borderColor;
@property( atomic, retain, readwrite ) UIColor                                * fillColor;
@property( atomic, assign, readwrite ) CGFloat                                  borderWidth;
@property( atomic, assign, readwrite ) CGFloat                                  borderRadius;
@property( atomic, assign, readwrite ) FSGroupedTableViewCellBackgroundViewType backgroundViewType;

@end
