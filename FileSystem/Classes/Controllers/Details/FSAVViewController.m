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

#import "FSAVViewController.h"
#import "FSFile.h"

@implementation FSAVViewController

- ( id )initWithFile: ( FSFile * )file
{
    if( ( self = [ self initWithContentURL: [ NSURL fileURLWithPath: file.path ] ] ) )
    {
        _file = [ file retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _file release ];
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _file release ];
    
    [ super viewDidUnload ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    self.navigationItem.title = _file.displayName;
}

- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )orientation
{
    ( void )orientation;
    
    return YES;
}

@end
