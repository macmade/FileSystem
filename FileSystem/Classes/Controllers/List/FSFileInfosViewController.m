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

#import "FSFileInfosViewController.h"
#import "FSFileInfosViewController+Private.h"
#import "FSFileInfosViewController+UITableViewDelegate.h"
#import "FSFileInfosViewController+UITableViewDataSource.h"
#import "FSFile.h"

@implementation FSFileInfosViewController

@synthesize tableView = _tableView;

- ( id )initWithFile: ( FSFile * )file
{
    if( ( self = [ self initWithNibName: @"FSFileInfosView" bundle: nil ] ) )
    {
        _file = [ file retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _file         release ];
    [ _tableView    release ];
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _file         release ];
    [ _tableView    release ];
    
    [ super dealloc ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    self.navigationItem.title = _file.displayName;
    
    _tableView            = ( UITableView * )( self.view );
    _tableView.delegate   = self;
    _tableView.dataSource = self;
}

- ( void )viewDidAppear: ( BOOL )animated
{
    UILabel         * label;
    UIBarButtonItem * item;
    UIBarButtonItem * spacer;
    UIBarButtonItem * openIn;
    
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
    
    item   = [ [ UIBarButtonItem alloc ] initWithCustomView: label ];
    openIn = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: @selector( openIn: ) ];
    
    if( _file.isDirectory || _file.targetFile.isDirectory || _file.isReadable == NO )
    {
        self.navigationController.toolbar.items = [ NSArray arrayWithObjects: spacer, item, spacer, nil ];
    }
    else
    {
        self.navigationController.toolbar.items = [ NSArray arrayWithObjects: item, spacer, openIn, nil ];
    }
    
    [ spacer release ];
    [ item   release ];
    [ label  release ];
    [ openIn release ];
}

- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )orientation
{
    ( void )orientation;
    
    return YES;
}

@end
