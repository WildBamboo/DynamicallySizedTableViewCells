//
//  SAMDynamiclySizedTableViewCell.m
//  DynamiclySizedTableViewCells
//
//  Created by Joshua Wood on 25/06/14.
//  Copyright (c) 2014 Joshua Wood. All rights reserved.
//

#import "SAMDynamiclySizedTableViewCell.h"

@implementation SAMDynamiclySizedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
