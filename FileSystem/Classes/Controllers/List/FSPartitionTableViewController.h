/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @header      ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

@interface FSPartitionTableViewController: UIViewController
{
@protected
    
    UITableView * _tableView;
    NSArray     * _partitions;
    
@private
    
    id __FSPartitionTableViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}



@end
