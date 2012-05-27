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
@class FSImageScrollView;

@interface FSImageViewController: UIViewController
{
@protected
    
    FSFile            * _file;
    UIScrollView      * _scrollView;
    UIImage           * _image;
    FSImageScrollView * _imageView;
    
@private
    
    id __FSAVViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( nonatomic, readwrite, retain ) IBOutlet UIScrollView * scrollView;

- ( id )initWithFile: ( FSFile * )file;

@end
