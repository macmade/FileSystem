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

#import "FSPartitionTableViewController+UITableViewDataSource.h"
#import "FSPartitionTableViewCell.h"
#import "FSGroupedTableViewCellBackgroundView.h"

@implementation FSPartitionTableViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 1;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return ( NSInteger )[ _partitions count ];
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    FSGroupedTableViewCellBackgroundView * backgroundView;
    FSPartitionTableViewCell             * cell;
    
    cell = ( FSPartitionTableViewCell * )[ tableView dequeueReusableCellWithIdentifier: FSPartitionTableViewCellID ];
    
    if( cell == nil || [ cell isKindOfClass: [ FSPartitionTableViewCell class ] ] == NO )
    {
        cell = [ [ FSPartitionTableViewCell new ] autorelease ];
    }
    
    @try
    {
        cell.partition = [ _partitions objectAtIndex: indexPath.row ];
    }
    @catch ( NSException * e )
    {
        ( void )e;
        
        cell.partition = nil;
    }
    
    backgroundView                      = [ [ [ FSGroupedTableViewCellBackgroundView alloc ] initWithFrame: CGRectZero ] autorelease ];
    backgroundView.backgroundViewType   = FSGroupedTableViewCellBackgroundViewTypeMiddle;
    backgroundView.fillColor            = [ UIColor colorWithPatternImage: [ UIImage imageNamed: @"RootTable-CellBackground.png" ] ];
    cell.textLabel.backgroundColor      = [ UIColor clearColor ];
    
    if( _partitions.count == 1 )
    {
        backgroundView.backgroundViewType = FSGroupedTableViewCellBackgroundViewTypeSingle;
    }
    else if( indexPath.row == 0 )
    {
        backgroundView.backgroundViewType = FSGroupedTableViewCellBackgroundViewTypeTop;
    }
    else if( ( NSUInteger )( indexPath.row + 1 ) == _partitions.count )
    {
        backgroundView.backgroundViewType = FSGroupedTableViewCellBackgroundViewTypeBottom;
    }
    else
    {
        backgroundView.backgroundViewType = FSGroupedTableViewCellBackgroundViewTypeMiddle;
    }
    
    cell.backgroundView = backgroundView;
    
    return cell;
}

- ( NSString * )tableView: ( UITableView * )tableView titleForHeaderInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return NSLocalizedString( @"MountPoints", @"MountPoints" );
}

@end
