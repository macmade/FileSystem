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

#import "FSFileInfosViewController+UITableViewDataSource.h"
#import "FSFileInfosTableViewCell.h"
#import "FSFile.h"

@implementation FSFileInfosViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 4;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    
    switch( section )
    {
        case 0:     return 4;
        case 1:     return 3;
        case 2:     return 8;
        case 3:     return 3;
        default:    return 0;
    }
    
    return 0;
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    NSDateFormatter          * format;
    FSFileInfosTableViewCell * cell;
    
    cell   = [ tableView dequeueReusableCellWithIdentifier: FSFileInfosTableViewCellID ];
    format = [ [ NSDateFormatter new ] autorelease ];
    
    [ format setDateStyle: NSDateFormatterMediumStyle ];
    [ format setTimeStyle: NSDateFormatterMediumStyle ];
    
    if( cell == nil )
    {
        cell = [ [ FSFileInfosTableViewCell new ] autorelease ];
    }
    
    cell.file                   = _file;
    cell.textLabel.text         = @"";
    cell.detailTextLabel.text   = @"";
    
    if( indexPath.section == 0 )
    {
        switch( indexPath.row )
        {
            case 0:
                
                cell.textLabel.text         = NSLocalizedString( @"FileType", @"FileType" );
                cell.detailTextLabel.text   = NSLocalizedString( _file.type, _file.type );
                break;
                
            case 1:
                
                cell.textLabel.text         = NSLocalizedString( @"FileSize", @"FileSize" );
                cell.detailTextLabel.text   = _file.humanReadableSize;
                break;
                
            case 2:
                
                cell.textLabel.text         = NSLocalizedString( @"CreationDate", @"CreationDate" );
                cell.detailTextLabel.text   = [ format stringFromDate: _file.creationDate ];
                break;
                
            case 3:
                
                cell.textLabel.text         = NSLocalizedString( @"ModificationDate", @"ModificationDate" );
                cell.detailTextLabel.text   = [ format stringFromDate: _file.modificationDate ];
                break;
                
            default:
                
                break;
        }
    }
    else if( indexPath.section == 1 )
    {
        switch( indexPath.row )
        {
            case 0:
                
                cell.textLabel.text         = NSLocalizedString( @"Owner", @"Owner" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%@ (%u)", _file.owner, _file.ownerID ];
                break;
                
            case 1:
                
                cell.textLabel.text         = NSLocalizedString( @"Group", @"Group" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%@ (%u)", _file.group, _file.groupID ];
                break;
                
            case 2:
                
                cell.textLabel.text         = NSLocalizedString( @"Permissions", @"Permissions" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%@ (%u)", _file.humanReadablePermissions, _file.octalPermissions ];
                break;
                
            default:
                
                break;
        }
    }
    else if( indexPath.section == 2 )
    {
        switch( indexPath.row )
        {
            case 0:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-Archived", @"Flags-Archived" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsArchived ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 1:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-Hidden", @"Flags-Hidden" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsHidden ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 2:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-NoDump", @"Flags-NoDump" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsNoDump ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 3:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-Opaque", @"Flags-Opaque" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsOpaque ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 4:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-SystemAppendOnly", @"Flags-SystemAppendOnly" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsSystemAppendOnly ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 5:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-SystemImmutable", @"Flags-SystemImmutable" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsSystemImmutable ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 6:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-UserAppendOnly", @"Flags-UserAppendOnly" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsUserAppendOnly ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            case 7:
                
                cell.textLabel.text         = NSLocalizedString( @"Flag-UserImmutable", @"Flags-UserImmutable" );
                cell.detailTextLabel.text   = ( _file.flags & FSFileFlagsUserImmutable ) ? NSLocalizedString( @"Yes", @"Yes" ) : NSLocalizedString( @"No", @"No" );
                break;
                
            default:
                
                break;
        }
    }
    else if( indexPath.section == 3 )
    {
        switch( indexPath.row )
        {
            case 0:
                
                cell.textLabel.text         = NSLocalizedString( @"ReferenceCount", @"ReferenceCount" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%u", _file.referenceCount ];
                break;
                
            case 1:
                
                cell.textLabel.text         = NSLocalizedString( @"SystemFileNumber", @"SystemFileNumber" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%u", _file.systemFileNumber ];
                break;
                
            case 2:
                
                cell.textLabel.text         = NSLocalizedString( @"SystemNumber", @"SystemNumber" );
                cell.detailTextLabel.text   = [ NSString stringWithFormat: @"%u", _file.systemNumber ];
                break;
                
            default:
                
                break;
        }
    }
    
    return cell;
}

- ( NSString * )tableView: ( UITableView * )tableView titleForHeaderInSection: ( NSInteger )section
{
    ( void )tableView;
    
    switch( section )
    {
        case 0:     return NSLocalizedString( @"InfosSection-0", @"InfosSection-0" );
        case 1:     return NSLocalizedString( @"InfosSection-1", @"InfosSection-1" );
        case 2:     return NSLocalizedString( @"InfosSection-2", @"InfosSection-2" );
        case 3:     return NSLocalizedString( @"InfosSection-3", @"InfosSection-3" );
        default:    return nil;
    }
    
    return nil;
}

@end
