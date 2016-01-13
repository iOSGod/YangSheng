//
//  YSSecondViewController.m
//  YSPhoto
//
//  Created by 千锋 on 15/11/26.
//  Copyright (c) 2015年 YS. All rights reserved.
//

#import "YSSecondViewController.h"

@interface YSSecondViewController ()

@property(strong,nonatomic)UIScrollView *scrollView;

@end

@implementation YSSecondViewController

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
    //    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_scrollView];
    for(;_flag<13;_flag++)
    {
        NSString *name=[ NSString  stringWithFormat:@"a%d.jpg",_flag];
        UIImage  *image=[UIImage imageNamed:name];
        UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
        imageView.frame=CGRectMake(320*_flag, 0, 320, 480);
        [_scrollView addSubview:imageView];
    }
    _scrollView.pagingEnabled=YES;
    _scrollView.contentSize=CGSizeMake(320*_flag, 480);
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if(_scrollView.contentOffset.x/320==12)
    {
        _scrollView.contentOffset=CGPointMake(320*_flag, 480);
    }
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
