//
//  Block.m
//  PortalRunner
//
//  Created by Aravind Vadali on 8/4/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Block.h"

@implementation Block
{
    
}

-(void)didLoadFromCCB
{
    self.physicsBody.collisionType = @"block";
}

-(id)init
{
    if (self == [super init])
        return self;
}



@end
