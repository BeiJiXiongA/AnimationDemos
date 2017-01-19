//
//  NSString+stringSize.h
//  SpaceHome
//
//  Created by ZhangWei-SpaceHome on 15/11/18.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (stringSize)
///固定宽
+ (CGSize)getSizeWithString:(NSString *)content andWidth:(CGFloat)width andFont:(UIFont *)font;

///固定高
+ (CGSize)getSizeWithString:(NSString *)content andHeight:(CGFloat)height andFont:(UIFont *)font;

///固定宽，限制高
+ (CGSize)getSizeWithString:(NSString *)content andWidth:(CGFloat)width andFont:(UIFont *)font maxHeight:(CGFloat)maxHeight;

///固定高，限制宽
+ (CGSize)getSizeWithString:(NSString *)content andHeight:(CGFloat)height andFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;
@end
