//
//  FileManagerViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/2.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "FileManagerViewController.h"

@interface FileManagerViewController ()

@end

@implementation FileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)copy:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *sourcePath = @"/Users/xueyingbo/Desktop/ForTest/达内桌面背景.jpg";
    
    NSString *destinationPath = @"/Users/xueyingbo/Desktop/zz/zzz.jpg";
    
    [mgr copyItemAtPath:sourcePath toPath:destinationPath error:nil];
    
}
- (IBAction)paste:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *sourcePath = @"/Users/xueyingbo/Desktop/zz/zzz.jpg";
    
    NSString *destinationPath = @"/Users/xueyingbo/Desktop/zz/x/zzz.jpg";
    [mgr moveItemAtPath:sourcePath toPath:destinationPath error:nil];
    
    
}
- (IBAction)remove:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    //NSString *sourcePath = @"/Users/xueyingbo/Desktop/zz/zzz.jpg";
    
    NSString *destinationPath = @"/Users/xueyingbo/Desktop/zz/x/zzz.jpg";
    [mgr removeItemAtPath:destinationPath error:nil];
    
}

- (IBAction)isFileExist:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *sourcePath = @"/Users/xueyingbo/Desktop/zz";
    
    BOOL isExist = [mgr fileExistsAtPath:sourcePath];
    if (isExist) {
        NSLog(@"存在");
    }else{
        NSLog(@"不存在");
    }
    
}
- (IBAction)isFile:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *sourcePath = @"/Users/xueyingbo/Desktop/zz";
    
    BOOL isDir;
    BOOL isExist = [mgr fileExistsAtPath:sourcePath isDirectory:&isDir];
    
    // isExists YES(路径合法，在硬盘上存在)
    // isDir   NO（路径虽然合法，但不是文件夹）
    if (isExist && isDir) {
        NSLog(@"是文件夹");
    }else{
        NSLog(@"路径不合法或者不是文件夹");
    }
    
    
    
}
- (IBAction)printAllPic:(UIButton *)sender {
    
    
    NSString *sourcePath = @"/Users/xueyingbo/Desktop/ForTest";
    [self printImage:sourcePath];
    
}

- (void)printImage:(NSString *)path{
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirec;
    if ([mgr fileExistsAtPath:path isDirectory:&isDirec] && isDirec) {
        NSArray *fileNames = [mgr contentsOfDirectoryAtPath:path error:nil];
        for (NSString *subFileNames in fileNames) {
            
            NSString *newSubFilename = [path stringByAppendingString:subFileNames];
            [self printImage:newSubFilename];
        }
    }else{
        if ([path hasSuffix:@".png"] || [path hasSuffix:@".jpg"]) {
            NSLog(@"%@",path);
        }
    }
}


@end
