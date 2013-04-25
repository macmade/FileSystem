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
