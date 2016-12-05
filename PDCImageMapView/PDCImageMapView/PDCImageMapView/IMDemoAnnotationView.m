//
//  IMDemoAnnotationView.m
//  VRRoom
//
//  Created by PortgasDKlaus on 16/9/1.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "IMDemoAnnotationView.h"

@interface IMDemoAnnotationView ()

@end

@implementation IMDemoAnnotationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _arrawHeight = 4;
        [self addSubview:self.imageV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.button];
    }
    return self;
}


#pragma mark - private

- (UIImageView *)imageV{
    float height = self.frame.size.height - _arrawHeight - 38;
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(18, 18, height, height)];
        _imageV.image = [UIImage imageNamed:@"leftImage"];
    }
    return _imageV;
}

- (UILabel *)titleLabel{
    float height = self.frame.size.height - _arrawHeight - 38;
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(height + 18, 18, self.frame.size.width - height * 2 - 34, height)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkGrayColor];
    }
    return _titleLabel;
}

- (UIButton *)button{
    float height = self.frame.size.height - _arrawHeight - 38;
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - height - 18, 18, height, height)];
        [_button setBackgroundImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

#pragma mark - Action

- (void)buttonClick:(UIButton *)sender{
    if (_demoDelegate && [_demoDelegate respondsToSelector:@selector(IMDemoAnnotationView:selectedAnnotation:)]) {
        [_demoDelegate IMDemoAnnotationView:self selectedAnnotation:self.annotation];
    }
}

@end
