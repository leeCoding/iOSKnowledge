//
//  LTGestureViewController.m
//  iOSKnowledge
//
//  Created by Jonny on 16/9/2.
//  Copyright © 2016年 Jonny. All rights reserved.
//

/// 参考博客
// http://www.cnblogs.com/huangjianwu/p/4675648.html

#import "LTGestureViewController.h"

@interface LTGestureViewController ()
<
    UIGestureRecognizerDelegate
>

@property (nonatomic , strong)UIImageView *imageView1;

@end

@implementation LTGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData {
    
}

#pragma mark - 初始化视图
- (void)initView {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1.单击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    // 单击数
    tap.numberOfTapsRequired = 2;
    // 手指数
    tap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:tap];
    
    // 2.长按
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longGestureRecognizer:)];
    // 长按时间
    longGesture.minimumPressDuration = 2;
    // 设置手指触碰位置周围10像素
    longGesture.allowableMovement  = 10;
    [self.view addGestureRecognizer:longGesture];
    
    //  3.轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
    
    // 上下左右
    /*
    UISwipeGestureRecognizerDirectionRight
    UISwipeGestureRecognizerDirectionLeft
    UISwipeGestureRecognizerDirectionUp
    UISwipeGestureRecognizerDirectionDown
    */
    
    // 手指数
    swipe.numberOfTouchesRequired = 2;
    //  向右滑动
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    // 4.旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationGesture:)];
    rotation.delegate = self;
//    rotation.velocity = 1;
    [imageView addGestureRecognizer:rotation];
    
    
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 350, 200, 200)];
    self.imageView1.backgroundColor = [UIColor purpleColor];
    self.imageView1.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView1];
    
    // 5.拖拽手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imageView1 addGestureRecognizer:panGesture];
    
    // 6.捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.imageView1 addGestureRecognizer:pinch];
    
}

#pragma mark - 轻敲手势
- (void)tap:(UIGestureRecognizer *)tap {
    
    NSLog(@" 轻敲手势");
    UITapGestureRecognizer *tap1 = (UITapGestureRecognizer *)tap;
    
    // 移除一个手势
    [self.view removeGestureRecognizer:tap1];
}

#pragma mark - 长按手势
- (void)longGestureRecognizer:(UIGestureRecognizer *)longGesture {
    
    NSLog(@"两秒触发");
}

#pragma mark - 轻扫
- (void)swipeGesture:(UIGestureRecognizer *)swipe {
    
    NSLog(@"轻扫");
}

#pragma mark - 旋转手势
- (void)rotationGesture:(UIRotationGestureRecognizer *)rotation {
    
    NSLog(@"旋转");
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;
}

#pragma mark - 拖拽
- (void)pan:(UIPanGestureRecognizer *)panGesture {
    
    // 1. 获取手指拖拽的时候, 平移的值
    CGPoint translation = [panGesture translationInView:panGesture.view];
    
    // 2. 让当前控件做响应的平移
    self.imageView1.transform = CGAffineTransformTranslate(panGesture.view.transform, translation.x, translation.y);
    
    // 3. 每次平移手势识别完毕后, 让平移的值不要累加
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}

#pragma mark - 捏合
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
