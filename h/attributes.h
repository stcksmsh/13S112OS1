/**
 * @file attributes.h
 * @author stcksmsh (vukicevickosta@gmail.com)
 * @brief defines some attribute macros
 * @version 0.1
 * @date 2023-12-31
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#ifndef ATTRIBUTES_H
#define ATTRIBUTES_H


#define NORETURN __attribute__((noreturn))
#define PACKED __attribute__((packed))
#define ALIGNED(x) __attribute__((aligned(x)))
#define LIKELY(x) __builtin_expect(!!(x), 1)
#define UNLIKELY(x) __builtin_expect(!!(x), 0)

#endif // ATTRIBUTES_H