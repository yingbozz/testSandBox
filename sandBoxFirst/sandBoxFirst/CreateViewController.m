//
//  CreateViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/2.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (IBAction)createNewFile:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *createFilePath = @"/Users/xueyingbo/Desktop/zz/b";
    NSError *error = nil;
    [mgr createDirectoryAtPath:createFilePath withIntermediateDirectories:NO attributes:nil error:&error];
    
    if (error != nil) {
        NSLog(@"%@",[error localizedDescription]);
    }
   
}
- (IBAction)createN:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    NSString *str = @"你好你好你好";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *filePath = @"/Users/xueyingbo/Desktop/zz/c";
    
    [mgr createFileAtPath:filePath contents:data attributes:nil];
    
    NSString *newStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString *newStr1 = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",newStr);
    
    
    NSString *str4 = @"dfdsafa";
    NSData *data4= [str dataUsingEncoding:NSUTF8StringEncoding];
    UIImage *image = nil;
    NSData *data5 = UIImageJPEGRepresentation(image, 0.1f);
    NSData *data6 = UIImagePNGRepresentation(image);
    
    
    
    
                    
    
    
    
}


@end
