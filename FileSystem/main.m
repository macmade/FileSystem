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

#import "FSApplicationDelegate.h"

int main( int argc, char * argv[] )
{
    @autoreleasepool
    {
        return UIApplicationMain
        (
            argc,
            argv,
            nil,
            NSStringFromClass( [ FSApplicationDelegate class ] )
        );
    }
}
