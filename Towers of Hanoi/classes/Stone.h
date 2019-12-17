//
//  Stone.h
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#define kStoneHeight 24.0
#define kStoneBaseWidth 96.0

@interface Stone : SKSpriteNode

+(id)stoneWithOrder:(NSUInteger)order;

@property NSUInteger order;

@end
