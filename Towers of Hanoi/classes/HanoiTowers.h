//
//  HanoiTowers.h
//  Towers of Hanoi
//
//  Created by Samuel Leško on 15/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HanoiTowers : SKNode
{
    NSUInteger _count;
    NSArray *_posts;
    NSMutableArray *_moves;
    SKLabelNode *_label;
}

+(id)hanoiTowersWithNumberOfStones:(NSUInteger)count;
-(void)solve;

@end
