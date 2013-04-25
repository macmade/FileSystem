/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "FSPartitionTableViewController.h"
#import "FSPartitionTableViewController+Private.h"
#import "FSPartitionTableViewController+UITableViewDelegate.h"
#import "FSPartitionTableViewController+UITableViewDataSource.h"
#import "FSPartition.h"
#import "FSPreferences.h"
#import "FSFileListTableViewController.h"
#import "FSFile.h"

@implementation FSPartitionTableViewController

- ( id )init
{
    if( ( self = [ self initWithNibName: @"FSPartitionTableView" bundle: nil ] ) )
    {}
    
    return self;
}

- ( void )dealloc
{
    [ _partitions release ];
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _partitions release ];
    
    [ super viewDidUnload ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    self.navigationItem.title   = [ [ UIDevice currentDevice ] name ];
    _partitions                 = [ [ FSPartition availablePartitions ] retain ];
    _tableView                  = ( UITableView * )( self.view );
    _tableView.delegate         = self;
    _tableView.dataSource       = self;
    
    [ self.navigationController setToolbarHidden: NO ];
}

- ( void )viewWillAppear: ( BOOL )animated
{
    NSString         * disk;
    FSPartition      * partition;
    UIViewController * controller;
    
    [ super viewWillAppear: animated ];
    
    if( animated == NO )
    {
        disk = [ [ FSPreferences sharedInstance ] activeDisk ];
        
        if( disk.length > 0 )
        {
            for( partition in _partitions )
            {
                if( [ partition.mountedFS isEqualToString: disk ] )
                {
                    controller = [ [ FSFileListTableViewController alloc ] initWithFile: [ FSFile fileWithPath: partition.mountPoint ] ];
                    
                    if( controller != nil )
                    {
                        [ self.navigationController pushViewController: controller animated: NO ];
                    }
                    
                    [ controller release ];
                }
            }
        }
    }
    else
    {
        [ [ FSPreferences sharedInstance ] setActiveDisk: @"" ];
        [ [ FSPreferences sharedInstance ] setActivePath: @"" ];
    }
}

- ( void )viewDidAppear: ( BOOL )animated
{
    UILabel         * label;
    NSString        * deviceInfos;
    UIBarButtonItem * item;
    UIBarButtonItem * spacer;
    
    [ super viewDidAppear: animated ];
    
    spacer = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: NULL ];
    
    label                   = [ [ UILabel alloc ] initWithFrame: CGRectMake( 0, 0, self.navigationController.toolbar.bounds.size.width - 50, self.navigationController.toolbar.bounds.size.height ) ];
    label.backgroundColor   = [ UIColor clearColor ];
    label.textColor         = [ UIColor whiteColor ];
    label.font              = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
    label.textAlignment     = UITextAlignmentCenter;
    label.autoresizingMask  = UIViewAutoresizingFlexibleWidth
                            | UIViewAutoresizingFlexibleHeight
                            | UIViewAutoresizingFlexibleLeftMargin
                            | UIViewAutoresizingFlexibleTopMargin
                            | UIViewAutoresizingFlexibleRightMargin
                            | UIViewAutoresizingFlexibleBottomMargin;
    
    if( [ [ UIDevice currentDevice ] userInterfaceIdiom ] == UIUserInterfaceIdiomPad )
    {
        label.textColor = [ UIColor colorWithRed: ( CGFloat )0.44 green: ( CGFloat )0.47 blue: ( CGFloat )0.5 alpha: ( CGFloat )1 ];
    }
    
    deviceInfos = [ NSString stringWithFormat: @"%@ - %@ %@", [ [ UIDevice currentDevice ] localizedModel ], [ [ UIDevice currentDevice ] systemName ], [ [ UIDevice currentDevice ] systemVersion ] ];
    
    [ label setText: deviceInfos ];
    
    item                                    = [ [ UIBarButtonItem alloc ] initWithCustomView: label ];
    self.navigationController.toolbar.items = [ NSArray arrayWithObjects: spacer, item, spacer, nil ];
    
    [ spacer release ];
    [ item   release ];
    [ label  release ];
}

- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )orientation
{
    ( void )orientation;
    
    return YES;
}

@end
