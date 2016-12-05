//
//  DemoCell.m
//  PDCImageMapView
//
//  Created by PortgasDKlaus on 2016/12/2.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//

#import "DemoCell.h"


@implementation DemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}


- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width-40, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

@end
