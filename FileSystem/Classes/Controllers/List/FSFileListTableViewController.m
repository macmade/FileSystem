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

#import "FSFileListTableViewController.h"
#import "FSFileListTableViewController+Private.h"
#import "FSFileListTableViewController+UITableViewDelegate.h"
#import "FSFileListTableViewController+UITableViewDataSource.h"
#import "FSFile.h"
#import "FSPreferences.h"

@implementation FSFileListTableViewController

- ( id )init
{
    if( ( self = [ self initWithNibName: @"FSFileListTableView" bundle: nil ] ) )
    {}
    
    return self;
}

- ( id )initWithPath: ( NSString * )path
{
    if( ( self = [ self initWithFile: [ FSFile fileWithPath: path ] ] ) )
    {}
    
    return self;
}

- ( id )initWithFile: ( FSFile * )file
{
    if( file == nil || file.isReadable == NO || ( file.isDirectory == NO && file.targetFile.isDirectory == NO ) )
    {
        return nil;
    }
    
    if( ( self = [ self init ] ) )
    {
        _file = [ file retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _file     release ];
    [ _files    release ];
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _file     release ];
    [ _files    release ];
    
    [ super viewDidUnload ];
}

- ( void )viewDidLoad
{
    FSFile  * file;
    NSString * path;
    NSArray  * files;
    
    [ super viewDidLoad ];
    
    self.navigationItem.title = _file.displayName;
    
    _tableView = ( UITableView * )( self.view );
    _files     = [ [ NSMutableArray alloc ] initWithCapacity: 256 ];
    
    files = [ [ NSFileManager defaultManager ] contentsOfDirectoryAtPath: _file.path error: NULL ];
    
    for( path in files )
    {
        path = [ _file.path stringByAppendingPathComponent: path ];
        file = [ FSFile fileWithPath: path ];
        
        if( file != nil )
        {
            [ _files addObject: file ];
        }
        else
        {
            [ _files addObject: path ];
        }
    }
    
    _tableView.dataSource = self;
    _tableView.delegate   = self;
}

- ( void )viewWillAppear: ( BOOL )animated
{
    NSString         * path;
    FSFile           * file;
    UIViewController * controller;
    
    [ super viewWillAppear: animated ];
    
    if( animated == NO )
    {
        path = [ [ FSPreferences sharedInstance ] activePath ];
        
        if( path.length > 0 )
        {
            for( file in _files )
            {
                if( [ file isKindOfClass: [ FSFile class ] ] && [ path hasPrefix: file.path ] )
                {
                    controller = [ [ FSFileListTableViewController alloc ] initWithFile: file ];
                    
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
        [ [ FSPreferences sharedInstance ] setActivePath: _file.path ];
    }
}

- ( void )viewDidAppear: ( BOOL )animated
{
    UILabel         * label;
    UIBarButtonItem * item;
    UIBarButtonItem * spacer;
    
    [ super viewDidAppear: animated ];
    
    spacer = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: NULL ];
    
    label                   = [ [ UILabel alloc ] initWithFrame: CGRectMake( 0, 0, self.navigationController.toolbar.bounds.size.width - 50, self.navigationController.toolbar.bounds.size.height ) ];
    label.backgroundColor   = [ UIColor clearColor ];
    label.textColor         = [ UIColor whiteColor ];
    label.font              = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
    label.textAlignment     = UITextAlignmentCenter;
    label.lineBreakMode     = UILineBreakModeMiddleTruncation;
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
    
    [ label setText: _file.path ];
    
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
