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

#import "FSTextViewController.h"

@interface FSTextViewController( Private )

- ( void )loadText: ( UISegmentedControl * )segment;
- ( void )loadHex: ( UISegmentedControl * )segment;
- ( IBAction )openIn: ( id )sender;
- ( IBAction )showInfos: ( id )sender;
- ( IBAction )toggleDisplay: ( id )sender;

@end
