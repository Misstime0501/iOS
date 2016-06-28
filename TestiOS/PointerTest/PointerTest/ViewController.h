//
//  ViewController.h
//  PointerTest
//
//  Created by LiChen on 6/5/16.
//  Copyright © 2016 LiChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestSession.h"


@interface ViewController : UIViewController

- (IBAction)setInfo:(id)sender;
- (IBAction)getInfo:(id)sender;

@property (nonatomic, retain) TestSession *currentSession;
@property (nonatomic, retain) TestSession *staticSession;

@end

