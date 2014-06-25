//
//  SAMTableViewController.m
//  DynamiclySizedTableViewCells
//
//  Created by Joshua Wood on 25/06/14.
//  Copyright (c) 2014 Joshua Wood. All rights reserved.
//

#import "SAMTableViewController.h"
#import "SAMModel.h"
#import "SAMDynamicallySizedTableViewCell.h"
#import "SAMFixedSizedTableViewCell.h"

static NSString *kDynamicCellIdentifier = @"dynamicSizedCell";
static NSString *kFixedCellIdentifier = @"fixedSizedCell";

@interface SAMTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation SAMTableViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.offscreenCells = [[NSMutableDictionary alloc] init];
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.dataSource = @[
                        [[SAMModel alloc] initWithLabel:@"label 1" content:@"sofe egew wegw weg nwkelg weg nlkgw wnekgwe wegnwel gewgw lnlnew l nlsf lnglsg lenfn.  sfhaghe hgelahg ;ehg;ah as;ghe rgr"],
                        [[SAMModel alloc] initWithLabel:@"label 2" content:@"sofe egew wegw weg nwkelg"],
                        [[SAMModel alloc] initWithLabel:@"label 3" content:@"sofe egew wegw weg nwkelg weg nlkgw wnekgwe wegnwel gewgw lnlnew l nlsf lnglsg lenfn.  sfhaghe"],
                        [[SAMModel alloc] initWithLabel:@"label 4" content:@"sofe egew wegw weg nwkelg weg nlkgw wnekgwe wegnwel gewgw lnlnew l nlsf lnglsg lenfn.  sfhaghe hgelahg ;ehg;ah as;ghe rgr sofe egew wegw weg nwkelg weg nlkgw wnekgwe wegnwel gewgw lnlnew l nlsf lnglsg lenfn.  sfhaghe hgelahg ;ehg;ah as;ghe rgr"]
                        ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dataSource.count;
    }
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Dynamic";
    }
    return @"Fixed";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // http://stackoverflow.com/questions/18746929/using-auto-layout-in-uitableview-for-dynamic-cell-layouts-variable-row-heights
    if (indexPath.section == 0) {
        SAMDynamicallySizedTableViewCell *cell = [self.offscreenCells objectForKey:kDynamicCellIdentifier];
        if (!cell) {
            cell = [[SAMDynamicallySizedTableViewCell alloc] init];
            [self.offscreenCells setObject:cell forKey:kDynamicCellIdentifier];
        }
        
        SAMModel *model = self.dataSource[indexPath.row];
        cell.labelLabel.text = model.label;
        cell.contentLabel.text = model.content;
        
        // No constraints added in coded, don't need following lines.
//        [cell setNeedsUpdateConstraints];
//        [cell updateConstraintsIfNeeded];
        
        //cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));

        // PreferredMaxLayoutWidth set in cell. Makes no difference if set there or here.
        //cell.contentLabel.preferredMaxLayoutWidth = 285.0f;
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        height += 1.0f;
        NSLog(@"%f", height);
        return height;
    }
    else {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SAMDynamicallySizedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDynamicCellIdentifier forIndexPath:indexPath];
        SAMModel *model = self.dataSource[indexPath.row];
        cell.labelLabel.text = model.label;
        cell.contentLabel.text = model.content;
        
        // No constraints added in coded, don't need following lines.
//        [cell setNeedsUpdateConstraints];
//        [cell updateConstraintsIfNeeded];
        
        return cell;
    }
    else {
        SAMFixedSizedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFixedCellIdentifier forIndexPath:indexPath];
        return cell;
    }
}


@end
