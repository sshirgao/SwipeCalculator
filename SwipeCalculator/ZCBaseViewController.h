//
//  ZCBaseViewController.h
//  ZapposCalculator
//
//  Created by Soham Shirgaonkar on 2/12/16.
//  Copyright © 2016 soham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseViewController : UIViewController

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


@property int screenwidth;
@property int screenheight;


-(void)placeview:(UIView *)view1 belowview:(UIView *)view2 withoffset:(int)offset;
-(void)placeview:(UIView *)view1 aboveview:(UIView *)view2 withoffset:(int)offset;
-(void)placeview:(UIView *)view1 toRightofView:(UIView *)view2 withoffset:(int)offset;
-(void)placeview:(UIView *)view1 toleftofView:(UIView *)view2 withoffset:(int)offset;
-(void)resizeimageinimageview:(UIImageView *)imgv andcenteritwithwidthoffset:(int)offset;
-(void)resizebutton:(UIButton *)b andcenteritwithwidthoffset:(int)offset;
-(void)center_view:(UIView *)v;
-(void)center_view_vertically:(UIView *)v;


@end
