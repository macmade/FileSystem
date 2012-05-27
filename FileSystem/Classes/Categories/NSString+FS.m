/*******************************************************************************
 * Copyright (c) 2012, Jean-David Gadina <macmade@eosgarden.com>
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   eosgarden 2012 - Jean-David Gadina <macmade@eosgarden.com>
 * @abstract    ...
 */

#import "NSString+FS.h"

@implementation NSString( FS )

+ ( NSString * )stringForSize: ( uint64_t )bytes
{
    double     size;
    NSString * unit;
    
    if( bytes > ( 1024 * 1024 * 1024 ) )
    {
        unit  = NSLocalizedString( @"SizeGigaBytes", @"SizeGigaBytes" );
        size  = ( double )( ( double )( ( double )bytes / ( double )1024 ) / ( double )1024 ) / ( double )1024;
    }
    else if( bytes > ( 1024 * 1024 ) )
    {
        unit = NSLocalizedString( @"SizeMegaBytes", @"SizeMegaBytes" );
        size = ( double )( ( double )bytes / ( double )1024 ) / ( double )1024;
    }
    else if( bytes > 1024 )
    {
        unit = NSLocalizedString( @"SizeKiloBytes", @"SizeKiloBytes" );
        size = ( double )( ( double )bytes / ( double )1024 );
    }
    else
    {
        unit = NSLocalizedString( @"SizeBytes", @"SizeBytes" );
        size = bytes;
    }
    
    return [ NSString stringWithFormat: unit, size ];
}

@end
