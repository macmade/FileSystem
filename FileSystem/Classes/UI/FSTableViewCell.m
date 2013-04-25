/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "FSTableViewCell.h"

static NSArray * __animationImages = nil;

@implementation FSTableViewCell

+ ( void )initialize
{
    NSUInteger       i;
    NSMutableArray * images;
    UIImage        * image;
    
    images = [ NSMutableArray arrayWithCapacity: 12 ];
    
    for( i = 1; i < 13; i++ )
    {
        image = [ UIImage imageNamed: [ NSString stringWithFormat: @"load-%u.png", i ] ];
        
        if( image != nil )
        {
            [ images addObject: image ];
        }
    }
    
    __animationImages = [ [ NSArray alloc ] initWithArray: images ];
}

- ( void )startAnimating
{
    @autoreleasepool
    {
        self.imageView.animationImages      = __animationImages;
        self.imageView.animationDuration    = 1;
        self.imageView.animationRepeatCount = 0;
        
        [ self.imageView startAnimating ];
    }
}

- ( void )stopAnimating
{
    @autoreleasepool
    {
        [ self.imageView stopAnimating ];
    }
}

@end
