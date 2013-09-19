//
//  BackwardCompatibilityCGRect.m
//  TestXcode5
//
//  Created by Albert Chu on 13-9-19.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "BackwardCompatibilityCGRect.h"

@implementation BackwardCompatibilityCGRect

#pragma mark - Singleton

+ (BackwardCompatibilityCGRect *)sharedInstance
{
    static dispatch_once_t pred;
    static BackwardCompatibilityCGRect *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (CGRect)backwardCompatibilityCGRectBy:(CGFloat)x and:(CGFloat)y and:(CGFloat)w and:(CGFloat)h
{
    if ( SystemVersion_floatValue >= 7.f )
    {
        return CGRectMake(x, y, w, h);
    }
    else
    {
        return CGRectMake(x, (y-64.f), w, h);
    }
}

@end