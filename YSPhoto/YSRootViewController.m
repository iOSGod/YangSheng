//
//  YSRootViewController.m
//  YSPhoto
//
//  Created by 千锋 on 15/11/26.
//  Copyright (c) 2015年 YS. All rights reserved.
//

#import "YSRootViewController.h"
#import "YSSecondViewController.h"
@interface YSRootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>



@end

@implementation YSRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatCollectionView];
}
-(void)creatCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(150, 150);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collection=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collection.tag=222;
    collection.delegate=self;
    collection.dataSource=self;
    [self.view addSubview:collection];
    [collection registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.tag=indexPath.row+100;
    button.frame=CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"a%d.jpg",indexPath.row]] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:button];
    return cell;
}

-(void)pressButton:(UIButton *)button
{
    UICollectionView *collection=(UICollectionView *)[self.view viewWithTag:222];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"a%d.jpg",button.tag-100]]];
     [self.view addSubview:imageView];
    imageView.frame=CGRectMake(button.frame.origin.x, button.frame.origin.y, 100, 100);
    imageView.center=self.view.center;
    CGRect rect=imageView.frame;
    rect.origin.x=0;
    rect.origin.y=0;
    rect.size.height=480;
    rect.size.width=320;
    [UIView animateWithDuration:2 animations:^{
        imageView.frame=rect;
        collection.alpha=0;
    } completion:^(BOOL finished) {
        YSSecondViewController *second=[[YSSecondViewController alloc]init];
        second.flag=button.tag-100;
        [self presentViewController:second animated:NO completion:^{
            
        }];
    }];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
