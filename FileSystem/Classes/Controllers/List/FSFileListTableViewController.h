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

@class FSFile;

@interface FSFileListTableViewController: UIViewController
{
@protected
    
    UITableView    * _tableView;
    FSFile         * _file;
    NSMutableArray * _files;
    
@private
    
    id __FSFileListTableViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}

- ( id )initWithPath: ( NSString * )path;
- ( id )initWithFile: ( FSFile * )path;

@end
