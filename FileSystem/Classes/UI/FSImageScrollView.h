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

@interface FSImageScrollView: UIScrollView < UIScrollViewDelegate >
{
@protected
    
    UIImageView * _imageView;
    UIImage     * _image;
    
@private
    
    id __FSImageScrollView_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( atomic, readwrite, retain ) UIImage * image;

- ( void )setMaxMinZoomScalesForCurrentBounds;
- ( CGPoint )pointToCenterAfterRotation;
- ( CGFloat )scaleToRestoreAfterRotation;
- ( void )restoreCenterPoint: ( CGPoint )oldCenter scale: ( CGFloat )oldScale;

@end
