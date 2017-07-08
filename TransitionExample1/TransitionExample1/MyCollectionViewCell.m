//
//  MyCollectionViewCell.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat imageWidth = frame.size.width;
        CGFloat imageHeight = imageWidth * 0.75;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, imageWidth, imageHeight)];
        
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.imageView];
        
        CGFloat viewHeight = (frame.size.height - imageHeight) * 0.6f;
        CGFloat viewWidth = viewHeight;
        CGFloat x = frame.size.width * 0.07f;
        CGFloat y = imageHeight + (frame.size.height - imageHeight) * 0.2f;
        CGFloat xDistance = 0.8;
        
        _view1 = [[MyView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
        [self.contentView addSubview:self.view1];
        x += viewWidth * xDistance;
        
        _view2 = [[MyView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
        [self.contentView insertSubview:self.view2 belowSubview:self.view1];
        x += viewWidth * xDistance;
        
        _view3 = [[MyView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
        [self.contentView insertSubview:self.view3 belowSubview:self.view2];
        x += viewWidth * xDistance;
        
        _view4 = [[MyView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
        [self.contentView insertSubview:self.view4 belowSubview:self.view3];
    }
    return self;
}

@end
