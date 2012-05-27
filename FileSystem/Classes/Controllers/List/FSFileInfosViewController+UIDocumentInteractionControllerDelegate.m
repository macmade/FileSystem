/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * gfile        ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "FSFileInfosViewController+UIDocumentInteractionControllerDelegate.h"

@implementation FSFileInfosViewController (UIDocumentInteractionControllerDelegate)

- ( void )documentInteractionController: ( UIDocumentInteractionController * )controller didEndSendingToApplication: ( NSString * )application
{
    ( void )application;
    
    [ controller release ];
}

@end
