//
//  Gameplay.m
//  PortalRunner
//
//  Created by Aravind Vadali on 8/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "Player.h"

@implementation Gameplay
{
    CCPhysicsNode *_physicsNode;
    Player *_player;
    int playerPos;
    CGPoint touchLocation;
}

-(void)didLoadFromCCB
{
    self.userInteractionEnabled = true;
    playerPos = 1;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    touchLocation = [touch locationInWorld];
    if (playerPos == 1)
    {
        if (touchLocation.y > self.contentSizeInPoints.height/2)
        {
            [self playerJump];
        }
        else
        {
            CCLOG(@"%f, %f", _player.position.x, _player.position.y);
            _player.position = ccp(.015899, .017317);
            playerPos = 0;
        }
    }
    else if (playerPos == 0)
    {
        if (touchLocation.y < self.contentSizeInPoints.height/2)
        {
            [self playerJump];
        }
        else
        {
            _player.position = ccp(.015899, .517317);
            playerPos = 1;
        }
    }
    CCLOG(@"%f, %f", touchLocation.x, touchLocation.y);
}

-(void)playerJump
{
    [_player.physicsBody applyImpulse:ccp(0, 200)];
    [_player.animationManager runAnimationsForSequenceNamed:@"JumpAnimation"];
}

@end
