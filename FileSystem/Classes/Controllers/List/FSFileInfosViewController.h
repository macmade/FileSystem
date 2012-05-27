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

@interface FSFileInfosViewController: UIViewController
{
@protected
    
    FSFile      * _file;
    UITableView * _tableView;
    
@private
    
    id __FSFileInfosViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( nonatomic, readwrite, retain ) IBOutlet UITableView * tableView;

- ( id )initWithFile: ( FSFile * )file;

@end
