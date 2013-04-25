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

#import "FSFileInfosTableViewCell.h"
#import "FSFile.h"

NSString * const FSFileInfosTableViewCellID = @"FSFileInfosTableViewCell";

@implementation FSFileInfosTableViewCell

- ( id )init
{
    CGFloat x;
    CGFloat y;
    CGFloat height;
    CGFloat leftWidth;
    CGFloat rightWidth;
    
    if( ( self = [ self initWithStyle: UITableViewCellStyleValue2 reuseIdentifier: FSFileInfosTableViewCellID ] ) )
    {
        x          = ( CGFloat )0;
        y          = ( CGFloat )0;
        height     = self.bounds.size.height;
        leftWidth  = ( self.bounds.size.width  * ( CGFloat )0.45 );
        rightWidth = ( self.bounds.size.width  * ( CGFloat )0.55 );
        
        _mainLabel      = [ [ UILabel alloc ] initWithFrame: CGRectMake( x,              y, leftWidth  - x, height - y ) ];
        _alternateLabel = [ [ UILabel alloc ] initWithFrame: CGRectMake( leftWidth + 10, y, rightWidth,     height - y ) ];
            
        _mainLabel.backgroundColor      = [ UIColor clearColor ];
        _alternateLabel.backgroundColor = [ UIColor clearColor ];
        
        _mainLabel.textColor        = [ UIColor colorWithRed: ( CGFloat )0.22 green: ( CGFloat )0.33 blue: ( CGFloat )0.53 alpha: ( CGFloat )1 ];
        _alternateLabel.textColor   = [ UIColor darkTextColor ];
        
        _mainLabel.font         = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
        _alternateLabel.font    = [ UIFont boldSystemFontOfSize: [ UIFont smallSystemFontSize ] ];
        
        _mainLabel.textAlignment        = UITextAlignmentRight;
        _alternateLabel.textAlignment   = UITextAlignmentLeft;
        
        _mainLabel.autoresizingMask         = UIViewAutoresizingFlexibleWidth
                                            | UIViewAutoresizingFlexibleHeight
                                            | UIViewAutoresizingFlexibleTopMargin
                                            | UIViewAutoresizingFlexibleRightMargin
                                            | UIViewAutoresizingFlexibleBottomMargin;
        _alternateLabel.autoresizingMask    = UIViewAutoresizingFlexibleWidth
                                            | UIViewAutoresizingFlexibleHeight
                                            | UIViewAutoresizingFlexibleLeftMargin
                                            | UIViewAutoresizingFlexibleTopMargin
                                            | UIViewAutoresizingFlexibleBottomMargin;
        
        [ self addSubview: _mainLabel ];
        [ self addSubview: _alternateLabel ];

    }
    
    return self;
}

- ( void )dealloc
{
    [ _file             release ];
    [ _mainLabel        release ];
    [ _alternateLabel   release ];
    
    [ super dealloc ];
}

- ( void )layoutSubviews
{
    [ super layoutSubviews ];
}

- ( FSFile * )file
{
    @synchronized( self )
    {
        return _file;
    }
}

- ( void )setFile: ( FSFile * )file
{
    @synchronized( self )
    {
        if( file != _file )
        {
            [ _file release ];
            
            _file = [ file retain ];
            
            if( _file != nil )
            {}
            else
            {}
        }
        
        [ self layoutSubviews ];
    }
}

- ( UILabel * )textLabel
{
    @synchronized( self )
    {
        return _mainLabel;
    }
}

- ( UILabel * )detailTextLabel
{
    @synchronized( self )
    {
        return _alternateLabel;
    }
}

@end
