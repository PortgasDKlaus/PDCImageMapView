//
//  StaticHeightImageView.m
//  720Test
//
//  Created by PortgasDKlaus on 2016/11/15.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "PDCStaticHImageView.h"

#define SCALE_FRAME_Y 100.0f
#define BOUNDCE_DURATION 0.3f

@interface  PDCStaticHImageView ()

@property (nonatomic, strong) UIView* ratioView;
@property (nonatomic) float equreX;
@property (nonatomic) float equreY;

@property (nonatomic) BOOL verticalScroll;

@end

@implementation PDCStaticHImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.cropFrame = frame;
        self.verticalScroll = NO;
        [self addSubview:self.ratioView];
        [self addSubview:self.imageView];
        [self addGestureRecognizers];
    }
    return self;
}

- (UIView *)ratioView{
    if (!_ratioView) {
        _ratioView = [[UIView alloc] initWithFrame:_cropFrame];
        _ratioView.backgroundColor = [UIColor whiteColor];
        _ratioView.autoresizingMask = UIViewAutoresizingNone;
    }
    return _ratioView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:_cropFrame];
        [_imageView setMultipleTouchEnabled:YES];
        [_imageView setUserInteractionEnabled:YES];
    }
    return _imageView;
}

- (void)setBGImage:(UIImage *)image{
    _imageView.image = image;
    NSLog(@"111 : %@",_imageView);
    [self resetImageViewFrame];
    NSLog(@"222 : %@",_imageView);
}

- (void)resetImageViewFrame{
    float proportionR = _ratioView.frame.size.width/_ratioView.frame.size.height;
    float proportionA = _bgSize.width/_bgSize.height;
    
    if (proportionR > proportionA) {
        _verticalScroll = YES;
        float width = _ratioView.frame.size.width;
        float height = _bgSize.height * (width/_bgSize.width);
        _imageView.frame = CGRectMake(0, (self.ratioView.frame.size.height - height)/2, width, height);
    }else{
        _verticalScroll = NO;
        float height = _ratioView.frame.size.height;
        float width = _bgSize.width * (height/_bgSize.height);
        _imageView.frame = CGRectMake((self.ratioView.frame.size.width - width)/2, 0, width, height);
    }
    
    // tonyqt -- test
//    if (proportionR > proportionA) {
//        _verticalScroll = YES;
//        float width = _ratioView.frame.size.width;
//        float height = _bgSize.height * (width/_bgSize.width);
//        _imageView.frame = CGRectMake(0, 0, width, height);
//    }else{
//        _verticalScroll = NO;
//        float height = _ratioView.frame.size.height;
//        float width = _bgSize.width * (height/_bgSize.height);
//        _imageView.frame = CGRectMake(0, 0, width, height);
//    }
}

- (void)methForQuareWithSize:(CGSize)size imageSize:(CGSize)imageSize{
    _equreX = size.width / imageSize.width;
    _equreY = size.height / imageSize.height;
    
    //    _equre = pow(sqrt(imageSize.width) - sqrt(imageSize.height),2)/pow(sqrt(size.width) - sqrt(size.height),2);
}


#pragma mark - gestures

// register all gestures
- (void) addGestureRecognizers
{
    // add pinch gesture
//    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
//    [self addGestureRecognizer:pinchGestureRecognizer];
    
    // add pan gesture
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.imageView addGestureRecognizer:panGestureRecognizer];
}

// pinch gesture handler
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = self.imageView;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
    else if (pinchGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGRect newFrame = self.imageView.frame;
//        newFrame = [self handleScaleOverflow:newFrame];
        newFrame = [self handleVerticalOverflow:newFrame];
        [UIView animateWithDuration:BOUNDCE_DURATION animations:^{
            self.imageView.frame = newFrame;
//            self.latestFrame = newFrame;
        }];
    }
}

