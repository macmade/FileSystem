/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @header      ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
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
