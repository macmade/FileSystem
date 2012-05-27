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

#import <MediaPlayer/MediaPlayer.h>

@class FSFile;

@interface FSAVViewController: MPMoviePlayerViewController
{
@protected
    
    FSFile * _file;
    
@private
    
    id __FSAVViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}

- ( id )initWithFile: ( FSFile * )file;

@end
