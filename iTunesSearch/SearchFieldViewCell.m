//
//  SearchFieldViewCell.m
//  iTunesSearch
//
//  Created by Guilherme Ferreira de Souza on 3/10/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "SearchFieldViewCell.h"
#import "TableViewController.h"

@implementation SearchFieldViewCell

- (void)awakeFromNib {
    
    self.searchField.placeholder = NSLocalizedString(@"pesquisa", nil);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
