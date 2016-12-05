//
//  PDCImageMapView.h
//  VRRoom
//
//  Created by PortgasDKlaus on 16/8/31.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDCImageMapAnnotation.h"
#import "PDCImageMapAnnotationView.h"
#import "PDCStaticHImageView.h"

@protocol PDCImageMapViewDelegate;

@interface PDCImageMapView : UIView

@property (nonatomic, weak) id<PDCImageMapViewDelegate> delegate;

@property (nonatomic,strong) NSMutableArray *annotations;

@property (nonatomic, strong) PDCStaticHImageView *mapBgView;

@property (nonatomic) CGSize bgSize;

-(void)setImage:(UIImage*)_image;

-(void)moveToX:(CGFloat)x ToY:(CGFloat)y;

/**
 *  添加标注
 *
 *  @param annotation 标注模型
 */
- (void)addAnnotation:(PDCImageMapAnnotation *)annotation;

/**
 *  添加标注数组
 *
 *  @param annotations 标注数组
 */
- (void)addAnnotations:(NSMutableArray *)annotations;

/**
 *  删除所有标注
 */
- (void)removeAllAnnotations;

@end

@protocol PDCImageMapViewDelegate <NSObject>

@optional

/**
 *  添加标注代理
 *
 *  @param annotationView PDCImageMapView
 *  @param annotation     PDCImageMapAnnotationDLGT
 *
 *  @return 返回一个标注视图
 */
- (PDCImageMapAnnotationView *)PDCImageMapView:(PDCImageMapView *)annotationView viewForAnnotation:(id <PDCImageMapAnnotationDLGT>)annotation;


/**
 *  标注点击事件
 *
 *  @param annotationView PDCImageMapView
 *  @param annotation     PDCImageMapAnnotationDLGT
 *
 */
- (void)PDCImageMapAnnotationView:(PDCImageMapAnnotationView *)annotationView didSelected:(PDCImageMapAnnotation *)annotation;

@end


