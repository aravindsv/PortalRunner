//
//  Player.m
//  PortalRunner
//
//  Created by Aravind Vadali on 8/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Player.h"

@implementation Player

-(void)didLoadFromCCB
{
    self.physicsBody.collisionType = @"player";
}

@end
