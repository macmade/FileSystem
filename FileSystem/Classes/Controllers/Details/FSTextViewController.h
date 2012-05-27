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

@class FSFile;
@class FSHUDView;

@interface FSTextViewController: UIViewController
{
@protected
    
    FSFile     * _file;
    UITextView * _textView;
    FSHUDView  * _hud;
    BOOL         _hasText;
    BOOL         _hasHex;
    
@private
    
    id __FSAVViewController_Reserved[ 5 ] __attribute__( ( unused ) );
}

@property( nonatomic, readwrite, retain ) IBOutlet UITextView * textView;

- ( id )initWithFile: ( FSFile * )file;

@end
