//
//  SAMModel.m
//  DynamiclySizedTableViewCells
//
//  Created by Joshua Wood on 25/06/14.
//  Copyright (c) 2014 Joshua Wood. All rights reserved.
//

#import "SAMModel.h"

@implementation SAMModel

- (instancetype)initWithLabel:(NSString *)label content:(NSString *)content {
    if (self = [super init]) {
        self.label = label;
        self.content = content;
    }
    return self;
}

@end
