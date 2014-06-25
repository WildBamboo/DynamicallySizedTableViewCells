//
//  SAMDynamiclySizedTableViewCell.m
//  DynamiclySizedTableViewCells
//
//  Created by Joshua Wood on 25/06/14.
//  Copyright (c) 2014 Joshua Wood. All rights reserved.
//

#import "SAMDynamicallySizedTableViewCell.h"

@implementation SAMDynamicallySizedTableViewCell

- (void)awakeFromNib
{
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
}

@end
