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

#import "FSGroupedTableViewCellBackgroundView.h"

@implementation FSGroupedTableViewCellBackgroundView

@synthesize borderColor        = _borderColor;
@synthesize fillColor          = _fillColor;
@synthesize borderWidth        = _borderWidth;
@synthesize borderRadius       = _borderRadius;
@synthesize backgroundViewType = _backgroundViewType;

- ( id )initWithFrame: ( CGRect )frame
{
    if( ( self = [ super initWithFrame: frame ] ) )
    {
        self.borderColor        = [ UIColor lightGrayColor ];
        self.fillColor          = [ UIColor whiteColor ];
        self.borderWidth        = ( CGFloat )0.5;
        self.borderRadius       = 10;
        self.backgroundViewType = FSGroupedTableViewCellBackgroundViewTypeMiddle;
    }
    
    return self;
}

- ( void )dealloc
{
    [ _borderColor release ];
    [ _fillColor   release ];
    
    [ super dealloc ];
}

- ( BOOL )isOpaque
{
    return NO;
}

-( void )drawRect: ( CGRect )rect 
{
    CGFloat      minX;
    CGFloat      minY;
    CGFloat      midX;
    CGFloat      midY;
    CGFloat      maxX;
    CGFloat      maxY;
    CGContextRef context;
    
    context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor( context, [ _fillColor CGColor ] );
    CGContextSetStrokeColorWithColor( context, [ _borderColor CGColor ] );
    CGContextSetLineWidth( context, _borderWidth );
    
    if( _backgroundViewType == FSGroupedTableViewCellBackgroundViewTypeTop )
    {
        minX  = CGRectGetMinX( rect );
        midX  = CGRectGetMidX( rect );
        maxX  = CGRectGetMaxX( rect );
        minY  = CGRectGetMinY( rect );
        maxY  = CGRectGetMaxY( rect );
        minX += _borderWidth;
        minY += _borderWidth;
        maxX -= _borderWidth;
        
        CGContextMoveToPoint( context, minX, maxY );
        CGContextAddArcToPoint( context, minX, minY, midX, minY, _borderRadius );
        CGContextAddArcToPoint( context, maxX, minY, maxX, maxY, _borderRadius );
        CGContextAddLineToPoint( context, maxX, maxY );
        CGContextClosePath( context );
        CGContextDrawPath( context, kCGPathFillStroke );
    }
    else if( _backgroundViewType == FSGroupedTableViewCellBackgroundViewTypeBottom )
    {
        minX  = CGRectGetMinX( rect );
        midX  = CGRectGetMidX( rect );
        maxX  = CGRectGetMaxX( rect );
        minY  = CGRectGetMinY( rect );
        maxY  = CGRectGetMaxY( rect );
        minX += _borderWidth;
        maxX -= _borderWidth;
        maxY -= _borderWidth;
        
        CGContextMoveToPoint( context, minX, minY );
        CGContextAddArcToPoint( context, minX, maxY, midX, maxY, _borderRadius );
        CGContextAddArcToPoint( context, maxX, maxY, maxX, minY, _borderRadius );
        CGContextAddLineToPoint( context, maxX, minY );
        CGContextClosePath( context );
        CGContextDrawPath( context, kCGPathFillStroke );
    }
    else if( _backgroundViewType == FSGroupedTableViewCellBackgroundViewTypeSingle )
    {
        minX  = CGRectGetMinX( rect );
        midX  = CGRectGetMidX( rect );
        maxX  = CGRectGetMaxX( rect );
        minY  = CGRectGetMinY( rect );
        midY  = CGRectGetMidY( rect );
        maxY  = CGRectGetMaxY( rect );
        minX += 1;
        minY += 1;
        maxX -= 1;
        maxY -= 1;

        CGContextMoveToPoint( context, minX, midY );
        CGContextAddArcToPoint( context, minX, minY, midX, minY, _borderRadius );
        CGContextAddArcToPoint( context, maxX, minY, maxX, midY, _borderRadius );
        CGContextAddArcToPoint( context, maxX, maxY, midX, maxY, _borderRadius );
        CGContextAddArcToPoint( context, minX, maxY, minX, midY, _borderRadius );
        CGContextClosePath( context );
        CGContextDrawPath( context, kCGPathFillStroke );                
    }
    else if( _backgroundViewType == FSGroupedTableViewCellBackgroundViewTypeMiddle )
    {
        minX  = CGRectGetMinX( rect );
        maxX  = CGRectGetMaxX( rect );
        minY  = CGRectGetMinY( rect );
        maxY  = CGRectGetMaxY( rect );
        minX += _borderWidth;
        maxX -= _borderWidth;
        
        CGContextMoveToPoint( context, minX, minY );
        CGContextAddLineToPoint( context, maxX, minY );
        CGContextAddLineToPoint( context, maxX, maxY );
        CGContextAddLineToPoint( context, minX, maxY );
        CGContextClosePath( context );
        CGContextDrawPath( context, kCGPathFillStroke );
    }
}

@end
