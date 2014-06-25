//
//  SAMModel.h
//  DynamiclySizedTableViewCells
//
//  Created by Joshua Wood on 25/06/14.
//  Copyright (c) 2014 Joshua Wood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAMModel : NSObject

@property (strong, nonatomic) NSString *label;
@property (strong, nonatomic) NSString *content;

- (instancetype)initWithLabel:(NSString *)label content:(NSString *)content;

@end
