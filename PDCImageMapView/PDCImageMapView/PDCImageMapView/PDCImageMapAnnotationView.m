//
//  PDCImageMapAnnotationView.m
//  VRRoom
//
//  Created by PortgasDKlaus on 16/8/31.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "PDCImageMapAnnotationView.h"

@interface PDCImageMapAnnotationView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic) float equre;
@property (nonatomic) float equreX;
@property (nonatomic) float equreY;

@end

@implementation PDCImageMapAnnotationView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        UITapGestureRecognizer *panRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
        [self addGestureRecognizer:panRecognizer];
        panRecognizer.delegate = self;
    }
    return self;
}

- (void)clickAction:(UITapGestureRecognizer *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(PDCImageMapAnnotationView:didSelected:)]) {
        [_delegate PDCImageMapAnnotationView:self didSelected:_annotation];
    }
}

#pragma mark - public

- (void)setAnnotation:(PDCImageMapAnnotation *)annotation{
    _annotation = annotation;
    
    [self methForQuareWithSize:self.imageSize imageSize:self.bgSize];
    [self reloadSize:self.image];
    [self reloadOriginWithX:annotation.latitude Y:annotation.longitude];
}

- (void)setAnnotation:(PDCImageMapAnnotation *)annotation equreX:(float)equreX equreY:(float)equreY{
    _annotation = annotation;
    _equreX = equreX;
    _equreY = equreY;
    [self reloadSize:self.image];
    [self reloadOriginWithX:annotation.latitude Y:annotation.longitude];
}

- (void)methForQuareWithSize:(CGSize)size imageSize:(CGSize)imageSize{
        float height = size.height;
        float width = imageSize.width * height/imageSize.height;
        _equreX = width / imageSize.width;
        _equreY = height / imageSize.height;
}

#pragma mark - private

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

- (void)reloadSize:(UIImage *)image{
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.imageView.image = image;
    [self reloadOriginWithX:_annotation.latitude Y:_annotation.longitude];
}

- (void)reloadOriginWithX:(float)x Y:(float)y{
    self.frame = CGRectMake(x*_equreX - self.frame.size.width/2, y*_equreY - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}


@end
