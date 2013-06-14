/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *  -   Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *  -   Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *  -   Neither the name of 'Jean-David Gadina' nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   (c) 2013, Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "FSPartitionTableViewController+UITableViewDataSource.h"
#import "FSPartitionTableViewCell.h"
#import "FSGroupedTableViewCellBackgroundView.h"
#import "UIDevice+FS.h"

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
    
    if( [ [ UIDevice currentDevice ] systemMajorVersion ] < 7 )
    {
        cell.backgroundView = backgroundView;
    }
    
    return cell;
}

- ( NSString * )tableView: ( UITableView * )tableView titleForHeaderInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return NSLocalizedString( @"MountPoints", @"MountPoints" );
}

@end
