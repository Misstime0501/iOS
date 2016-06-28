//
//  ViewController.m
//  AutoLayout
//
//  Created by LiChen on 6/23/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRedView];
    [self createBlueView];
    [self createYellowView];
    [self yellowViewReadPaint];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createRedView
{
    
    UIView  *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    _redView = redView;
    
    NSLog(@"绘制红色 View");
    
    //创建redView第一个约束，相对self.view的左边缘间距20
    NSLayoutConstraint * redLeftLc = [NSLayoutConstraint constraintWithItem:redView
                                                                  attribute:NSLayoutAttributeLeftMargin
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1.0f
                                                                   constant:20.0];
    //只有在没有参照控件的情况下，约束才加到自身，不然加到父控件上
    [self.view addConstraint:redLeftLc];
    
    //创建redView第二个约束，相对self。view的底边缘间距20
    NSLayoutConstraint *redBottomLc = [NSLayoutConstraint constraintWithItem:redView
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBottomMargin
                                                                  multiplier:1.0f
                                                                    constant:-20];//由于是redview相对self.view往上减20，所以是-20
    //添加约束
    [self.view addConstraint:redBottomLc];
    
    //创建redView第三个约束，设置自身宽，宽可以参照其他控件设置，比如是self.view宽的一半,则应该这样写
    /*
     [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0.0];
     */
    //这里直接设置自身宽为50
    NSLayoutConstraint * redWLc = [NSLayoutConstraint constraintWithItem:redView
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:kNilOptions
                                                              multiplier:1.0f
                                                                constant:50.0f];
    //由于没有参照物，所以约束添加于自身身上
    [redView addConstraint:redWLc];
    
    //创建最后一个约束，自身的高
    NSLayoutConstraint * redHLc = [NSLayoutConstraint constraintWithItem:redView
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:kNilOptions
                                                              multiplier:1.0f
                                                                constant:50];
    //由于没有参照物，所以约束添加于自身身上
    [redView addConstraint:redHLc];
    
    //这时请大家想一下，我只需要设置redView与self.view的位置关系，再确定自己的宽高，不就就完成了位置与尺寸这两个必须条件了么？
}

- (void)createBlueView
{
    //先创建一个一个蓝色的view添加到视图上，剩下的就是用autolayout来设置它的“frame”了
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    
    _blueView = blueView;
    //创建第一个约束，左边间距，由于是想要与红色有20的间距，那么参照参数“toItem”就应该填redView
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_redView
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0f
                                                                 constant:20.0f];
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:blueLeft];
    //现在我们已经可以确定自己水平方向的位置了，还差垂直方向的位置，现在我们来创建第二个约束，参照物依然是红色方块，需求是要离self.view底部20间距，这不是正好和红色一样么，那么我们可以直接与红色方块底部对齐就行了
    NSLayoutConstraint *blueBottom = [NSLayoutConstraint constraintWithItem:blueView
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_redView
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0f
                                                                   constant:0.0f];//与红色方块底部对齐，倍数1.0f.差值0.0f
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:blueBottom];
    //剩下两个约束差不多，我就一并描述了，它们都以redView为参照，与其等宽等高
    NSLayoutConstraint *blueW = [NSLayoutConstraint constraintWithItem:blueView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_redView
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0f
                                                              constant:0.0f];
    [self.view addConstraint:blueW];
    
    NSLayoutConstraint *blueH = [NSLayoutConstraint constraintWithItem:blueView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:_redView
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0f
                                                              constant:0.0f];
    [self.view addConstraint:blueH];
}

- (void)createYellowView
{
    //一如往常，先创建黄色View
    UIView *yellowV = [[UIView alloc]init];
    yellowV.backgroundColor = [UIColor yellowColor];
    yellowV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:yellowV];
    
    _yellowView = yellowV;
    
    //开始创建约束，第一个约束是什么呢？一看就知道是左间距约束啦
    NSLayoutConstraint *yellowLeft = [NSLayoutConstraint constraintWithItem:yellowV
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_blueView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0f
                                                                   constant:20];
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:yellowLeft];
    
    //添加底部约束
    NSLayoutConstraint *yellowBottom = [NSLayoutConstraint constraintWithItem:yellowV
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0f
                                                                     constant:-20];
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:yellowBottom];
    
    //这里我直接设置宽高约束了，就省事不加参照控件了
    NSLayoutConstraint *yellowW = [NSLayoutConstraint constraintWithItem:yellowV
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:kNilOptions
                                                              multiplier:1.0f
                                                                constant:50.0f];
    [yellowV addConstraint:yellowW];
    
    NSLayoutConstraint *yellowH = [NSLayoutConstraint constraintWithItem:yellowV
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:kNilOptions
                                                              multiplier:1.0f
                                                                constant:50.0f];
    [yellowV addConstraint:yellowH];
}



- (void)yellowViewReadPaint
{
    //对黄色View添加约束，约束黄色view与红色View的间距为20
    NSLayoutConstraint *yellowAnotherLeft = [NSLayoutConstraint constraintWithItem:_yellowView
                                                                         attribute:NSLayoutAttributeLeft
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:_redView
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1.0f
                                                                          constant:20];
    UILayoutPriority priority = 250; //设置优先级
    yellowAnotherLeft.priority = priority;
    //与其他控件发生约束，所以约束添加到父控件上
    [self.view addConstraint:yellowAnotherLeft];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_blueView removeFromSuperview];
    [UIView animateWithDuration:1.0f animations:^{
        [self.view layoutIfNeeded];
    }];
}




@end
