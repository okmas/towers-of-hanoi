//
//  AppDelegate.m
//  Towers of Hanoi
//
//  Created by Samuel Leško on 14/08/15.
//  Copyright (c) 2015 samolesko. All rights reserved.
//

#import "AppDelegate.h"
#import "MyScene.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    /* Pick a size for the scene */
    MyScene *scene = [MyScene sceneWithSize:CGSizeMake(1024, 768)];
    
    /* Set the scale mode to scale to fit the window */
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    [self.skView presentScene:scene];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
