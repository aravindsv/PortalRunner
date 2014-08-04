//
//  Gameplay.m
//  PortalRunner
//
//  Created by Aravind Vadali on 8/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "Player.h"
#import "Block.h"
#import "GameOver.h"

@implementation Gameplay
{
    CCPhysicsNode *_physicsNode;
    Player *_player;
    int playerPos;
    CGPoint touchLocation;
    
    NSMutableArray *_topObstacleArray;
    NSMutableArray *_bottomObstacleArray;
    
    int timer;
}

-(void)didLoadFromCCB
{
    self.userInteractionEnabled = true;
    _physicsNode.collisionDelegate = self;
    playerPos = 1;
    timer = 0;
    _topObstacleArray = [NSMutableArray array];
    _bottomObstacleArray = [NSMutableArray array];
//    [_physicsNode addChild:_topObstacleArray];
//    [_physicsNode addChild:_bottomObstacleArray];
    
}

-(void)update:(CCTime)delta
{
    timer++;
    //CCLOG(@"Timer = %d", timer);
    if (timer == 40)
    {
        Block *newBlock = (Block *)[CCBReader load:@"Block"];
        if (arc4random() % 2 == 0)
        {
            CCLOG(@"new block created on top");
            newBlock.position = ccp(400, 295);
            newBlock.physicsBody.velocity = ccp(-500, 0);
            [_physicsNode addChild:newBlock];
        }
        else
        {
            CCLOG(@"new block created on bottom");
            newBlock.position = ccp(400, 0);
            newBlock.physicsBody.velocity = ccp(-500, 0);
            [_physicsNode addChild:newBlock];
        }
        timer = 0;
    }
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

- (void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair *)pair block:(CCNode *)nodeA player:(CCNode *)nodeB
{
    CCLOG(@"Hit a block!");
    [self gameOver];
    
}

-(void)gameOver
{
    GameOver *gameOver = (GameOver *)[CCBReader load:@"GameOver" owner:self];
    gameOver.positionType = CCPositionTypeNormalized;
    gameOver.position = ccp(0, 0.25);
    [self addChild:gameOver];
}

@end
