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

#import "FSTextViewController.h"
#import "FSTextViewController+Private.h"
#import "FSFile.h"
#import "FSHUDView.h"

@implementation FSTextViewController

@synthesize textView = _textView;

- ( id )initWithFile: ( FSFile * )file
{
    if( ( self = [ self initWithNibName: @"FSTextView" bundle: nil ] ) )
    {
        _file = [ file retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ _file     release ];
    [ _textView release ];
    [ _hud      release ];
    
    _textView = nil;
    
    [ super dealloc ];
}

- ( void )viewDidUnload
{
    [ _file     release ];
    [ _textView release ];
    [ _hud      release ];
    
    [ super viewDidUnload ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    self.navigationItem.title = _file.displayName;
    _textView.text            = @"";
    _textView.font            = [ UIFont fontWithName: @"Courier" size: [ UIFont smallSystemFontSize ] ];
    
    _hud        = [ FSHUDView new ];
    _hud.center = self.view.center;
    
    if( _file.size > 0 )
    {
        [ self.view addSubview: _hud ];
    }
}

- ( void )viewDidAppear: ( BOOL )animated
{
    UIBarButtonItem    * spacer;
    UIBarButtonItem    * item;
    UIBarButtonItem    * infos;
    UIBarButtonItem    * openIn;
    UISegmentedControl * segment;
    
    [ super viewDidAppear: animated ];
    
    spacer = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target: nil action: NULL ];
    
    segment                       = [ [ UISegmentedControl alloc ] initWithItems: [ NSArray arrayWithObjects: NSLocalizedString( @"ASCII", @"ASCII" ), NSLocalizedString( @"Hex", @"Hex" ), nil ] ];
    segment.segmentedControlStyle = UISegmentedControlStyleBar;
    segment.selectedSegmentIndex  = ( _hasHex == YES ) ? 1 : 0;
    
    [ segment addTarget: self action: @selector( toggleDisplay: ) forControlEvents: UIControlEventValueChanged ];
    
    if( _hasText == NO && _hasHex == NO && _file.size > 0 )
    {
        [ NSThread detachNewThreadSelector: @selector( loadText: ) toTarget: self withObject: segment ];
    }
    
    item                                    = [ [ UIBarButtonItem alloc ] initWithCustomView: segment ];
    infos                                   = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target: self action: @selector( showInfos: ) ];
    openIn                                  = [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemAction target: self action: @selector( openIn: ) ];
    
    if( _file.size > 0 )
    {
        self.navigationController.toolbar.items = [ NSArray arrayWithObjects: infos, spacer, item, spacer, openIn, nil ];
    }
    else
    {
        self.navigationController.toolbar.items = [ NSArray arrayWithObjects: infos, spacer, openIn, nil ];
    }
    
    [ spacer    release ];
    [ item      release ];
    [ segment   release ];
    [ infos     release ];
    [ openIn    release ];
}

- ( BOOL )shouldAutorotateToInterfaceOrientation: ( UIInterfaceOrientation )orientation
{
    ( void )orientation;
    
    return YES;
}

@end
