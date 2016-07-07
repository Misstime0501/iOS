//
//  ViewController.m
//  NormalProblem
//
//  Created by LiChen on 6/29/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"
#import "BusinessCardView.h"
#import "Model.h"
#import "ModelAdapter.h"
#import "NewCardModel.h"
#import "NewCardModelApater.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BusinessCardView *cardView = [[BusinessCardView alloc] initWithFrame:BUSINESS_FRAME];
    
    cardView.center = self.view.center;
//    cardView.name = @"lichen";
//    cardView.lineColor = [UIColor redColor];
//    cardView.phoneNumber = @"15110167466";
    
    Model *model = [[Model alloc] init];
    model.name = @"lichen";
    model.lineColor = [UIColor redColor];
    model.phoneNumber = @"15110167466";

    NewCardModel *newCardModel = [[NewCardModel alloc] init];
    newCardModel.name = @"lichen";
    newCardModel.colorHexString = @"black";
    newCardModel.phoneNumber = @"15110167466";
    
    
    BusinessCardAdapter *modelAdapter = [[NewCardModelApater alloc] initWithData:newCardModel];
    [cardView loadData:modelAdapter];
//    BusinessCardAdapter *modelAdapter = [[ModelAdapter alloc] initWithData:model];
//    [cardView loadData:modelAdapter];
    
    
    
    [self.view addSubview:cardView];
    
}



@end
