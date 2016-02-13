//
//  ZCBaseViewController.m
//  ZapposCalculator
//
//  Created by Soham Shirgaonkar on 2/12/16.
//  Copyright © 2016 soham. All rights reserved.
//

#import "ZCBaseViewController.h"

@interface ZCBaseViewController ()

@end

@implementation ZCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.screenwidth = [UIScreen mainScreen].bounds.size.width;
    self.screenheight = [UIScreen mainScreen].bounds.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)placeview:(UIView *)view1 belowview:(UIView *)view2 withoffset:(int)offset
{
    CGRect temp = view1.frame;
    temp.origin.y = view2.frame.origin.y + view2.frame.size.height+ offset;
    view1.frame = temp;
}

-(void)placeview:(UIView *)view1 aboveview:(UIView *)view2 withoffset:(int)offset
{
    CGRect temp = view1.frame;
    temp.origin.y = view2.frame.origin.y - view2.frame.size.height-offset;
    view1.frame = temp;
}

-(void)placeview:(UIView *)view1 toRightofView:(UIView *)view2 withoffset:(int)offset
{
    CGRect temp = view1.frame;
    temp.origin.x = view2.frame.origin.x + view2.frame.size.width+offset;
    temp.origin.y = view2.frame.origin.y;
    view1.frame = temp;
}


-(void)center_view:(UIView *)v
{
    CGRect temp = v.frame;
    temp.origin.x = (self.screenwidth - temp.size.width)/2;
    v.frame = temp;
}

-(void)center_view_vertically:(UIView *)v
{
    CGRect temp = v.frame;
    temp.origin.y = (self.screenheight - temp.size.height)/2;
    v.frame = temp;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
