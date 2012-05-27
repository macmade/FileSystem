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
#import "FSPartitionTableViewController.h"

@implementation FSApplicationDelegate

@synthesize window               = _window;
@synthesize navigationController = _navigationController;

- ( void )dealloc
{
    [ _window               release ];
    [ _navigationController release ];
    
    [ super dealloc ];
}

- ( BOOL )application: ( UIApplication * )application didFinishLaunchingWithOptions: ( NSDictionary * )launchOptions
{
    UIViewController * controller;
    
    ( void )application;
    ( void )launchOptions;
    
    controller                     = [ FSPartitionTableViewController new ];
    _window                        = [ [ UIWindow alloc ] initWithFrame: [ [ UIScreen mainScreen ] bounds ] ];
    _navigationController          = [ [ UINavigationController alloc ] initWithRootViewController: controller ];
    self.window.rootViewController = self.navigationController;
    
    [ _window makeKeyAndVisible ];
    [ controller release ];
    
    return YES;
}

- ( void )applicationWillResignActive: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationDidEnterBackground: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationWillEnterForeground: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationDidBecomeActive: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationWillTerminate: ( UIApplication * )application
{
    ( void )application;
}

@end
