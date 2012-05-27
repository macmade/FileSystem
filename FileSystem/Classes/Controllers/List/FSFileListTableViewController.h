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