// pan gesture handler
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer {
    UIView *view = self.imageView;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        // calculate accelerator
        if (_verticalScroll) {
            CGFloat absCenterY = self.cropFrame.origin.y + self.cropFrame.size.height / 2;
            CGFloat scaleRatio = self.imageView.frame.size.width / self.cropFrame.size.width;
            CGFloat acceleratorY = 1 - ABS(absCenterY - view.center.y) / (scaleRatio * absCenterY);
            CGPoint translation = [panGestureRecognizer translationInView:view.superview];
            [view setCenter:(CGPoint){view.center.x , view.center.y + translation.y * acceleratorY }];
            [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
        }else{
            CGFloat absCenterX = self.cropFrame.origin.x + self.cropFrame.size.width / 2;
            CGFloat scaleRatio = self.imageView.frame.size.width / self.cropFrame.size.width;
            CGFloat acceleratorX = 1 - ABS(absCenterX - view.center.x) / (scaleRatio * absCenterX);
            CGPoint translation = [panGestureRecognizer translationInView:view.superview];
            [view setCenter:(CGPoint){view.center.x + translation.x * acceleratorX, view.center.y }];
            [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
        }
        
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // bounce to original frame
        CGRect newFrame = self.imageView.frame;
        if (_verticalScroll) {
            newFrame = [self handleHorizontalOverflow:newFrame];
        }else{
            newFrame = [self handleVerticalOverflow:newFrame];
        }
        
        [UIView animateWithDuration:BOUNDCE_DURATION animations:^{
            self.imageView.frame = newFrame;
//            self.latestFrame = newFrame;
        }];
    }
}

//- (CGRect)handleScaleOverflow:(CGRect)newFrame {
//    // bounce to original frame
//    CGPoint oriCenter = CGPointMake(newFrame.origin.x + newFrame.size.width/2, newFrame.origin.y + newFrame.size.height/2);
//    if (newFrame.size.width < self.oldFrame.size.width) {
//        newFrame = self.oldFrame;
//    }
//    if (newFrame.size.width > self.largeFrame.size.width) {
//        newFrame = self.largeFrame;
//    }
//    newFrame.origin.x = oriCenter.x - newFrame.size.width/2;
//    newFrame.origin.y = oriCenter.y - newFrame.size.height/2;
//    return newFrame;
//}

- (CGRect)handleVerticalOverflow:(CGRect)newFrame {
    // horizontally
    
    if (newFrame.size.width < self.cropFrame.size.width) {
        if (newFrame.origin.x + newFrame.size.width > self.cropFrame.size.width)
            newFrame.origin.x = self.cropFrame.size.width - newFrame.size.width;
        if (newFrame.origin.x < self.cropFrame.origin.x)
            newFrame.origin.x = self.cropFrame.origin.x;
    }else{
        if (newFrame.origin.x + newFrame.size.width < self.cropFrame.size.width)
            newFrame.origin.x = self.cropFrame.size.width - newFrame.size.width;
        if (newFrame.origin.x > self.cropFrame.origin.x)
            newFrame.origin.x = self.cropFrame.origin.x;
    }
    
    return newFrame;
}

- (CGRect)handleHorizontalOverflow:(CGRect)newFrame {
    // horizontally
    
    if (newFrame.size.height < self.cropFrame.size.height) {
        if (newFrame.origin.y + newFrame.size.height > self.cropFrame.size.height)
            newFrame.origin.y = self.cropFrame.size.height - newFrame.size.height;
        if (newFrame.origin.y < self.cropFrame.origin.y)
            newFrame.origin.y = self.cropFrame.origin.y;
    }else{
        if (newFrame.origin.y + newFrame.size.height < self.cropFrame.size.height)
            newFrame.origin.y = self.cropFrame.size.height - newFrame.size.height;
        if (newFrame.origin.y > self.cropFrame.origin.y)
            newFrame.origin.y = self.cropFrame.origin.y;
    }
    
    return newFrame;
}


@end
