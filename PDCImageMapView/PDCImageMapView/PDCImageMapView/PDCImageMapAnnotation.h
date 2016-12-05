//
//  PDCImageMapAnnotation.h
//  VRRoom
//
//  Created by PortgasDKlaus on 16/8/31.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PDCImageMapAnnotationDLGT <NSObject>

@end

@interface PDCImageMapAnnotation : NSObject <PDCImageMapAnnotationDLGT>

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) float latitude;
@property (nonatomic, assign) float longitude;
@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) UIImage *image;

@property (nonatomic, weak) id<PDCImageMapAnnotationDLGT> delegate;

@end
