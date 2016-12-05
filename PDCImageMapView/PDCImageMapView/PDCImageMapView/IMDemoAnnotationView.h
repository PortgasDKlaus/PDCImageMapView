//
//  IMDemoAnnotationView.h
//  VRRoom
//
//  Created by PortgasDKlaus on 16/9/1.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "PDCImageMapAnnotationView.h"

@protocol IMDemoAnnotationViewDelegate;

@interface IMDemoAnnotationView : PDCImageMapAnnotationView

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic) float arrawHeight;

@property (nonatomic, weak) id<IMDemoAnnotationViewDelegate> demoDelegate;

@end

@protocol IMDemoAnnotationViewDelegate <NSObject>

- (void)IMDemoAnnotationView:(IMDemoAnnotationView *)annotationView selectedAnnotation:(PDCImageMapAnnotation *)annotation;

@end
