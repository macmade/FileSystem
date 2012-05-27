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

@interface FSApplicationDelegate: UIResponder < UIApplicationDelegate >
{
@protected
    
    UIWindow               * _window;
    UINavigationController * _navigationController;
    
@private
    
    id __FSApplicationDelegate_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( nonatomic, readwrite, retain ) UIWindow               * window;
@property( nonatomic, readwrite, retain ) UINavigationController * navigationController;

@end
