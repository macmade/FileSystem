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

#import "FSFileListTableViewController+UITableViewDataSource.h"
#import "FSFileListTableViewCell.h"
#import "FSFile.h"

@implementation FSFileListTableViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 1;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return ( NSInteger )_files.count;
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    id                        object;
    FSFileListTableViewCell * cell;
    
    cell = ( FSFileListTableViewCell * )[ tableView dequeueReusableCellWithIdentifier: FSFileListTableViewCellID ];
    
    if( cell == nil || [ cell isKindOfClass: [ FSFileListTableViewCell class ] ] == NO )
    {
        cell = [ [ FSFileListTableViewCell new ] autorelease ];
    }
    
    @try
    {
        object = [ _files objectAtIndex: ( NSUInteger )( indexPath.row ) ];
        
        if( [ object isKindOfClass: [ FSFile class ] ] )
        {
            cell.file = object;
        }
        else if( [ object isKindOfClass: [ NSString class ] ] )
        {
            cell.file               = nil;
            cell.textLabel.text     = [ [ NSFileManager defaultManager ] displayNameAtPath: object ];
            cell.imageView.image    = [ UIImage imageNamed: @"Protected.png" ];
        }
    }
    @catch ( NSException * e )
    {
        ( void )e;
        
        cell.file = nil;
    }
    
    cell.alternateBackground = ( indexPath.row % 2 ) ? YES : NO;
    
    return cell;
}

@end
