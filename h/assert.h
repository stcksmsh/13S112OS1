/**
 * @file assert.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief assert macro
 * @version 0.1
 * @date 2024-01-01
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#ifndef ASSERT_H
#define ASSERT_H

#include "attributes.h"

/// @brief prints the file and line where the assert failed
/// @param file file where the assert failed
/// @param line line where the assert failed
void assert_failed( const char* file, int line );

#define assert( expr ) \
    if( UNLIKELY(!(expr)) ){ assert_failed( __FILE__, __LINE__ ); }

#endif // ASSERT_H