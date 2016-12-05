//
//  PDCPaopaoView.h
//  VRRoom
//
//  Created by PortgasDKlaus on 2016/12/2.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//


/*
 自定义替换切图即可用
 4个阴影线      a1/a2/a3/a4
 4个角         c1/c2/c3/c4
 4个箭头       e1/e2/e3/e4
 1个底色       mid(一个颜色点)
 
 4个箭头可以缩减为1个，但是违背了我换图即用的初衷，所以就这样.
 
 箭头的切图，阴影alpha：50%，V型阴影边界模糊渐变
 
 让切图的去搞，你替换图片就行了
 */

#import <UIKit/UIKit.h>

@interface PDCPaopaoView : UIView

- (instancetype)initWithView:(UIView *)view;

@end
