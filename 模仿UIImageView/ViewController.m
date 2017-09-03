//
//  ViewController.m
//  模仿UIImageView
//
//  Created by apple on 2017/9/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //1.加载
//    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//    //2.边框宽度
//    CGFloat borderW = 10;
//    //3.开启图片上下文
//    CGSize size = CGSizeMake(image.size.width + 2 *borderW, image.size.height + 2*borderW);
//    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    
//    
//    //4.添加一个大圆，设为填充
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
//    [[UIColor redColor] set];
//    [path fill];
//    
//    //5.添加一个小圆，把小圆设裁剪区域
//    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
//    
//    [path addClip];
//    
//    
//    //6.把图片给绘制上下文
//    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
//    
//    //7.生成一张新的图片
//    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
//    self.imageV.image = newImage;
//    
//    //8.关闭上下文
//    UIGraphicsEndPDFContext();
//
    
    self.imageV.image = [UIImage imageWithBorderWidth:10 borderColor:[UIColor greenColor] image:[UIImage imageNamed:@"阿狸头像"]];
    
}
-(UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image
{

    //3.开启图片上下文
    CGSize size = CGSizeMake(image.size.width + 2 *borderW, image.size.height + 2*borderW);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    
    //4.添加一个大圆，设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    
    //5.添加一个小圆，把小圆设裁剪区域
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    [path addClip];
    
    
    //6.把图片给绘制上下文
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    //7.生成一张新的图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
//    self.imageV.image = newImage;
    
    //8.关闭上下文
    UIGraphicsEndPDFContext();
    
    return newImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
