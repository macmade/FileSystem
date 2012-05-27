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

#import "FSFileListTableViewController+UITableViewDelegate.h"
#import "FSFileListTableViewCell.h"
#import "FSFile.h"
#import "FSTextViewController.h"
#import "FSImageViewController.h"
#import "FSAVViewController.h"
#import "FSFileInfosViewController.h"
#import "FSFileInfosViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation FSFileListTableViewController( UITableViewDelegate )

- ( void )tableView: ( UITableView * )tableView didSelectRowAtIndexPath: ( NSIndexPath * )indexPath
{
    FSFileListTableViewCell * cell;
    UIViewController        * controller;
    FSFile                  * file;
    UIAlertView             * alert;
    
    cell       = ( FSFileListTableViewCell * )[ tableView cellForRowAtIndexPath: indexPath ];
    controller = nil;
    file       = ( cell.file.targetFile == nil ) ? cell.file : cell.file.targetFile;
    
    [ NSThread detachNewThreadSelector: @selector( startAnimating ) toTarget: cell withObject: nil ];
    [ tableView deselectRowAtIndexPath: indexPath animated: YES ];
    
    if( file.isReadable == YES && file.isDirectory == YES )
    {
        controller = [ [ FSFileListTableViewController alloc ] initWithFile: file ];
    }
    else if( file.isReadable == YES )
    {
        if( file.isImage == YES )
        {
            controller = [ [ FSImageViewController alloc ] initWithFile: file ];
        }
        else if( file.isAudio == YES || file.isVideo == YES )
        {
            controller = [ [ FSAVViewController alloc ] initWithFile: file ];
        }
        else
        {
            controller = [ [ FSTextViewController alloc ] initWithFile: file ];
        }
    }
    else if( file != nil )
    {
        controller = [ [ FSFileInfosViewController alloc ] initWithFile: file ];
    }
    else
    {
        alert = [ [ UIAlertView alloc ] initWithTitle: NSLocalizedString( @"ProtectedFileAlertTitle", @"ProtectedFileAlertTitle" ) message: NSLocalizedString( @"ProtectedFileAlertText", @"ProtectedFileAlertText" ) delegate: nil cancelButtonTitle: NSLocalizedString( @"OK", @"OK" ) otherButtonTitles: nil ];
        
        [ alert show ];
        [ alert autorelease ];
    }
    
    if( controller != nil )
    {
        if( [ controller isKindOfClass: [ MPMoviePlayerViewController class ] ] )
        {
            [ self.navigationController presentMoviePlayerViewControllerAnimated: ( MPMoviePlayerViewController * )controller ];
        }
        else
        {
            [ self.navigationController pushViewController: controller animated: YES ];
        }
    }
    
    [ controller release ];
}

- ( void )tableView: ( UITableView * )tableView accessoryButtonTappedForRowWithIndexPath: ( NSIndexPath * )indexPath
{
    FSFileListTableViewCell * cell;
    UIViewController        * controller;
    FSFile                  * file;
    
    cell       = ( FSFileListTableViewCell * )[ tableView cellForRowAtIndexPath: indexPath ];
    file       = ( cell.file.targetFile == nil ) ? cell.file : cell.file.targetFile;
    controller = [ [ FSFileInfosViewController alloc ] initWithFile: file ];
    
    if( controller != nil )
    {
        [ self.navigationController pushViewController: controller animated: YES ];
    }
    
    [ controller release ];
}

@end
