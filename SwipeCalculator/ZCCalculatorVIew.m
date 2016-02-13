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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Trials");
    
    //Bottom row
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    



    
    
    
//    [[self view] addSubview:invisible_view];

    

    
    
    
    

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
    if (self.num_label.textColor != [UIColor purpleColor])
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
    
    self.num_label.textColor = [UIColor purpleColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)create_button_for_number:(NSString *)number
{
    UIButton *v = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.screenwidth/3, self.screenwidth/3)];
    v.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
}

-(IBAction)numpad_pressed:(id)sender
{
    if (self.num_label.textColor == [UIColor purpleColor])
    {
        self.num_label.text=@"";
        self.num_label.textColor = [UIColor darkGrayColor];
    }
    UIButton *b = (UIButton *)sender;
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
