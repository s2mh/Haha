//
//  MyCollectionViewCell.h
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyView.h"
@import UIKit;

@interface MyCollectionViewCell : UICollectionViewCell

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) MyView *view1;
@property (nonatomic, readonly) MyView *view2;
@property (nonatomic, readonly) MyView *view3;
@property (nonatomic, readonly) MyView *view4;

@end
