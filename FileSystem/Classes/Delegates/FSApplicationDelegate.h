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
