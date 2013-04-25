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
