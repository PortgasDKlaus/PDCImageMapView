//
//  PDCPaopaoView.m
//  VRRoom
//
//  Created by PortgasDKlaus on 2016/12/2.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "PDCPaopaoView.h"

@interface PDCPaopaoView ()

@property (nonatomic, strong) UIImageView *midView;
@property (nonatomic, strong) UIImageView *c1;
@property (nonatomic, strong) UIImageView *c2;
@property (nonatomic, strong) UIImageView *c3;
@property (nonatomic, strong) UIImageView *c4;
@property (nonatomic, strong) UIImageView *a1;
@property (nonatomic, strong) UIImageView *a2;
@property (nonatomic, strong) UIImageView *a3;
@property (nonatomic, strong) UIImageView *a4;
@property (nonatomic, strong) UIImageView *e1;
@property (nonatomic, strong) UIImageView *e2;
@property (nonatomic, strong) UIImageView *e3;
@property (nonatomic, strong) UIImageView *e4;

@end

@implementation PDCPaopaoView

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithFrame:[self resetSize:view.frame]];
    if (self) {
        [self addSubview:self.midView];
        [self.midView addSubview:view];
        [self addSubview:self.c1];
        [self addSubview:self.c2];
        [self addSubview:self.c3];
        [self addSubview:self.c4];
        [self addSubview:self.a1];
        [self addSubview:self.a2];
        [self addSubview:self.a3];
        [self addSubview:self.a4];
        [self addSubview:self.e1];
        [self addSubview:self.e2];
        [self addSubview:self.e3];
        [self addSubview:self.e4];
        
        [self resetSubViews:view.frame.size];
    }
    return self;
}

- (void)resetSubViews:(CGSize)size{
    
    self.c1.frame = CGRectMake(0, 0, _c1.frame.size.width, _c1.frame.size.height);
    self.midView.frame = CGRectMake(_c1.frame.size.width, _c1.frame.size.height, size.width, size.height);
    self.c2.frame = CGRectMake(_c1.frame.size.width + size.width , 0, self.c2.frame.size.width, self.c2.frame.size.height);
    self.c3.frame = CGRectMake(0, _c1.frame.size.height + size.height, self.c3.frame.size.width, self.c3.frame.size.height);
    self.c4.frame = CGRectMake(_c1.frame.size.width + size.width, _c1.frame.size.height + size.height, self.c4.frame.size.width, self.c4.frame.size.height);
    self.a1.frame = CGRectMake(_c1.frame.size.width, 0, size.width, self.a1.frame.size.height);
    self.a2.frame = CGRectMake(0, _c1.frame.size.height, self.a2.frame.size.width, size.height);
    self.a3.frame = CGRectMake(_c1.frame.size.width + size.width, _c1.frame.size.height, self.a3.frame.size.width, size.height);
    self.a4.frame = CGRectMake(_c1.frame.size.width, _c1.frame.size.height + size.height, size.width, self.a4.frame.size.height);
    self.e1.frame = CGRectMake(_c1.frame.size.width + size.width/2 - self.e1.frame.size.width/2, 0, self.e1.frame.size.width, self.e1.frame.size.height);
    self.e2.frame = CGRectMake(0, _c1.frame.size.height + size.height/2 - self.e2.frame.size.height/2, self.e2.frame.size.width, self.e2.frame.size.height);
    self.e3.frame = CGRectMake(_c1.frame.size.width + size.width, _c1.frame.size.height + size.height/2 - self.e3.frame.size.height/2, self.e3.frame.size.width, self.e3.frame.size.height);
    self.e4.frame = CGRectMake(_c1.frame.size.width + size.width/2 - self.e4.frame.size.width/2, _c1.frame.size.height + size.height, self.e4.frame.size.width, self.e4.frame.size.height);
}

- (CGRect)resetSize:(CGRect)frame{
    CGRect nf;
    
    UIImage *image1 = [UIImage imageNamed:@"c1"];
    UIImage *image2 = [UIImage imageNamed:@"c2"];
    UIImage *image3 = [UIImage imageNamed:@"c3"];
    
    nf = CGRectMake(0,0,image1.size.width + frame.size.width + image2.size.width, image1.size.height + frame.size.height + image3.size.height);
    
    return nf;
}

- (UIImageView *)midView{
    if (!_midView) {
        UIImage *image = [UIImage imageNamed:@"mid"];
        _midView = [[UIImageView alloc] initWithFrame:CGRectMake(_c1.frame.size.width, _c1.frame.size.height, 0, 0)];
        _midView.userInteractionEnabled = YES;
        _midView.image = image;
    }
    return _midView;
}

- (UIImageView *)c1{
    if (!_c1) {
        UIImage *image = [UIImage imageNamed:@"c1"];
        _c1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _c1.image = image;
    }
    return _c1;
}

- (UIImageView *)c2{
    if (!_c2) {
        UIImage *image = [UIImage imageNamed:@"c2"];
        _c2 = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0, image.size.width, image.size.height)];
        _c2.image = image;
    }
    return _c2;
}

- (UIImageView *)c3{
    if (!_c3) {
        UIImage *image = [UIImage imageNamed:@"c3"];
        _c3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _c3.image = image;
    }
    return _c3;
}

- (UIImageView *)c4{
    if (!_c4) {
        UIImage *image = [UIImage imageNamed:@"c4"];
        _c4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _c4.image = image;
    }
    return _c4;
}

- (UIImageView *)a1{
    if (!_a1) {
        UIImage *image = [UIImage imageNamed:@"a1"];
        _a1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _a1.image = image;
    }
    return _a1;
}

- (UIImageView *)a2{
    if (!_a2) {
        UIImage *image = [UIImage imageNamed:@"a2"];
        _a2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _a2.image = image;
    }
    return _a2;
}

- (UIImageView *)a3{
    if (!_a3) {
        UIImage *image = [UIImage imageNamed:@"a3"];
        _a3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _a3.image = image;
    }
    return _a3;
}

- (UIImageView *)a4{
    if (!_a4) {
        UIImage *image = [UIImage imageNamed:@"a4"];
        _a4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _a4.image = image;
    }
    return _a4;
}

- (UIImageView *)e1{
    if (!_e1) {
        UIImage *image = [UIImage imageNamed:@"e1"];
        _e1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _e1.image = image;
    }
    return _e1;
}

- (UIImageView *)e2{
    if (!_e2) {
        UIImage *image = [UIImage imageNamed:@"e2"];
        _e2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _e2.image = image;
    }
    return _e2;
}

- (UIImageView *)e3{
    if (!_e3) {
        UIImage *image = [UIImage imageNamed:@"e3"];
        _e3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _e3.image = image;
    }
    return _e3;
}

- (UIImageView *)e4{
    if (!_e4) {
        UIImage *image = [UIImage imageNamed:@"e4"];
        _e4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _e4.image = image;
    }
    return _e4;
}


@end
