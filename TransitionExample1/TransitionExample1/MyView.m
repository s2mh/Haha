//
//  MyView.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyView.h"

@implementation MyView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        
        CAShapeLayer *layer = (id)self.layer;
        layer.contentsScale = [UIScreen mainScreen].scale;
        layer.rasterizationScale = [UIScreen mainScreen].scale;
        layer.shouldRasterize = YES;
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    CAShapeLayer *layer = (id)self.layer;
    layer.fillColor = backgroundColor.CGColor;
}

- (void)layoutSubviews {
    CAShapeLayer *layer = (id)self.layer;
    layer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}

- (UIImage *)getImage {
    UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, NO, 0);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end
