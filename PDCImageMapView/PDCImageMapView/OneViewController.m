//
//  OneViewController.m
//  PDCImageMapView
//
//  Created by PortgasDKlaus on 2016/12/2.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "OneViewController.h"
#import "PDCPaopaoView.h"

/*
 这是个可拉伸气泡的示例
 */

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UILabel *labelOne = [self createLabel:CGRectMake(0, 0, 100, 40)];
    labelOne.text = @"呵呵";
    PDCPaopaoView *paopaoOne = [[PDCPaopaoView alloc] initWithView:labelOne];
    paopaoOne.frame = CGRectMake(40, 140, labelOne.frame.size.width, labelOne.frame.size.height);
    [self.view addSubview:paopaoOne];
    
    UILabel *labelTwo = [self createLabel:CGRectMake(0, 0, 120, 80)];
    labelTwo.text = @"写代码真是无趣";
    PDCPaopaoView *paopaoTwo = [[PDCPaopaoView alloc] initWithView:labelTwo];
    paopaoTwo.frame = CGRectMake(40, 240, labelTwo.frame.size.width, labelTwo.frame.size.height);
    [self.view addSubview:paopaoTwo];
    
    
}

- (UILabel *)createLabel:(CGRect)frame{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
