/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "FSHUDView.h"
#import <QuartzCore/QuartzCore.h>

@implementation FSHUDView

- ( id )init
{
    UIActivityIndicatorView * activity;
    
    if( ( self = [ super initWithFrame: CGRectMake( 0, 0, 50, 50 ) ] ) )
    {
        self.backgroundColor    = [ UIColor blackColor ];
        self.alpha              = ( CGFloat )0.75;
        self.layer.cornerRadius = ( CGFloat )10;
        self.autoresizingMask   = UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleBottomMargin;
        
        activity        = [ [ UIActivityIndicatorView alloc ] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhite ];
        activity.center = self.center;
        
        [ self addSubview: activity ];
        [ activity startAnimating ];
        [ activity release ];
    }
    
    return self;
}

@end
