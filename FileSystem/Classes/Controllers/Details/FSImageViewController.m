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

#import "FSImageViewController.h"
#import "FSImageViewController+Private.h"
#import "FSFile.h"
#import "FSImageScrollView.h"
#import "UIImage+FS.h"

@implementation FSImageViewController

@synthesize scrollView = _scrollView;

- ( id )initWithFile: ( FSFile * )file
{
    if( ( self = [ self initWithNibName: @"FSImageView" bundle: nil ] ) )
    {
        _file = [ file retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _file         release ];
    [ _scrollView   release ];
    [ _image        release ];
    [ _imageView    release ];
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _file         release ];
    [ _scrollView   release ];
    [ _image        release ];
    [ _imageView    release ];
    
    [ super viewDidUnload ];
}

- ( void )viewDidLoad
{
    UITapGestureRecognizer * gesture;
    NSUInteger               maxSize;
    
    [ super viewDidLoad ];
    
    self.navigationItem.title = _file.displayName;
    
    maxSize = ( [ [ UIScreen mainScreen ] scale ] > 1 && [ [ UIDevice currentDevice ] userInterfaceIdiom ] == UIUserInterfaceIdiomPad ) ? 4096 : 2048;
    _image  = [ [ UIImage thumbnailForImageAtPath: _file.path maxSize: maxSize ] retain ];
    
    gesture                      = [ [ UITapGestureRecognizer alloc ] initWithTarget: self action: @selector( handleDoubleTap: ) ];
    gesture.numberOfTapsRequired = 2;
    
    [ self.view addGestureRecognizer: gesture ];
    [ gesture release ];
}

- ( void )viewWillAppear: ( BOOL )animated
{
    [ super viewWillAppear: animated ];
    
    [ _imageView removeFromSuperview ];
    [ _imageView release ];
    
    _imageView       = [ [ FSImageScrollView alloc ] initWithFrame: _scrollView.bounds ];
    _imageView.image = _image;
    
    [ _scrollView addSubview: _imageView ];
}

- ( void )viewWillDisappear: ( BOOL )animated
{
    [ super viewWillDisappear: animated ];
}

- ( void )viewDidAppear: ( BOOL )animated
{
    UIImage         * image;
    UIBarButtonItem * spacer;
    UIBarButtonItem * item;
    UIBarButtonItem * infos;
    UIBarButtonItem * openIn;
    UILabel         * label;
    
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
    
    image      = [ UIImage imageWithContentsOfFile: _file.path ];
    label.text = [ NSString stringWithFormat: @"%u x %u", ( NSUInteger )image.size.width, ( NSUInteger )image.size.height ];
    
    item                                    = [ [ UIBarButtonItem alloc ] initWithCustomView: label ];
    infos                                   = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target: self action: @selector( showInfos: ) ];
    openIn                                  = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: @selector( openIn: ) ];
    self.navigationController.toolbar.items = [ NSArray arrayWithObjects: infos, spacer, item, spacer, openIn, nil ];
    
    [ spacer    release ];
    [ item      release ];
    [ label     release ];
    [ infos     release ];
    [ openIn    release ];
}

- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )orientation
{
    ( void )orientation;
    
    return YES;
}

- ( void )willAnimateRotationToInterfaceOrientation: ( UIInterfaceOrientation )orientation duration: ( NSTimeInterval )duration
{
    CGPoint restorePoint;
    CGFloat restoreScale;
    
    ( void )orientation;
    ( void )duration;
    
    _scrollView.contentSize = _scrollView.bounds.size;
    restorePoint            = [ _imageView pointToCenterAfterRotation ];
    restoreScale            = [ _imageView scaleToRestoreAfterRotation ];
    _imageView.frame        = _scrollView.bounds;
    
    [ _imageView setMaxMinZoomScalesForCurrentBounds ];
    [ _imageView restoreCenterPoint: restorePoint scale: restoreScale ];
}

@end
