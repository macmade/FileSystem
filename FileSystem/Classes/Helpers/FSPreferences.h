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

FOUNDATION_EXPORT NSString * const FSPreferencesKeyActiveDisk;
FOUNDATION_EXPORT NSString * const FSPreferencesKeyActivePath;

@interface FSPreferences: NSObject
{
@protected
    
    
    
@private
    
    id __FSPreferences_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readwrite, assign ) NSString * activeDisk;
@property( atomic, readwrite, assign ) NSString * activePath;

+ ( FSPreferences * )sharedInstance;

@end
