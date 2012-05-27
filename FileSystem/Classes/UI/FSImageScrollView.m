/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "FSImageScrollView.h"

@implementation FSImageScrollView

- ( id )initWithFrame: ( CGRect )frame
{
    if( ( self = [ super initWithFrame: frame ] ) )
    {
        self.showsVerticalScrollIndicator   = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom                    = YES;
        self.decelerationRate               = UIScrollViewDecelerationRateFast;
        self.delegate                       = self;
        self.backgroundColor                = [ UIColor colorWithPatternImage: [ UIImage imageNamed: @"Grid.png" ] ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _imageView release ];
    [ _image     release ];
    
    [ super dealloc ];
}

- ( void )layoutSubviews 
{
    CGSize boundsSize;
    CGRect frameToCenter;
    
    [ super layoutSubviews ];
    
    boundsSize    = self.bounds.size;
    frameToCenter = _imageView.frame;
    
    if( frameToCenter.size.width < boundsSize.width )
    {
        frameToCenter.origin.x = ( boundsSize.width - frameToCenter.size.width ) / ( CGFloat )2;
    }
    else
    {
        frameToCenter.origin.x = ( CGFloat )0;
    }
    
    if( frameToCenter.size.height < boundsSize.height )
    {
        frameToCenter.origin.y = ( boundsSize.height - frameToCenter.size.height ) / ( CGFloat )2;
    }
    else
    {
        frameToCenter.origin.y = ( CGFloat )0;
    }
    
    _imageView.frame = frameToCenter;
}

- ( UIView * )viewForZoomingInScrollView: ( UIScrollView * )scrollView
{
    ( void )scrollView;
    
    return _imageView;
}

- ( UIImage * )image
{
    @synchronized( self )
    {
        return _image;
    }
}

- ( void) setImage: ( UIImage * )image
{
    @synchronized( self )
    {
        [ _imageView removeFromSuperview ];
        
        [ _imageView release ];
        [ _image     release ];
        
        _imageView = nil;
        _image     = nil;
        
        if( image == nil )
        {
            return;
        }
        
        _image         = [ image retain ];
        _imageView     = [ [ UIImageView alloc ] initWithImage: _image ];
        
        self.zoomScale   = ( CGFloat )1;
        self.contentSize = [ _image size ];
        
        [ self addSubview: _imageView ];
        [ self setMaxMinZoomScalesForCurrentBounds ];
        
        self.zoomScale = self.minimumZoomScale;
    }
}

- ( void )setMaxMinZoomScalesForCurrentBounds
{
    CGSize  boundsSize;
    CGSize  imageSize;
    CGFloat xScale;
    CGFloat yScale;
    CGFloat minScale;
    CGFloat maxScale;
    
    boundsSize = self.bounds.size;
    imageSize  = _imageView.bounds.size;
    xScale     = boundsSize.width / imageSize.width;
    yScale     = boundsSize.height / imageSize.height;
    minScale   = MIN( xScale, yScale );
    maxScale   = ( CGFloat )1 / [ [ UIScreen mainScreen ] scale ];
    
    if( minScale > maxScale )
    {
        minScale = maxScale;
    }
    
    maxScale *= 5;
    
    self.maximumZoomScale = maxScale;
    self.minimumZoomScale = minScale;
}

- ( CGPoint )pointToCenterAfterRotation
{
    CGPoint boundsCenter;
    
    boundsCenter = CGPointMake
    (
        CGRectGetMidX( self.bounds ),
        CGRectGetMidY( self.bounds )
    );
    
    return [ self convertPoint: boundsCenter toView: _imageView ];
}

- ( CGFloat )scaleToRestoreAfterRotation
{
    CGFloat contentScale;
    
    contentScale = self.zoomScale;
     
    if( contentScale <= self.minimumZoomScale + FLT_EPSILON )
    {
        contentScale = ( CGFloat )0;
    }
    
    return contentScale;
}

- ( void )restoreCenterPoint: ( CGPoint )oldCenter scale: ( CGFloat )oldScale
{
    CGPoint boundsCenter;
    CGPoint offset;
    CGPoint maxOffset;
    CGPoint minOffset;
    
    self.zoomScale = MIN
    (
        self.maximumZoomScale,
        MAX( self.minimumZoomScale, oldScale )
    );
    
    boundsCenter = [ self convertPoint: oldCenter fromView: _imageView ];
    offset       = CGPointMake( boundsCenter.x - self.bounds.size.width  / ( CGFloat )2,  boundsCenter.y - self.bounds.size.height / ( CGFloat )2 );
    
    maxOffset    = CGPointMake( self.contentSize.width  - self.bounds.size.width, self.contentSize.height - self.bounds.size.height );
    minOffset    = CGPointZero;
    
    offset.x     = MAX( minOffset.x, MIN( maxOffset.x, offset.x ) );
    offset.y     = MAX( minOffset.y, MIN( maxOffset.y, offset.y ) );
    
    self.contentOffset = offset;
}

@end
