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

#import "FSPartitionTableViewController+UITableViewDelegate.h"
#import "FSPartitionTableViewCell.h"
#import "FSPartition.h"
#import "FSFile.h"
#import "FSFileListTableViewController.h"
#import "FSPreferences.h"

@implementation FSPartitionTableViewController( UITableViewDelegate )

- ( void )tableView: ( UITableView * )tableView didSelectRowAtIndexPath: ( NSIndexPath * )indexPath
{
    FSPartitionTableViewCell      * cell;
    FSFileListTableViewController * controller;
    UIAlertView                   * alert;
    
    cell = ( FSPartitionTableViewCell * )[ tableView cellForRowAtIndexPath: indexPath ];
    
    [ NSThread detachNewThreadSelector: @selector( startAnimating ) toTarget: cell withObject: nil ];
    [ tableView deselectRowAtIndexPath: indexPath animated: YES ];
    
    if( cell.mountPoint == nil || cell.mountPoint.isReadable == NO )
    {
        controller = nil;
    }
    else
    {
        [ [ FSPreferences sharedInstance ] setActiveDisk: cell.partition.mountedFS ];
        
        controller = [ [ FSFileListTableViewController alloc ] initWithPath: cell.partition.mountPoint ];
    }
    
    if( controller != nil )
    {
        [ self.navigationController pushViewController: controller animated: YES ];
    }
    else
    {
        alert = [ [ UIAlertView alloc ] initWithTitle:      NSLocalizedString( @"MountPointAlertTitle", @"MountPointAlertTitle" )
                                        message:            NSLocalizedString( @"MountPointAlertText", @"MountPointAlertText" )
                                        delegate:           nil
                                        cancelButtonTitle:  NSLocalizedString( @"OK", @"OK" )
                                        otherButtonTitles:  nil
                ];
        
        [ alert show ];
        [ alert autorelease ];
    }
    
    [ controller release ];
}

@end
