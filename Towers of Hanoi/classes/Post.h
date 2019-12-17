//
//  Post.h
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@class Stone;

#define kPostWidth 16.0
#define kPostHeight 512.0

@interface Post : SKSpriteNode
{
    NSMutableArray *_stones;
}

+(id)postWithPosition:(CGPoint)pos;
-(void)pushStone:(Stone *)stone;
-(Stone *)popStone;

@property unsigned numberOfStones;

@end
