//
//  ViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "TuoYuanView.h"
#import "KouView.h"

#define MAXHEIGHT     750
#define MAXWIDTH      1000

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *imagePicker;
    
    CATransform3D trans;
}
@property (weak, nonatomic) IBOutlet UIView *layerView;

@property (nonatomic, strong) CALayer *colorLayer;
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a
//    self.colorLayer = [CALayer layer];
//    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
//    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
//    self.colorLayer.anchorPoint = CGPointMake(0.5, 0);
//    [self.layerView.layer addSublayer:self.colorLayer];
//    
//    imagePicker = [[UIImagePickerController alloc] init];
//    imagePicker.delegate = self;

    //毛玻璃
//    UIVisualEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
//    blurView.frame = CGRectMake(50, 250, 300, 100);
//    [self.view addSubview:blurView];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH/2 - 30, 200-30, 60, 60);
    [button setTitle:@"P" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    KouView *kouView = [[KouView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT - 100)];
    kouView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    kouView.userInteractionEnabled = NO;
    [self.view addSubview:kouView];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    imageView.image = [UIImage imageNamed:@"renzheng"];
//    [self.view addSubview:imageView];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:CGPointMake(200, 160)];
    
    [path1 addLineToPoint:CGPointMake(250, 250)];
    
    [path1 addLineToPoint:CGPointMake(250, 300)];
    
    [path1 addLineToPoint:CGPointMake(150, 250)];

    [path1 closePath];
    
    [path appendPath:[path1 bezierPathByReversingPath]];
    
    
//    [path appendPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 150, 100)] bezierPathByReversingPath]];
    
//    // MARK: circlePath
//    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
//
//    // MARK: roundRectanglePath
//    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 400, SCREEN_WIDTH - 2 * 20, 100) cornerRadius:15] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    kouView.layer.mask = shapeLayer;
}

-(void)buttonClick
{
    NSLog(@"button clicked!");
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    _demoImageView.image = image;
    
    image = [self getNormalImageFromImage:image];
    
    _demoImageView2.image = image;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)selectImage:(UITapGestureRecognizer *)sender {
    
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"" destructiveButtonTitle:nil otherButtonTitles:@"相册",@"相机", nil];
    [ac showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0 || buttonIndex == 1) {
        if (buttonIndex == 0) {
            //相册
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
        }else if(buttonIndex == 1){
            //相机
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        [self.navigationController presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)changeColor:(id)sender {

    
//    trans =  CATransform3DTranslate(trans, -10, -30, -10);
//    trans = CATransform3DScale(trans, 1.0/3.0, 1.0/2.0, 1.0/2.0);
    trans = CATransform3DRotate(_colorLayer.transform, 30*M_PI/180, 1, 0, 0);
    trans.m34 = -1.0/600.0;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.colorLayer.transform = trans;
//        _colorLayer.frame = CGRectMake(_colorLayer.frame.origin.x - 10, _colorLayer.frame.origin.y-30, _colorLayer.frame.size.width, _colorLayer.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
    NSLog(@"color layer frame %@",NSStringFromCGRect(_colorLayer.frame));
//    CGFloat red = arc4random() / (CGFloat)INT_MAX;
//    CGFloat green = arc4random() / (CGFloat)INT_MAX;
//    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.fromValue = (__bridge id)self.colorLayer.backgroundColor;
//    self.colorLayer.backgroundColor = color.CGColor;
//    animation.keyPath = @"backgroudColor";
//    animation.toValue = (__bridge id)(color.CGColor);
//    [self applyBasicAnimation:animation toValue:self.colorLayer];
//    
//    
//    [UIView animateWithDuration:3
//                          delay:0
//         usingSpringWithDamping:.3
//          initialSpringVelocity:10
//                        options:2
//                     animations:^{
//                         _colorLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_colorLayer.frame), CGRectGetHeight(_colorLayer.frame)+50);
//                     }
//                     completion:^(BOOL finished) {
//                         
//                     }
//     ];
}
- (IBAction)changeColors:(id)sender {
    
//    trans =  CATransform3DTranslate(trans, 10, 30, 10);
//    trans = CATransform3DScale(trans, 3, 2, 2);
    trans = CATransform3DRotate(_colorLayer.transform, -30*M_PI/180, 1, 0, 0);
    trans.m34 = 1.0/600.0;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.colorLayer.transform = trans;
//        _colorLayer.frame = CGRectMake(_colorLayer.frame.origin.x + 10, _colorLayer.frame.origin.y + 30, _colorLayer.frame.size.width, _colorLayer.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    NSLog(@"color layer frame %@",NSStringFromCGRect(_colorLayer.frame));
    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"backgroundColor";
//    animation.duration = 2.0f;
//    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
//                         (__bridge id)[UIColor redColor].CGColor,
//                         (__bridge id)[UIColor greenColor].CGColor,
//                         (__bridge id)[UIColor blueColor].CGColor];
//    [self.colorLayer addAnimation:animation forKey:nil];
//    
//    [UIView animateWithDuration:3
//                          delay:0
//         usingSpringWithDamping:.3
//          initialSpringVelocity:10
//                        options:2
//                     animations:^{
//                         _colorLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_colorLayer.frame), CGRectGetHeight(_colorLayer.frame)-50);
//                     }
//                     completion:^(BOOL finished) {
//                         
//                     }
//     ];
}

-(void)applyBasicAnimation:(CABasicAnimation *)animation toValue:(CALayer *)layer
{
    animation.fromValue = [layer.presentationLayer ? : layer valueForKeyPath:animation.keyPath];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [layer setValue:animation.toValue forKey:animation.keyPath];
    [CATransaction commit];
    [layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - dealImage
-(UIImage *)getNormalImageFromImage:(UIImage *)originalImage
{
    //    a307741613dbc06cd926be027a15298364712d59
    CGFloat imageHeight = 0.0f;
    CGFloat imageWidth = 0.0f;
    if (originalImage.size.width > originalImage.size.height)
    {
        if (originalImage.size.height > MAXHEIGHT)
        {
            imageHeight = MAXHEIGHT;
            imageWidth = originalImage.size.width*imageHeight/originalImage.size.height;
        }
        else
        {
            imageHeight = originalImage.size.height;
            imageWidth = originalImage.size.width;
        }
    }
    else if(originalImage.size.width < originalImage.size.height)
    {
        if (originalImage.size.width > MAXWIDTH)
        {
            imageWidth = MAXWIDTH;
            imageHeight = originalImage.size.height*imageWidth/originalImage.size.width;
        }
        else
        {
            imageHeight = originalImage.size.height;
            imageWidth = originalImage.size.width;
        }
    }
    else
    {
        if (originalImage.size.width > MAXWIDTH)
        {
            imageWidth = MAXWIDTH;
            imageHeight = MAXWIDTH;
        }
        else
        {
            imageHeight = originalImage.size.height;
            imageWidth = originalImage.size.width;
        }
    }
    originalImage = [self thumbnailWithImageWithoutScale:originalImage size:CGSizeMake(imageWidth, imageHeight)];
    
    return originalImage;
}

- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIGraphicsBeginImageContext(asize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0, 0, asize.width+2, asize.height+2)];
    
    // Get the new image from the context
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    
    return newImage;
}


@end
