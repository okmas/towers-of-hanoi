//
//  Post.m
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import "Post.h"
#import "Stone.h"

@implementation Post

+(id)postWithPosition:(CGPoint)pos
{
    return [[self alloc] initWithPosition:pos];
}

-(id)initWithPosition:(CGPoint)pos
{
    CGSize size = CGSizeMake(kPostWidth, kPostHeight);
    
    if (self = [super initWithColor:[NSColor brownColor] size:size])
    {
        self.position = pos;
        _stones = [NSMutableArray array];
        _numberOfStones = 0;
    }
    
    return self;
}

-(void)pushStone:(Stone *)stone
{
    if (_numberOfStones == 0)
    {
        stone.position = CGPointMake(0, -kPostHeight / 2 + kStoneHeight / 2);
    }
    else
    {
        Stone *last = ((Stone *)[_stones lastObject]);
        NSAssert(last.order > stone.order, @"Putting a bigger stone onto a smaller.");
        
        float prevY = last.position.y;
        stone.position = CGPointMake(0,
                                     prevY + kStoneHeight);
    }
    
    [self addChild:stone];
    
    [_stones addObject:stone];
    ++_numberOfStones;
}

-(Stone *)popStone
{
    Stone *stone = [_stones lastObject];
    
    [self removeChildrenInArray:[NSArray arrayWithObject:stone]];
    [_stones removeLastObject];
    --_numberOfStones;
    
    return stone;
}

@end
