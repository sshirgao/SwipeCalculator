//
//  ZCCalculatorVIew.m
//  ZapposCalculator
//
//  Created by Soham Shirgaonkar on 2/12/16.
//  Copyright © 2016 soham. All rights reserved.
//

#import "ZCCalculatorVIew.h"

@interface ZCCalculatorVIew ()



@end

@implementation ZCCalculatorVIew

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define answer_color     [UIColor purpleColor]


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Trials");

    //Bottom row
//    self.view.backgroundColor = UIColorFromRGB(0xE0E0B2);

    UIButton *zero = [self create_button_for_number:@"0"];
    CGRect z_frm = zero.frame;
    z_frm.origin.y = self.screenheight - zero.frame.size.height;
    zero.frame = z_frm;
    
    UIButton *dot = [self create_button_for_number:@"."];
    UIButton *equal = [self create_button_for_number:@"="];
    
    [self placeview:dot toRightofView:zero withoffset:0];
    [self placeview:equal toRightofView:dot withoffset:0];
    
    //First Row
    UIButton *one = [self create_button_for_number:@"1"];
    UIButton *two = [self create_button_for_number:@"2"];
    UIButton *three = [self create_button_for_number:@"3"];
    
    [self placeview:one aboveview:zero withoffset:0];
    [self placeview:two toRightofView:one withoffset:0];
    [self placeview:three toRightofView:two withoffset:0];

    
    //Middle Row
    UIButton *four = [self create_button_for_number:@"4"];
    UIButton *five = [self create_button_for_number:@"5"];
    UIButton *six = [self create_button_for_number:@"6"];
    
    [self placeview:four aboveview:one withoffset:0];
    [self placeview:five toRightofView:four withoffset:0];
    [self placeview:six toRightofView:five withoffset:0];
    
    //Top Row
    UIButton *seven = [self create_button_for_number:@"7"];
    UIButton *eight = [self create_button_for_number:@"8"];
    UIButton *nine = [self create_button_for_number:@"9"];
    
    [self placeview:seven aboveview:four withoffset:0];
    [self placeview:eight toRightofView:seven withoffset:0];
    [self placeview:nine toRightofView:eight withoffset:0];
    
    
    
    UILabel *digit_disp = [[UILabel alloc] initWithFrame:CGRectMake(0, seven.frame.origin.y/2, self.screenwidth-10, seven.frame.origin.y/2)];
    digit_disp.textAlignment = NSTextAlignmentRight;
    self.num_label = digit_disp;
    self.num_label.font = [UIFont systemFontOfSize:30];
    self.num_label.text = @"";
    [[self view] addSubview:digit_disp];

    
    UILabel *transac_disp = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.screenwidth-10, seven.frame.origin.y/2)];
    transac_disp.textAlignment = NSTextAlignmentRight;
    self.transac_label = transac_disp;
        self.transac_label.font = [UIFont systemFontOfSize:30];
    [[self view] addSubview:transac_disp];
    
//    self.view.backgroundColor =  UIColorFromRGB(0xE0E0B2);
//    self.transac_label.backgroundColor = UIColorFromRGB(0xE0E0B2);
//        self.num_label.backgroundColor = UIColorFromRGB(0xE0E0B2);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.num_label.frame.origin.y-20, 40, 40)];
    imgv.contentMode = UIViewContentModeScaleAspectFit;
    [imgv setImage:[UIImage imageNamed:@"ic_info_48pt"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(info_tap)];
    [imgv addGestureRecognizer:tap];
    imgv.userInteractionEnabled = YES;
    [self.view addSubview:imgv];
    
    
}

