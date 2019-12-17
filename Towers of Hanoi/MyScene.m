//
//  MyScene.m
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import "MyScene.h"
#import "Stone.h"
#import "Post.h"
#import "HanoiTowers.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        _h = [HanoiTowers hanoiTowersWithNumberOfStones:10];
        [self addChild:_h];
    }
    return self;
}

-(void)mouseDown:(NSEvent *)theEvent
{
    static BOOL solved = NO;
    if (!solved)
    {
        [_h solve];
        solved = YES;
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end
