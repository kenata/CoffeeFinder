//
//  TCFLabelCollectionViewCell.m
//  CoffeeFinder
//
//  Created by Joshua Ridenhour on 12/17/14.
//  Copyright (c) 2014 Joshua Ridenhour. All rights reserved.
//

#import "TCFLabelCollectionViewCell.h"

@interface TCFLabelCollectionViewCell ()

@property (nonatomic,weak) IBOutlet UILabel * titleLabel;
@property (nonatomic,weak) IBOutlet UILabel * infoLabel ;

@end

@implementation TCFLabelCollectionViewCell

- (void)awakeFromNib {
}

@end