-(void)info_tap
{
    UIView *v = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    v.backgroundColor = [UIColor blackColor];
    v.alpha = 0.65;
    v.tag = 12345;
    
    UIImageView *uparrow = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.transac_label.frame.origin.y+self.transac_label.frame.size.height, 50,50)];
    [uparrow setImage:[UIImage imageNamed:@"ic_arrow_upward_white_48pt"]];
    [uparrow setContentMode:UIViewContentModeScaleAspectFit];
    UILabel *add = [self get_label_for_text:@"Addition"];
    [self placeview:add belowview:uparrow withoffset:10];
    [self center_view:uparrow];
    [self center_view:add];
    [v addSubview:uparrow];
    [v addSubview:add];
    
    UIImageView *leftarrow = [[UIImageView alloc] initWithFrame:CGRectMake(0,(self.screenheight -  (self.transac_label.frame.origin.y+self.transac_label.frame.size.height))/2,50,50)];
    [leftarrow setImage:[UIImage imageNamed:@"ic_arrow_back_white_48pt"]];
    [leftarrow setContentMode:UIViewContentModeScaleAspectFit];
    UILabel *sub = [self get_label_for_text:@"Division"];
    CGRect temps = sub.frame;
    temps.origin.x = 10;
    sub.frame = temps;
    [self placeview:sub belowview:leftarrow withoffset:10];
    [v addSubview:leftarrow];
    [v addSubview:sub];
    
    
    UIImageView *rightarr = [[UIImageView alloc] initWithFrame:CGRectMake(self.screenwidth-50,(self.screenheight -  (self.transac_label.frame.origin.y+self.transac_label.frame.size.height))/2,50,50)];
    [rightarr setImage:[UIImage imageNamed:@"ic_arrow_forward_white_48pt"]];
    [rightarr setContentMode:UIViewContentModeScaleAspectFit];
    UILabel *mul = [self get_label_for_text:@"Multiplication"];
    CGRect temp = mul.frame;
    temp.origin.x = rightarr.frame.origin.x-rightarr.frame.size.width-10;
    mul.frame = temp;
    [self placeview:mul belowview:rightarr withoffset:10];
    [v addSubview:rightarr];
    [v addSubview:mul];
    
    UIImageView *downarrow = [[UIImageView alloc] initWithFrame:CGRectMake(0,self.screenheight-50,50,50)];
    [downarrow setImage:[UIImage imageNamed:@"ic_arrow_downward_white_48pt"]];
    [downarrow setContentMode:UIViewContentModeScaleAspectFit];
    UILabel *div = [self get_label_for_text:@"Subtraction"];
    [self placeview:div aboveview:downarrow withoffset:10];
    [self center_view:div];
    [self center_view:downarrow];
    [v addSubview:downarrow];
    [v addSubview:div];
    
    
    UIImageView *longpress = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,50,50)];
    [longpress setImage:[UIImage imageNamed:@"ic_touch_app_white_48pt"]];
    [longpress setContentMode:UIViewContentModeScaleAspectFit];
    [self center_view:longpress];
    [self center_view_vertically:longpress];
    UILabel *lp = [self get_label_for_text:@"Long Press"];
    UILabel *clear = [self get_label_for_text:@"Clear"];
    [self placeview:lp belowview:longpress withoffset:10];
    [self placeview:clear belowview:lp withoffset:2];
    [self center_view:lp];
    [self center_view:clear];
    [v addSubview:longpress];
    [v addSubview:lp];
        [v addSubview:clear];
    
    
    
    
    UITapGestureRecognizer *remove_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove_help_view)];
    [v addGestureRecognizer:remove_tap];
    v.userInteractionEnabled = YES;

    [self.view addSubview:v];

    
}

-(UILabel *)get_label_for_text:(NSString *)txt
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectZero];
    lbl.text = txt;
    [lbl sizeToFit];
    lbl.textColor = [UIColor whiteColor];
    return lbl;
}

-(void)remove_help_view
{
    UIView *v = [self.view viewWithTag:12345];
    [v removeFromSuperview];
}

-(void)add
{
    NSLog(@"add");
    [self update_total_and_make_equal];
    self.transac_label.text=@"+";
}

-(void)sub
{
    NSLog(@"sub");
    [self update_total_and_make_equal];
        self.transac_label.text=@"-";
}

-(void)mul
{
    NSLog(@"mul");
    [self update_total_and_make_equal];
        self.transac_label.text=@"x";
}

-(void)div
{
    NSLog(@"div");
    [self update_total_and_make_equal];
    self.transac_label.text=@"/";
}

-(void)update_total_and_make_zero
{
    if ([self.transac_label.text isEqualToString:@"+"])
    {
        self.num1 += [self format_number:self.num_label.text];
    }
    else if ([self.transac_label.text isEqualToString:@"-"])
    {
        self.num1 -= [self format_number:self.num_label.text];
    }
    else if ([self.transac_label.text isEqualToString:@"/"])
    {
        self.num1 = self.num1 / [self format_number:self.num_label.text];
    }
    else if ([self.transac_label.text isEqualToString:@"x"])
    {
        self.num1 = self.num1 * [self format_number:self.num_label.text];
    }
    else
    {
           self.num1 += [self format_number:self.num_label.text];
    }
    
    self.num_label.text = @"";
}

