//
//  MyPresentTransition.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyPresentTransition.h"
#import "MyTableViewController.h"

@implementation MyPresentTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *contrainer = transitionContext.containerView;
    contrainer.backgroundColor = [UIColor whiteColor];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MyTableViewController *toVC = (MyTableViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    fromVC.view.hidden = YES;
    toVC.view.hidden = YES;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.headerView.image];
    imageView.frame = [self.headerView convertRect:self.headerView.bounds toView:contrainer];
    [contrainer addSubview:imageView];
    [contrainer addSubview:toVC.view];
    
    NSMutableArray<UIImageView *> *imageViews = [NSMutableArray arrayWithCapacity:self.views.count];
    
    [self.views enumerateObjectsUsingBlock:^(MyView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:view.getImage];
        imageView.frame = [view convertRect:view.bounds toView:contrainer];
        [contrainer insertSubview:imageView atIndex:idx];
        [imageViews addObject:imageView];
    }];
    
    [UIView animateWithDuration:1.0f
                     animations:^{
                         CGRect headerFrame = CGRectMake(0.0f, 0.0f, toVC.tableView.frame.size.width, toVC.tableView.frame.size.width * 0.75);
                         imageView.frame = [contrainer convertRect:headerFrame fromView:toVC.view];
                         
                         [imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imageView, NSUInteger idx, BOOL * _Nonnull stop) {
                             NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                             UITableViewCell *cell = [toVC.tableView cellForRowAtIndexPath:indexPath];
                             imageView.frame = [cell.imageView convertRect:cell.imageView.bounds toView:contrainer];
                         }];
                     }
                     completion:^(BOOL finished) {
                         fromVC.view.hidden = NO;
                         toVC.view.hidden = NO;
                         [imageView removeFromSuperview];
                         [imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull imageView, NSUInteger idx, BOOL * _Nonnull stop) {
                             [imageView removeFromSuperview];
                         }];
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source {
    return self;
}


//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
//    return self;
//}

@end
