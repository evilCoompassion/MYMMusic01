//
//  SelectViewController.m
//  MYMMusic01
//
//  Created by apple on 16/1/17.
//  Copyright © 2016年 EvilCompassion. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()<UIScrollViewDelegate>
@property UIPageControl *pc;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBigScrollViewControll];
    [self setPageControll];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
}

- (void) setBigScrollViewControll
{
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    sv.contentSize = CGSizeMake(sv.frame.size.width*2, sv.frame.size.height);
    sv.delegate = self;

    UIScrollView *svs = [[UIScrollView alloc]initWithFrame:CGRectMake(5,5, sv.frame.size.width-10, 140)];
    svs.contentSize = CGSizeMake(sv.frame.size.width*5, 140);
    
    for (NSInteger j = 0; j < 5; j++) {
        UIImageView *siv = [[UIImageView alloc]init];
        siv.frame = CGRectMake(svs.frame.size.width * j, 0, svs.frame.size.width, svs.frame.size.height);
        siv.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad0%ld",j+1]];
        [svs addSubview:siv];
    }
    svs.pagingEnabled = YES;
    svs.showsHorizontalScrollIndicator = NO;

    UIImageView *iv1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 150,154,142)];
    iv1.image = [UIImage imageNamed:@"channel01"];
    UIImageView *iv2 = [[UIImageView alloc]initWithFrame:CGRectMake(165, 150, 154, 142)];
    iv2.image = [UIImage imageNamed:@"channel02"];
    UIImageView *iv3 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 300,154,142)];
    iv3.image = [UIImage imageNamed:@"channel03"];
    UIImageView *iv4 = [[UIImageView alloc]initWithFrame:CGRectMake(165, 300, 154, 142)];
    iv4.image = [UIImage imageNamed:@"channel04"];
    UIImageView *iv5 = [[UIImageView alloc]initWithFrame:CGRectMake(325, 5, 154, 142)];
    iv5.image = [UIImage imageNamed:@"channel05"];
    UIImageView *iv6 = [[UIImageView alloc]initWithFrame:CGRectMake(165+325, 5, 154, 142)];
    iv6.image = [UIImage imageNamed:@"channel06"];
    UIImageView *iv7 = [[UIImageView alloc]initWithFrame:CGRectMake(325, 152, 154, 142)];
    iv7.image = [UIImage imageNamed:@"channel07"];
    UIImageView *iv8 = [[UIImageView alloc]initWithFrame:CGRectMake(325+165, 152, 154, 142)];
    iv8.image = [UIImage imageNamed:@"channel08"];
    UIImageView *iv9 = [[UIImageView alloc]initWithFrame:CGRectMake(325, 303, 154, 142)];
    iv9.image = [UIImage imageNamed:@"channel09"];
    
    sv.pagingEnabled =YES;
    sv.showsHorizontalScrollIndicator = NO;
    sv.bounces = NO;
    [sv addSubview:iv1];
    [sv addSubview:iv2];
    [sv addSubview:iv3];
    [sv addSubview:iv4];
    [sv addSubview:iv5];
    [sv addSubview:iv6];
    [sv addSubview:iv7];
    [sv addSubview:iv8];
    [sv addSubview:iv9];
    [sv addSubview:svs];
    [self.view addSubview:sv];
}


- (void) setPageControll
{
    UIPageControl *pc = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 125, self.view.frame.size.width, 10)];
    self.pc = pc;
    [self.view addSubview:pc];
    self.pc.numberOfPages = 2;
    pc.pageIndicatorTintColor = [UIColor lightGrayColor];
    pc.currentPageIndicatorTintColor = [UIColor blackColor];
    pc.userInteractionEnabled = NO;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    self.pc.currentPage = round(point.x/scrollView.frame.size.width);
}
@end
