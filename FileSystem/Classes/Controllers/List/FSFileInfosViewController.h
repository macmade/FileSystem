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
