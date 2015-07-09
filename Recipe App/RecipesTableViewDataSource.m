//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Michelle Tessier on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

static NSString *cellID = @"cellID";

@implementation RecipesTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RARecipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row ];
    cell.textLabel.textColor = [UIColor purpleColor];
    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0];
    cell.detailTextLabel.font  =  [UIFont fontWithName: @"Helvetica" size: 12.0];
    
    return cell;
}

@end
