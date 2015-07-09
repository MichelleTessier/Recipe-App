//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Michelle Tessier on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Yummy, Yummy Recipes";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.dataSource = [RecipesTableViewDataSource new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self.dataSource;

    
    
    
    [self.view addSubview:self.tableView];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecipeDetailViewController *detailViewController = [RecipeDetailViewController new];
    
    detailViewController.recipeIndex = indexPath.row;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
