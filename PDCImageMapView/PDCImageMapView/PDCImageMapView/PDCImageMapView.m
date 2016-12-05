//
//  PDCImageMapView.m
//  VRRoom
//
//  Created by PortgasDKlaus on 16/8/31.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "PDCImageMapView.h"

@interface PDCImageMapView ()<PDCImageMapAnnotationDLGT,PDCImageMapAnnotationViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation PDCImageMapView

- (void)awakeFromNib{
    [super awakeFromNib];
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGRect frame = self.frame;
    frame.size = CGSizeMake(size.width, size.height - 64);
    self.frame = frame;
    
    [self addSubview:self.mapBgView];
}

- (void)setBgSize:(CGSize)bgSize{
    _bgSize = bgSize;
    _mapBgView.bgSize = bgSize;
}

- (void)moveToX:(CGFloat)x ToY:(CGFloat)y{
    
}

- (void)setImage:(UIImage *)_image{
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _annotations = [[NSMutableArray alloc] init];
        [self addSubview:self.mapBgView];
    }
    return self;
}

- (PDCStaticHImageView *)mapBgView{
    if (!_mapBgView) {
        _mapBgView = [[PDCStaticHImageView alloc] initWithFrame:self.frame];
    }
    return _mapBgView;
}

- (void)addAnnotation:(PDCImageMapAnnotation *)annotation{
    annotation.delegate = self;
    if (_delegate && [_delegate respondsToSelector:@selector(PDCImageMapView:viewForAnnotation:)]) {
        PDCImageMapAnnotationView *cell = [_delegate PDCImageMapView:self viewForAnnotation:
                                           annotation];
        cell.delegate = self;
        cell.bgSize = self.bgSize;
        cell.imageSize = self.mapBgView.imageView.frame.size;
        cell.annotation = annotation;
        
        [_mapBgView.imageView addSubview:cell];
    }
}

- (void)addAnnotations:(NSMutableArray *)annotations{
    for (int i = 0; i < annotations.count; i ++) {
        PDCImageMapAnnotation *annotation = [[PDCImageMapAnnotation alloc] init];
        annotation = [annotations objectAtIndex:i];
        [self addAnnotation:annotation];
    }
}

- (void)removeAllAnnotations{
    for (UIView *view in self.mapBgView.imageView.subviews) {
        if ([view isKindOfClass:[PDCImageMapAnnotationView class]]) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - 标注点击事件
- (void)PDCImageMapAnnotationView:(PDCImageMapAnnotationView *)annotationView didSelected:(PDCImageMapAnnotation *)annotation{
    if (_delegate && [_delegate respondsToSelector:@selector(PDCImageMapAnnotationView:didSelected:)]) {
        [_delegate PDCImageMapAnnotationView:annotationView didSelected:annotation];
    }
}

#pragma mark - 坐标转换

- (float)turnX:(float)theX{
    float x;
    return x;
}

#pragma mark - 移动缩放

-(void)handleTapGesture:(UIGestureRecognizer*)sender
{
    if(_scrollView.zoomScale > 1.0){
        [_scrollView setZoomScale:1.0 animated:YES];
    }else{
        [_scrollView setZoomScale:2.0 animated:YES];
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return _mapBgView;
}

@end
