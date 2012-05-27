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

#import "FSFileListTableViewController+UITableViewDataSource.h"
#import "FSFileListTableViewCell.h"
#import "FSFile.h"

@implementation FSFileListTableViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 1;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return ( NSInteger )_files.count;
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    id                        object;
    FSFileListTableViewCell * cell;
    
    cell = ( FSFileListTableViewCell * )[ tableView dequeueReusableCellWithIdentifier: FSFileListTableViewCellID ];
    
    if( cell == nil || [ cell isKindOfClass: [ FSFileListTableViewCell class ] ] == NO )
    {
        cell = [ [ FSFileListTableViewCell new ] autorelease ];
    }
    
    @try
    {
        object = [ _files objectAtIndex: ( NSUInteger )( indexPath.row ) ];
        
        if( [ object isKindOfClass: [ FSFile class ] ] )
        {
            cell.file = object;
        }
        else if( [ object isKindOfClass: [ NSString class ] ] )
        {
            cell.file               = nil;
            cell.textLabel.text     = [ [ NSFileManager defaultManager ] displayNameAtPath: object ];
            cell.imageView.image    = [ UIImage imageNamed: @"Protected.png" ];
        }
    }
    @catch ( NSException * e )
    {
        ( void )e;
        
        cell.file = nil;
    }
    
    cell.alternateBackground = ( indexPath.row % 2 ) ? YES : NO;
    
    return cell;
}

@end
