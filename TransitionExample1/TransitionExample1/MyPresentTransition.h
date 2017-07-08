//
//  MyPresentTransition.h
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyView.h"

@import Foundation;
@import UIKit;

@interface MyPresentTransition : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, copy) NSArray<MyView *> *views;

@end
