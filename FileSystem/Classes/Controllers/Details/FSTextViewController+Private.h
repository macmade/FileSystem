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

#import "FSTextViewController.h"

@interface FSTextViewController( Private )

- ( void )loadText: ( UISegmentedControl * )segment;
- ( void )loadHex: ( UISegmentedControl * )segment;
- ( IBAction )openIn: ( id )sender;
- ( IBAction )showInfos: ( id )sender;
- ( IBAction )toggleDisplay: ( id )sender;

@end
