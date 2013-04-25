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

#import "FSFileListTableViewController+UITableViewDelegate.h"
#import "FSFileListTableViewCell.h"
#import "FSFile.h"
#import "FSTextViewController.h"
#import "FSImageViewController.h"
#import "FSAVViewController.h"
#import "FSFileInfosViewController.h"
#import "FSFileInfosViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation FSFileListTableViewController( UITableViewDelegate )

- ( void )tableView: ( UITableView * )tableView didSelectRowAtIndexPath: ( NSIndexPath * )indexPath
{
    FSFileListTableViewCell * cell;
    UIViewController        * controller;
    FSFile                  * file;
    UIAlertView             * alert;
    
    cell       = ( FSFileListTableViewCell * )[ tableView cellForRowAtIndexPath: indexPath ];
    controller = nil;
    file       = ( cell.file.targetFile == nil ) ? cell.file : cell.file.targetFile;
    
    [ NSThread detachNewThreadSelector: @selector( startAnimating ) toTarget: cell withObject: nil ];
    [ tableView deselectRowAtIndexPath: indexPath animated: YES ];
    
    if( file.isReadable == YES && file.isDirectory == YES )
    {
        controller = [ [ FSFileListTableViewController alloc ] initWithFile: file ];
    }
    else if( file.isReadable == YES )
    {
        if( file.isImage == YES )
        {
            controller = [ [ FSImageViewController alloc ] initWithFile: file ];
        }
        else if( file.isAudio == YES || file.isVideo == YES )
        {
            controller = [ [ FSAVViewController alloc ] initWithFile: file ];
        }
        else
        {
            controller = [ [ FSTextViewController alloc ] initWithFile: file ];
        }
    }
    else if( file != nil )
    {
        controller = [ [ FSFileInfosViewController alloc ] initWithFile: file ];
    }
    else
    {
        alert = [ [ UIAlertView alloc ] initWithTitle: NSLocalizedString( @"ProtectedFileAlertTitle", @"ProtectedFileAlertTitle" ) message: NSLocalizedString( @"ProtectedFileAlertText", @"ProtectedFileAlertText" ) delegate: nil cancelButtonTitle: NSLocalizedString( @"OK", @"OK" ) otherButtonTitles: nil ];
        
        [ alert show ];
        [ alert autorelease ];
    }
    
    if( controller != nil )
    {
        if( [ controller isKindOfClass: [ MPMoviePlayerViewController class ] ] )
        {
            [ self.navigationController presentMoviePlayerViewControllerAnimated: ( MPMoviePlayerViewController * )controller ];
        }
        else
        {
            [ self.navigationController pushViewController: controller animated: YES ];
        }
    }
    
    [ controller release ];
}

- ( void )tableView: ( UITableView * )tableView accessoryButtonTappedForRowWithIndexPath: ( NSIndexPath * )indexPath
{
    FSFileListTableViewCell * cell;
    UIViewController        * controller;
    FSFile                  * file;
    
    cell       = ( FSFileListTableViewCell * )[ tableView cellForRowAtIndexPath: indexPath ];
    file       = ( cell.file.targetFile == nil ) ? cell.file : cell.file.targetFile;
    controller = [ [ FSFileInfosViewController alloc ] initWithFile: file ];
    
    if( controller != nil )
    {
        [ self.navigationController pushViewController: controller animated: YES ];
    }
    
    [ controller release ];
}

@end
