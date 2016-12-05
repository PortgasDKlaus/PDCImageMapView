//
//  ViewController.m
//  PDCImageMapView
//
//  Created by PortgasDKlaus on 2016/11/25.
//  Copyright © 2016年 PortgasDKlaus. All rights reserved.
//


/*
 这是个可添加标注的自定义地图的示例
 
 底部地图图片实现了自适应屏幕宽高进行移动，没有实现缩放
 
 添加标注是根据在图片上世纪取到的像素点进行标点
 */

#import "ViewController.h"
#import "PDCImageMapView.h"
#import "DemoCell.h"
#import "OneViewController.h"

#define kImagePointX @[@388,@650,@940]
#define kImagePointY @[@588,@230,@590]
#define kImageText @[@"卡里姆多",@"诺森德",@"艾泽拉斯"]

#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight        [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<PDCImageMapViewDelegate,PDCImageMapAnnotationViewDelegate>

@property (nonatomic,strong) PDCImageMapView *mapView;
@property (nonatomic,strong) NSMutableArray *annotations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _annotations = [[NSMutableArray alloc] init];
    
    [self.view addSubview:self.mapView];
    
    UIImage* image = [UIImage imageNamed:@"bgImage"];
    _mapView.bgSize = image.size;
    [_mapView.mapBgView setBGImage:image];
    [self addAnnotations];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (PDCImageMapView *)mapView{
    if (!_mapView) {
        _mapView = [[PDCImageMapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _mapView.delegate = self;
        _mapView.backgroundColor = [UIColor blackColor];
    }
    return _mapView;
}

// 添加标注
- (void)addAnnotations{
    [_annotations removeAllObjects];
    [_mapView removeAllAnnotations];
    for (int i = 0; i < kImagePointX.count; i ++) {
        
        PDCImageMapAnnotation *anno = [[PDCImageMapAnnotation alloc] init];
        anno.index = i;
        
        anno.name = kImageText[i];
        //标注背景气泡
        anno.latitude = [kImagePointX[i] floatValue];
        anno.longitude = [kImagePointY[i] floatValue];
        
        [_annotations addObject:anno];
    }
    [_mapView addAnnotations:_annotations];
}

#pragma mark - Delegate

// 绘制标注
- (PDCImageMapAnnotationView *)PDCImageMapView:(PDCImageMapView *)annotationView viewForAnnotation:(id<PDCImageMapAnnotationDLGT>)annotation{
    
    if ([annotation isKindOfClass:[PDCImageMapAnnotation class]]){
        // 标识符功能暂无
        PDCImageMapAnnotation * anno = (PDCImageMapAnnotation *)annotation;
        // DemoCell 是个自定义的cell
        DemoCell *cell;
        if (cell == nil){
            cell = [[DemoCell alloc] initWithFrame:CGRectMake(0, 0, 170, 66)];
        }
        
        cell.label.text = anno.name;
        cell.image = [UIImage imageNamed:@"paopao"];
        
        
        return cell;
    }
    return nil;
}

// 标注点击事件
- (void)PDCImageMapAnnotationView:(PDCImageMapAnnotationView *)annotationView didSelected:(PDCImageMapAnnotation *)annotation{
    NSLog(@"点击标注:[%@]",annotation.name);
    OneViewController *vc = [[OneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
