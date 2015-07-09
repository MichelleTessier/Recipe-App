//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Michelle Tessier on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"

static CGFloat margin = 15;

@interface RecipeDetailViewController ()

@property (nonatomic) CGFloat labelWidth;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIScrollView *detailLabelScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    self.labelWidth = self.view.frame.size.width - (2 * margin);
    
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    CGFloat topMargin = 20;
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.labelWidth, heightForDescription)];
    description.text = [NSString stringWithFormat:@"%@", [RARecipes descriptionAtIndex:self.recipeIndex]];
    description.textColor = [UIColor blackColor];
    
#warning didn't understand why need number of lines
    description.numberOfLines = 0;
    
    [detailLabelScrollView addSubview:description];
    
    CGFloat top = topMargin + heightForDescription + margin * 2;
    
    UILabel *ingredientsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.labelWidth, 20)];
    ingredientsTitle.text = @"Ingredients";
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:17];
    
    [detailLabelScrollView addSubview:ingredientsTitle];
    
    top += 20 + margin;
    
    CGFloat ingredientLabelWidth = self.labelWidth / 2;
    CGFloat ingredientLabelHeight = 60;

for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
#warning in this instance is self.recipeIndex the same as _recipeIndex?

        UILabel *ingredientVolumes = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, self.labelWidth/4, 20)];
        ingredientVolumes.font = [UIFont boldSystemFontOfSize:17];
        ingredientVolumes.text =  [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        ingredientVolumes.textColor = [UIColor blackColor];
        
        [detailLabelScrollView addSubview:ingredientVolumes];
        
        CGFloat ingredientTypeX = margin + self.labelWidth/4;
        
        UILabel *ingredientTypes = [[UILabel alloc] initWithFrame:CGRectMake(ingredientTypeX, top, self.labelWidth * 3 / 4, 20)];
        ingredientTypes.numberOfLines = 0;
        ingredientTypes.font = [UIFont systemFontOfSize:15];
        ingredientTypes.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        ingredientTypes.textColor = [UIColor blackColor];
        
        [detailLabelScrollView addSubview:ingredientTypes];
        
        top += (20 + margin);
        
    }
    
    top += margin;
    
    UILabel *directionsTitle = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, self.labelWidth, 20)];
    directionsTitle.text = @"Directions";
    directionsTitle.font = [UIFont boldSystemFontOfSize:17];
    [detailLabelScrollView addSubview:directionsTitle];
    
    top += (20 + margin);
    
for (int i = 0; i < [[RARecipes directionsAtIndex: self.recipeIndex] count]; i++) {
    
    CGFloat directionsHeight = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
    UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin,top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        [detailLabelScrollView addSubview:count];
    
    UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, self.labelWidth-40, directionsHeight)];
    
    directions.numberOfLines = 0;
    directions.text = [NSString stringWithFormat:@"%@", [RARecipes directionsAtIndex:self.recipeIndex][i]];
    directions.textColor = [UIColor blackColor];
    
    [detailLabelScrollView addSubview:directions];
        
        top += (directionsHeight + margin);
    }
    
    detailLabelScrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
    [self.view addSubview:detailLabelScrollView];
}

-(CGFloat)heightForDescription:(NSString *)description{
    
#warning didn't understand this
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.labelWidth, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
}

-(CGFloat)heightForDirections:(NSString *)directions {
    
    CGRect bounding = [directions boundingRectWithSize:CGSizeMake(self.labelWidth - 40, CGFLOAT_MAX)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                context:nil];
    
    return bounding.size.height;
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
