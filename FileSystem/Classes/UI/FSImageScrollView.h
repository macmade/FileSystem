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
