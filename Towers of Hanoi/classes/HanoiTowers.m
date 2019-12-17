//
//  HanoiTowers.m
//  Towers of Hanoi
//
//  Created by Samuel Leško on 15/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import "HanoiTowers.h"
#import "Post.h"
#import "Stone.h"
#import "AppDelegate.h"

@implementation HanoiTowers

+(id)hanoiTowersWithNumberOfStones:(NSUInteger)count
{
    return [[self alloc] initWithNumberOfStones:count];
}

-(id)initWithNumberOfStones:(NSUInteger)count
{
    if ([super init])
    {
        _count = count;
        CGFloat win_width = 1024;
        CGFloat win_height = 768;
        Post *post1 = [Post postWithPosition:CGPointMake(0.17 * win_width,
                                                         kPostHeight / 2)];
        Post *post2 = [Post postWithPosition:CGPointMake(0.5 * win_width,
                                                         kPostHeight / 2)];
        Post *post3 = [Post postWithPosition:CGPointMake(0.83 * win_width,
                                                         kPostHeight / 2)];
        _posts = [NSArray arrayWithObjects:post1, post2, post3, nil];
        [self addChild:post1];
        [self addChild:post2];
        [self addChild:post3];
        
        [self addStones:count toPost:0];
        
        _moves = [NSMutableArray array];
        
        _label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        _label.position = CGPointMake(0.75 * win_width, 0.9 * win_height);
        _label.fontSize = 25.0;
        [self addChild:_label];
    }
    
    return self;
}

-(void)solve
{
    NSAssert(((Post *)_posts[0]).numberOfStones == _count &&
             ((Post *)_posts[1]).numberOfStones == 0 &&
             ((Post *)_posts[2]).numberOfStones == 0,
             @"Stones not in initial positions. Not ready to solve.");
    
    [self moveNumberOfStones:_count from:0 to:2];
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}

-(void)moveNumberOfStones:(NSUInteger)count from:(NSUInteger)origin to:(NSUInteger)destination
{
    NSAssert(origin != destination, @"Origin same as destination when moving stones.");
    NSAssert(origin < 3 && destination < 3, @"Id of a post cannot be higher than 2.");
    
    if (count > 1)
    {
        [self moveNumberOfStones:count - 1
                            from:origin
                              to:3 - origin - destination];
    }
    
    [self putMoveIntoQueueFrom:origin to:destination];
    
    if (count > 1)
    {
        [self moveNumberOfStones:count - 1
                            from:3 - origin - destination
                              to:destination];
    }
}

-(void)putMoveIntoQueueFrom:(NSUInteger)origin to:(NSUInteger)destination
{
    NSAssert(origin != destination, @"Origin same as destination when moving a stone.");
    NSAssert(origin < 3 && destination < 3, @"Id of a post cannot be higher than 2.");
    
    [_moves addObject:[NSArray arrayWithObjects:
                       [NSNumber numberWithUnsignedInteger:origin],
                       [NSNumber numberWithUnsignedInteger:destination],
                       nil]];
}

-(void)addStones:(NSUInteger)count toPost:(NSUInteger)post
{
    for (int i = 0; i < count; ++i)
    {
        [((Post *)_posts[post]) pushStone:[Stone stoneWithOrder:count-i-1]];
    }
}

-(void)timer
{
    if ([_moves count] > 0)
    {
        static unsigned numberOfMoves = 0;
        
        NSUInteger origin = [((NSNumber *)((NSArray *)_moves[0])[0]) unsignedIntegerValue];
        NSUInteger destination = [((NSNumber *)((NSArray *)_moves[0])[1]) unsignedIntegerValue];
        [_moves removeObjectAtIndex:0];
        [((Post *)_posts[destination]) pushStone:([(Post *)_posts[origin] popStone])];
        
        ++numberOfMoves;
        _label.text = [NSString stringWithFormat:@"Moves: %u", numberOfMoves];
    }
    
}

@end
