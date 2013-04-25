/*******************************************************************************
 * Copyright (c) 2013, Jean-David Gadina - www.xs-labs.com
 * All rights reserved
 ******************************************************************************/
 
/* $Id$ */

/*!
 * @file        ...
 * @copyright   XS-Labs 2013 - Jean-David Gadina - www.xs-labs.com
 * @abstract    ...
 */

#import "NSString+FS.h"

#ifdef __clang__
#pragma clang diagnostic ignored "-Wformat-nonliteral"
#endif

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
