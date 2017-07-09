//
//  MyCollectionViewController.m
//  TransitionExample1
//
//  Created by seirra on 08/07/2017.
//  Copyright © 2017 s2mh. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyTableViewController.h"
#import "MyPresentTransition.h"
#import "MyCollectionViewCell.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    [self.collectionView registerClass:[MyCollectionViewCell class]
            forCellWithReuseIdentifier:@"MyCollectionViewCell"];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"sa%ld.jpg", (long)indexPath.item]]];
    
//    NSUInteger row = indexPath.row;
//    cell.view1.backgroundColor = [UIColor colorWithHue:((indexPath.item * 4) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0];
//    cell.view2.backgroundColor = ((row % 4) > 0) ? [UIColor colorWithHue:((indexPath.item * 4 + 1) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0] : [UIColor clearColor];
//    cell.view3.backgroundColor = ((row % 4) > 1) ? [UIColor colorWithHue:((indexPath.item * 4 + 2) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0] : [UIColor clearColor];
//    cell.view4.backgroundColor = ((row % 4) > 2) ? [UIColor colorWithHue:((indexPath.item * 4 + 3) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0] : [UIColor clearColor];
    cell.view1.backgroundColor = [UIColor colorWithHue:((indexPath.item * 4)     / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0];
    cell.view2.backgroundColor = [UIColor colorWithHue:((indexPath.item * 4 + 1) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0];
    cell.view3.backgroundColor = [UIColor colorWithHue:((indexPath.item * 4 + 2) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0];
    cell.view4.backgroundColor = [UIColor colorWithHue:((indexPath.item * 4 + 3) / 16.0f) saturation:1.0 brightness:1.0 alpha:1.0];
    return cell;
}

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIImage *header = cell.imageView.image;
    NSArray<UIImage *> *images = @[cell.view1.getImage,
                                   cell.view2.getImage,
                                   cell.view3.getImage,
                                   cell.view4.getImage,
                                   cell.view1.getImage,
                                   cell.view2.getImage,
                                   cell.view3.getImage,
                                   cell.view4.getImage,
                                   cell.view1.getImage,
                                   cell.view2.getImage,
                                   cell.view3.getImage,
                                   cell.view4.getImage];
    
    MyTableViewController *vc = [[MyTableViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.header = header;
    vc.images = images;
    vc.fakeRandonFactor = indexPath.row;
    
    MyPresentTransition *transition = [MyPresentTransition new];
    transition.headerView = cell.imageView;
    transition.views = @[cell.view1,
                         cell.view2,
                         cell.view3,
                         cell.view4];
    
    vc.transitioningDelegate = transition;
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
