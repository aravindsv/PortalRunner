//
//  GameOver.m
//  PortalRunner
//
//  Created by Aravind Vadali on 8/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameOver.h"

@implementation GameOver
{
    CCLabelTTF *_gameOverLabel;
}

-(void)didLoadFromCCB
{
    self.userInteractionEnabled = true;
}

-(void)replay
{
    CCLOG(@"Replaying Game...");
    CCScene *gameplay = (CCScene *)[CCBReader load:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplay];
}

@end
