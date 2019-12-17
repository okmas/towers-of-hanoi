//
//  Stone.m
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import "Stone.h"

@implementation Stone

+(id)stoneWithOrder:(NSUInteger)order
{
    return [[self alloc] initWithOrder:order];
}

-(id)initWithOrder:(NSUInteger)order
{
    NSColor *color;
    switch (order % 10)
    {
        case 0: color = [NSColor whiteColor]; break;
        case 1: color = [NSColor orangeColor]; break;
        case 2: color = [NSColor greenColor]; break;
        case 3: color = [NSColor purpleColor]; break;
        case 4: color = [NSColor grayColor]; break;
        case 5: color = [NSColor cyanColor]; break;
        case 6: color = [NSColor yellowColor]; break;
        case 7: color = [NSColor magentaColor]; break;
        case 8: color = [NSColor redColor]; break;
        case 9: color = [NSColor blueColor]; break;
            
        default: color = [NSColor brownColor]; break;
    }
    
    CGSize size;
    size.width = kStoneBaseWidth + 14 * order;
    size.height = kStoneHeight;
    
    if (self = [super initWithColor:color size:size])
    {
        self.order = order;
    }
    
    return self;
}

@end
