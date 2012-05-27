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

#import "FSFileInfosViewController+Private.h"
#import "FSFileInfosViewController+UIDocumentInteractionControllerDelegate.h"
#import "FSFile.h"

@implementation FSFileInfosViewController( Private )

- ( IBAction )openIn: ( id )sender
{
    UIAlertView                     * alert;
    UIDocumentInteractionController * controller;
    
    ( void )sender;
    
    controller          = [ UIDocumentInteractionController interactionControllerWithURL: [ NSURL fileURLWithPath: _file.path ] ];
    controller.delegate = self;
    
    [ controller retain ];
    
    if( [ controller presentOpenInMenuFromBarButtonItem: sender animated: YES ] == NO )
    {
        alert = [ [ UIAlertView alloc ] initWithTitle: NSLocalizedString( @"OpenInAlertTitle", @"OpenInAlertTitle" ) message: NSLocalizedString( @"OpenInAlertText", @"OpenInAlertText" ) delegate: nil cancelButtonTitle: NSLocalizedString( @"OK", @"OK" ) otherButtonTitles: nil ];
        
        [ alert show ];
        [ alert autorelease ];
    }
}

- ( IBAction )showInfos: ( id )sender
{
    UIViewController * controller;
    FSFile           * file;
    
    ( void )sender;
    
    file       = ( _file.targetFile == nil ) ? _file : _file.targetFile;
    controller = [ [ FSFileInfosViewController alloc ] initWithFile: file ];
    
    if( controller != nil )
    {
        [ self.navigationController pushViewController: controller animated: YES ];
    }
    
    [ controller release ];
}

@end