-(void)update_total_and_make_equal
{
    if (self.num_label.textColor != answer_color)
    {
        if ([self.transac_label.text isEqualToString:@"+"])
        {
            self.num1 += [self format_number:self.num_label.text];
        }
        else if ([self.transac_label.text isEqualToString:@"-"])
        {
            self.num1 -= [self format_number:self.num_label.text];
        }
        else if ([self.transac_label.text isEqualToString:@"/"])
        {
            self.num1 = self.num1 / [self format_number:self.num_label.text];
        }
        else if ([self.transac_label.text isEqualToString:@"x"])
        {
            self.num1 = self.num1 * [self format_number:self.num_label.text];
        }
        else
        {
            self.num1 += [self format_number:self.num_label.text];
        }
        if (self.num1 == floorf(self.num1))
        {
            self.num_label.text = [NSString stringWithFormat:@"%d",(int)self.num1];
        }
        else{
            self.num_label.text = [NSString stringWithFormat:@"%.02f",self.num1];
        }
    }
    
    self.num_label.textColor = answer_color;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)create_button_for_number:(NSString *)number
{
    UIButton *v = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.screenwidth/3, self.screenwidth/3)];
//    v.backgroundColor = [UIColor groupTableViewBackgroundColor];
    v.backgroundColor = UIColorFromRGB(0x7FBF7F);

//    v.layer.borderColor=[[UIColor blackColor] CGColor];
//    v.layer.borderWidth=1;
    v.userInteractionEnabled = YES;
    [v setTitle:number forState:UIControlStateNormal];
    [v.titleLabel setFont:[UIFont systemFontOfSize:30]];
    [v setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [v addTarget:self action:@selector(numpad_pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:v];
    
    
    UISwipeGestureRecognizer *add = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(add)];
    add.direction = UISwipeGestureRecognizerDirectionUp;
    [v addGestureRecognizer:add];
    UISwipeGestureRecognizer *sub = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(sub)];
    sub.direction = UISwipeGestureRecognizerDirectionDown;
    [v addGestureRecognizer:sub];
    
    UISwipeGestureRecognizer *mul = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mul)];
    mul.direction = UISwipeGestureRecognizerDirectionRight;
    [v addGestureRecognizer:mul];
    
    UISwipeGestureRecognizer *div = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(div)];
    div.direction = UISwipeGestureRecognizerDirectionLeft;
    [v addGestureRecognizer:div];
    
    UILongPressGestureRecognizer *long_press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(long_press)];
    [v addGestureRecognizer:long_press];

    
    
    
    return v;
}

-(void)long_press
{
    self.num1=0;
    self.num_label.text=@"";
    self.transac_label.text=@"";
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenwidth, self.num_label.frame.origin.y+self.num_label.frame.size.height)];
    v.backgroundColor=[UIColor clearColor];
//    v.layer.cornerRadius = v.frame.size.width/2;
//    v.layer.masksToBounds = YES;
    [[self view] addSubview:v];
    [UIView    animateWithDuration:0.5 animations:^
     {
             v.backgroundColor = UIColorFromRGB(0xFFC966);
         v.backgroundColor=[UIColor clearColor];
     }completion:^(BOOL finished){[v removeFromSuperview];}];
}

-(IBAction)numpad_pressed:(id)sender
{
    if (self.num_label.textColor == answer_color)
    {
        self.num_label.text=@"";
        self.num_label.textColor = [UIColor darkGrayColor];
    }
    UIButton *b = (UIButton *)sender;
    UIView *v = [[UIView alloc] initWithFrame:b.frame];
    v.backgroundColor = UIColorFromRGB(0xE0E0B2);
    v.layer.cornerRadius = v.frame.size.width/2;
    v.layer.masksToBounds = YES;
    [[self view] addSubview:v];
    [UIView    animateWithDuration:0.5 animations:^
    {
        v.backgroundColor=[UIColor clearColor];
    }completion:^(BOOL finished){[v removeFromSuperview];}];


    if (![b.titleLabel.text isEqualToString:@"="])
    {
        self.num_label.text = [NSString stringWithFormat:@"%@%@",self.num_label.text,b.titleLabel.text];
    }
    else{
        [self update_total_and_make_equal];
                self.transac_label.text=@"";
    }
    NSLog(@"%@",self.num_label.text);
}

-(float)format_number:(NSString *)str
{
    return [str floatValue];
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
