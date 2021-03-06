//
//  XPYPopAnimation.m
//  XPYToolsAndCategories
//
//  Created by zhangdu_imac on 2019/10/12.
//  Copyright © 2019 xpy. All rights reserved.
//

#import "XPYPopAnimation.h"

@implementation XPYPopAnimation
//动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = nil;
    UIView *toView = nil;
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {    //iOS8
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromController.view;
        toView = toController.view;
    }
    
    toView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [transitionContext.containerView insertSubview:toView belowSubview:fromView];
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    //CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
    //fromView.frame = CGRectMake(0, 0, width, height);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //fromView.frame = CGRectMake(width, 0, width, height);
        toView.transform = CGAffineTransformIdentity;
        fromView.transform = CGAffineTransformMakeTranslation(width, 0);
    } completion:^(BOOL finished) {
        toView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
