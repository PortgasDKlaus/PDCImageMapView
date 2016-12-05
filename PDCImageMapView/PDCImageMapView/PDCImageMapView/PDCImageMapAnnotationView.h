//
//  PDCImageMapAnnotationView.h
//  VRRoom
//
//  Created by PortgasDKlaus on 16/8/31.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDCImageMapAnnotation.h"

@protocol PDCImageMapAnnotationViewDelegate;

@interface PDCImageMapAnnotationView : UIView

@property (nonatomic, weak) id<PDCImageMapAnnotationViewDelegate> delegate;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) PDCImageMapAnnotation *annotation;

@property (nonatomic) CGSize bgSize; // 背景视图大小.
@property (nonatomic) CGSize imageSize; // 背景图片大小.


- (void)setAnnotation:(PDCImageMapAnnotation *)annotation equreX:(float)equreX equreY:(float)equreY;

@end

@protocol PDCImageMapAnnotationViewDelegate <NSObject>

@optional

- (void)PDCImageMapAnnotationView:(PDCImageMapAnnotationView *)annotationView didSelected:(PDCImageMapAnnotation *)annotation;

@end
