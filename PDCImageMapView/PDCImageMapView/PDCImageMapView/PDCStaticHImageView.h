//
//  StaticHeightImageView.h
//  720Test
//
//  Created by PortgasDKlaus on 2016/11/15.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDCStaticHImageView : UIView

@property (nonatomic, assign) CGRect cropFrame;
@property (nonatomic) CGSize bgSize;
@property (nonatomic, strong) UIImageView* imageView;

- (void)resetImageViewFrame;

- (void)setBGImage:(UIImage *)image;

@end
