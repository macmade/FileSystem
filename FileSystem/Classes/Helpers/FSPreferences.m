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

#import "FSPreferences.h"

NSString * const FSPreferencesKeyActiveDisk = @"ActiveDisk";
NSString * const FSPreferencesKeyActivePath = @"ActivePath";

static FSPreferences * __sharedInstance = nil;

@implementation FSPreferences

+ ( FSPreferences * )sharedInstance
{
    @synchronized( self )
    {
        if( __sharedInstance == nil )
        {
            __sharedInstance = [ [ super allocWithZone: NULL ] init ];
        }
    }

    return __sharedInstance;
}

+ ( id )allocWithZone:( NSZone * )zone
{
    ( void )zone;

    @synchronized( self )
    {
        return [ [ self sharedInstance ] retain ];
    }
}

- ( id )copyWithZone:( NSZone * )zone
{
    ( void )zone;

    return self;
}

- ( id )retain
{
    return self;
}

- ( NSUInteger )retainCount
{
    return UINT_MAX;
}

- ( oneway void )release
{}

- ( id )autorelease
{
    return self;
}

- ( NSString * )activeDisk
{
    @synchronized( self )
    {
        return [ [ NSUserDefaults standardUserDefaults ] objectForKey: FSPreferencesKeyActiveDisk ];
    }
}

- ( NSString * )activePath
{
    @synchronized( self )
    {
        return [ [ NSUserDefaults standardUserDefaults ] objectForKey: FSPreferencesKeyActivePath ];
    }
}

- ( void )setActiveDisk: ( NSString * )value
{
    @synchronized( self )
    {
        [ [ NSUserDefaults standardUserDefaults ] setObject: value forKey: FSPreferencesKeyActiveDisk ];
        [ [ NSUserDefaults standardUserDefaults ] synchronize ];
    }
}

- ( void )setActivePath: ( NSString * )value
{
    @synchronized( self )
    {
        [ [ NSUserDefaults standardUserDefaults ] setObject: value forKey: FSPreferencesKeyActivePath ];
        [ [ NSUserDefaults standardUserDefaults ] synchronize ];
    }
}

@end
