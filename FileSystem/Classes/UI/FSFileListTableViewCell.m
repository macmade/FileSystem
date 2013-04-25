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

#import "FSFileListTableViewCell.h"
#import "FSFile.h"

NSString * const FSFileListTableViewCellID = @"FSFileListTableViewCell";

static FSFileListTableViewCell * __activeCell = nil;

@implementation FSFileListTableViewCell

@synthesize alternateBackground = _alternateBackground;

- ( id )init
{
    CGFloat                    x;
    CGFloat                    y;
    CGFloat                    height;
    CGFloat                    leftWidth;
    CGFloat                    rightWidth;
    UISwipeGestureRecognizer * gesture;
    
    if( ( self = [ self initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: FSFileListTableViewCellID ] ) )
    {
        gesture = [ [ UISwipeGestureRecognizer alloc ] initWithTarget: self action: @selector( toggleDisplay: ) ];
        
        [ self addGestureRecognizer: gesture ];
        [ gesture release ];
        
        x          = ( [ [ UIDevice currentDevice ] userInterfaceIdiom ] == UIUserInterfaceIdiomPad ) ? 60 : 50;
        y          = ( CGFloat )0;
        height     = self.bounds.size.height;
        leftWidth  = ( self.bounds.size.width * ( CGFloat )0.65 );
        rightWidth = ( self.bounds.size.width * ( CGFloat )0.20 );
        
        _mainLabel      = [ [ UILabel alloc ] initWithFrame: CGRectMake( x,              y, leftWidth  - x, height - y ) ];
        _alternateLabel = [ [ UILabel alloc ] initWithFrame: CGRectMake( leftWidth + 10, y, rightWidth,     height - y ) ];
            
        _mainLabel.backgroundColor      = [ UIColor clearColor ];
        _alternateLabel.backgroundColor = [ UIColor clearColor ];
        
        _mainLabel.textColor      = [ UIColor darkTextColor ];
        _alternateLabel.textColor = [ UIColor colorWithRed: ( CGFloat )0.22 green: ( CGFloat )0.33 blue: ( CGFloat )0.53 alpha: ( CGFloat )1 ];
        
        if( [ [ UIDevice currentDevice ] userInterfaceIdiom ] == UIUserInterfaceIdiomPad )
        {
            _mainLabel.font      = [ UIFont boldSystemFontOfSize: [ UIFont smallSystemFontSize ] ];
            _alternateLabel.font = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
        }
        else
        {
            _mainLabel.font      = [ UIFont boldSystemFontOfSize: ( CGFloat )10 ];
            _alternateLabel.font = [ UIFont systemFontOfSize: ( CGFloat )10 ];
        }
        
        _mainLabel.textAlignment        = UITextAlignmentLeft;
        _alternateLabel.textAlignment   = UITextAlignmentRight;
        
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
    
    if( _showInfos == YES )
    {
        _mainLabel.textColor      = [ UIColor lightTextColor ];
        _alternateLabel.textColor = [ UIColor lightTextColor ];
    }
    else
    {
        _mainLabel.textColor      = [ UIColor darkTextColor ];
        _alternateLabel.textColor = [ UIColor colorWithRed: ( CGFloat )0.22 green: ( CGFloat )0.33 blue: ( CGFloat )0.53 alpha: ( CGFloat )1 ];
    }
    
    self.imageView.frame = CGRectMake( ( CGFloat )10, ( CGFloat )5, ( CGFloat )32, ( CGFloat )32 );
            
    if( self.backgroundView == nil )
    {
        self.backgroundView = [ [ [ UIView alloc ] initWithFrame: CGRectZero ] autorelease ];
    }
    
    if( _showInfos == YES )
    {
        self.backgroundView.backgroundColor = [ UIColor colorWithPatternImage: [ UIImage imageNamed: @"CellBackground-Selected.png" ] ];
    }
    else if( _alternateBackground == YES )
    {
        self.backgroundView.backgroundColor = [ UIColor colorWithPatternImage: [ UIImage imageNamed: @"CellBackground-Blue.png" ] ];
    }
    else
    {
        self.backgroundView.backgroundColor = [ UIColor colorWithPatternImage: [ UIImage imageNamed: @"CellBackground.png" ] ];
    }
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
            {
                _mainLabel.text      = _file.displayName;
                _alternateLabel.text = @"";
                self.imageView.image = _file.icon;
                
                if( _file.isDirectory == YES )
                {
                    _alternateLabel.text = [ NSString stringWithFormat: NSLocalizedString( @"Items", @"Items" ), _file.numberOfSubFiles ];
                }
                else if( _file.targetFile.isDirectory == YES )
                {
                    _alternateLabel.text = [ NSString stringWithFormat: NSLocalizedString( @"Items", @"Items" ), _file.targetFile.numberOfSubFiles ];
                }
                else
                {
                    _alternateLabel.text = _file.humanReadableSize;
                }
                
                self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            }
            else
            {
                _mainLabel.text      = @"";
                _alternateLabel.text = @"";
                self.imageView.image = nil;
                self.accessoryType   = UITableViewCellAccessoryNone;
            }
        }
        
        _showInfos = NO;
        
        [ self layoutSubviews ];
    }
}

- ( IBAction )toggleDisplay: ( id )sender
{
    ( void )sender;
    
    if( __activeCell != nil && __activeCell != self && __activeCell->_showInfos == YES )
    {
        [ __activeCell toggleDisplay: nil ];
    }
    
    if( _showInfos == YES )
    {
        _showInfos = NO;
        
        _mainLabel.text = _file.displayName;
        
        if( _file.isDirectory == YES )
        {
            _alternateLabel.text = [ NSString stringWithFormat: NSLocalizedString( @"Items", @"Items" ), _file.numberOfSubFiles ];
        }
        else if( _file.targetFile.isDirectory == YES )
        {
            _alternateLabel.text = [ NSString stringWithFormat: NSLocalizedString( @"Items", @"Items" ), _file.targetFile.numberOfSubFiles ];
        }
        else
        {
            _alternateLabel.text = _file.humanReadableSize;
        }
    }
    else
    {
        _showInfos = YES;
        
        _mainLabel.text      = [ NSString stringWithFormat: @"%@:%@", _file.owner, _file.group ];
        _alternateLabel.text = _file.humanReadablePermissions;
        
        __activeCell = self;
    }
    
    [ self layoutSubviews ];
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
