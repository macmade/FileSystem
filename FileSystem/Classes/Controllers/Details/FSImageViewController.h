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
