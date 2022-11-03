//
//  MessageVC.m
//  First1
//
//  Created by New on 2022/9/3.
//

#import <Foundation/Foundation.h>

#import "MessageVC.h"

#import "SVGKit.h"

@interface MessageVC ()

@end

@implementation MessageVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUi];
    
}

- (void)setupUi {
    
    
}

+(UIColor*)changeColor {
    
    return [UIColor orangeColor];
    
}

+ (UIImage *)svgImageWithName:(NSString *)name andSize:(CGSize)size {
    
    SVGKImage * svgImage = [SVGKImage imageNamed:name];
    
    svgImage.size = size;
    
    return svgImage.UIImage;
}

+(UIImage *)imageWithName:(NSString *)name {
    
//    NSBundle * path = [NSBundle mainBundle];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:name ofType:@"jpeg"];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    UIImage *image1 = [UIImage imageWithData:imageData];
    
    return image1;
}

@end
