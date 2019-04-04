//
//  JTLoadingView.m
//  ZXJTOpenAccountDemo
//
//  Created by 你猜我是谁啊 on 2019/4/4.
//  Copyright © 2019 你猜我是谁啊. All rights reserved.
//

#import "JTLoadingView.h"
#define JT_MYBUNDLE_NAME   @"JT_H5OpenAccountImages.bundle"
#define JT_MYBUNDLE_PATH   [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:JT_MYBUNDLE_NAME]
#define JT_MYBUNDLE        [NSBundle bundleWithPath:JT_MYBUNDLE_PATH]
#define JT_VideoImagePathWithName(name) [JT_MYBUNDLE_PATH stringByAppendingPathComponent:name]

JTLoadingView *_loadingView;

@interface JTLoadingView()
/** 动画图片 **/
@property (nonatomic, strong) UIImageView *loadingImg;
@end

@implementation JTLoadingView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.loadingImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        self.loadingImg.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
        self.loadingImg.image = [UIImage imageNamed:JT_VideoImagePathWithName(@"JTloadingImage")];
        self.loadingImg.contentMode = UIViewContentModeScaleAspectFit;
        self.loadingImg.backgroundColor = [UIColor redColor];
        [self addSubview:self.loadingImg];
    }
    return self;
}
- (void)startAnimation{
    // 对Y轴进行旋转
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 执行
    animation.beginTime = CACurrentMediaTime();
    // 持续时间
    animation.duration = 1;
    // 重复次数
    animation.repeatCount = MAXFLOAT;
    // 起始角度
    animation.fromValue = @(0.0);
    // 终止角度
    animation.toValue = @(2 * M_PI);
    // 添加动画
    [self.loadingImg.layer addAnimation:animation forKey:@"loadingImgRotate"];
   
}
- (void)endAnimation{
    [self.loadingImg.layer removeAllAnimations];
}
+ (void)jt_loadingShow:(UIView *)view{
    _loadingView  = [[JTLoadingView alloc] initWithFrame:view.bounds];
    [_loadingView startAnimation];
    [view addSubview:_loadingView];
}
+ (void)jt_loadingHide{
    [_loadingView endAnimation];
    [_loadingView removeFromSuperview];
    _loadingView = nil;
}
    
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end