/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * gfile        ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "FSTextViewController+UIDocumentInteractionControllerDelegate.h"

@implementation FSTextViewController (UIDocumentInteractionControllerDelegate)

- ( void )documentInteractionController: ( UIDocumentInteractionController * )controller didEndSendingToApplication: ( NSString * )application
{
    ( void )application;
    
    [ controller release ];
}

@end
