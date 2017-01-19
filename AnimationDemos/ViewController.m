//
//  ViewController.m
//  AnimationDemos
//
//  Created by ZhangWei-SpaceHome on 15/9/22.
//  Copyright (c) 2015年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "TuoYuanView.h"

#define MAXHEIGHT     750
#define MAXWIDTH      1000

@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *imagePicker;
}
@property (weak, nonatomic) IBOutlet UIView *layerView;

@property (nonatomic, strong) CALayer *colorLayer;
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    UIVisualEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
    blurView.frame = CGRectMake(50, 250, 300, 100);
    [self.view addSubview:blurView];
    
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

    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.fromValue = (__bridge id)self.colorLayer.backgroundColor;
    self.colorLayer.backgroundColor = color.CGColor;
    animation.keyPath = @"backgroudColor";
    animation.toValue = (__bridge id)(color.CGColor);
    [self applyBasicAnimation:animation toValue:self.colorLayer];
    
    
    [UIView animateWithDuration:3
                          delay:0
         usingSpringWithDamping:.3
          initialSpringVelocity:10
                        options:2
                     animations:^{
                         _colorLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_colorLayer.frame), CGRectGetHeight(_colorLayer.frame)+50);
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
}
- (IBAction)changeColors:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0f;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor];
    [self.colorLayer addAnimation:animation forKey:nil];
    
    [UIView animateWithDuration:3
                          delay:0
         usingSpringWithDamping:.3
          initialSpringVelocity:10
                        options:2
                     animations:^{
                         _colorLayer.frame = CGRectMake(0, 0, CGRectGetWidth(_colorLayer.frame), CGRectGetHeight(_colorLayer.frame)-50);
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
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
