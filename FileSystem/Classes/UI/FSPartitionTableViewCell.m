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

#import "FSPartitionTableViewCell.h"
#import "FSPartition.h"
#import "FSFile.h"
#import "NSString+FS.h"

NSString * const FSPartitionTableViewCellID = @"FSPartitionTableViewCell";

@implementation FSPartitionTableViewCell

@synthesize mountPoint = _mountPoint;

- ( id )init
{
    CGFloat height;
    CGFloat leftWidth;
    CGFloat rightWidth;
    CGFloat x;
    CGFloat y;
    
    if( ( self = [ self initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: FSPartitionTableViewCellID ] ) )
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        x          = ( [ [ UIDevice currentDevice ] userInterfaceIdiom ] == UIUserInterfaceIdiomPad ) ? 100 : 60;
        y          = ( CGFloat )5;
        height     = self.bounds.size.height / ( CGFloat )2;
        leftWidth  = ( self.bounds.size.width  * ( CGFloat )0.6 );
        rightWidth = ( self.bounds.size.width  * ( CGFloat )0.4 );
        
        _nameLabel  = [ [ UILabel alloc ] initWithFrame: CGRectMake( x,         y,      leftWidth  - x,  height - y ) ];
        _diskLabel  = [ [ UILabel alloc ] initWithFrame: CGRectMake( x,         height, leftWidth  - x,  height ) ];
        _spaceLabel = [ [ UILabel alloc ] initWithFrame: CGRectMake( leftWidth, y,      rightWidth - x, height - y ) ];
        _typeLabel  = [ [ UILabel alloc ] initWithFrame: CGRectMake( leftWidth, height, rightWidth - x, height ) ];
        
        _nameLabel.backgroundColor  = [ UIColor clearColor ];
        _diskLabel.backgroundColor  = [ UIColor clearColor ];
        _spaceLabel.backgroundColor = [ UIColor clearColor ];
        _typeLabel.backgroundColor  = [ UIColor clearColor ];
        
        _nameLabel.textColor  = [ UIColor darkTextColor ];
        _diskLabel.textColor  = [ UIColor colorWithWhite: ( CGFloat )0.5 alpha: ( CGFloat )1 ];
        _spaceLabel.textColor = [ UIColor colorWithRed: ( CGFloat )0.22 green: ( CGFloat )0.33 blue: ( CGFloat )0.53 alpha: ( CGFloat )1 ];
        _typeLabel.textColor  = [ UIColor colorWithWhite: ( CGFloat )0.5 alpha: ( CGFloat )1 ];
        
        _nameLabel.font     = [ UIFont boldSystemFontOfSize: [ UIFont systemFontSize ] ];
        _diskLabel.font     = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
        _spaceLabel.font    = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
        _typeLabel.font     = [ UIFont systemFontOfSize: [ UIFont smallSystemFontSize ] ];
        
        _nameLabel.textAlignment    = UITextAlignmentLeft;
        _diskLabel.textAlignment    = UITextAlignmentLeft;
        _spaceLabel.textAlignment   = UITextAlignmentRight;
        _typeLabel.textAlignment    = UITextAlignmentRight;
        
        _nameLabel.autoresizingMask     = UIViewAutoresizingFlexibleWidth
                                        | UIViewAutoresizingFlexibleHeight
                                        | UIViewAutoresizingFlexibleTopMargin
                                        | UIViewAutoresizingFlexibleRightMargin
                                        | UIViewAutoresizingFlexibleBottomMargin;
        _diskLabel.autoresizingMask     = UIViewAutoresizingFlexibleWidth
                                        | UIViewAutoresizingFlexibleHeight
                                        | UIViewAutoresizingFlexibleTopMargin
                                        | UIViewAutoresizingFlexibleRightMargin
                                        | UIViewAutoresizingFlexibleBottomMargin;
        _spaceLabel.autoresizingMask    = UIViewAutoresizingFlexibleWidth
                                        | UIViewAutoresizingFlexibleHeight
                                        | UIViewAutoresizingFlexibleLeftMargin
                                        | UIViewAutoresizingFlexibleTopMargin
                                        | UIViewAutoresizingFlexibleBottomMargin;
        _typeLabel.autoresizingMask     = UIViewAutoresizingFlexibleWidth
                                        | UIViewAutoresizingFlexibleHeight
                                        | UIViewAutoresizingFlexibleLeftMargin
                                        | UIViewAutoresizingFlexibleTopMargin
                                        | UIViewAutoresizingFlexibleBottomMargin;
        
        [ self addSubview: _nameLabel ];
        [ self addSubview: _diskLabel ];
        [ self addSubview: _spaceLabel ];
        [ self addSubview: _typeLabel ];
    }
    
    return self;
}

- ( id )initWithPartition: ( FSPartition * )partition
{
    if( ( self = [ self init ] ) )
    {
        self.partition = partition;
    }
    
    return self;
}

- ( void )dealloc
{
    [ _nameLabel    release ];
    [ _diskLabel    release ];
    [ _spaceLabel   release ];
    [ _typeLabel    release ];
    [ _partition    release ];
    [ _mountPoint   release ];
    
    [ super dealloc ];
}

- ( FSPartition * )partition
{
    @synchronized( self )
    {
        return _partition;
    }
}

- ( void )setPartition: ( FSPartition * )partition
{
    @synchronized( self )
    {
        if( partition != _partition )
        {
            [ _partition  release ];
            [ _mountPoint release ];
            
            _partition  = [ partition retain ];
            _mountPoint = [ [ FSFile alloc ] initWithPath: partition.mountPoint ];
            
            _nameLabel.text         = partition.mountPoint;
            _diskLabel.text         = partition.mountedFS;
            _spaceLabel.text        = [ NSString stringForSize: partition.blocks * partition.blockSize ];
            _typeLabel.text         = [ partition.typeName uppercaseString ];
            self.imageView.image    = [ UIImage imageNamed: @"Device-Block.png" ];
            
            if( _mountPoint == nil || _mountPoint.isReadable == NO )
            {
                self.accessoryType = UITableViewCellAccessoryNone;
            }
            else
            {
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        }
    }
}

@end
