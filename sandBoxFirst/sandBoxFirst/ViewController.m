//
//  ViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/1.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)searchFile:(UIButton *)sender {
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSString *filePath = @"/Users/xueyingbo/Desktop/ForTest";
    
    NSArray *fileNames = [mgr contentsOfDirectoryAtPath:filePath error:nil];
    NSMutableArray *subFile = [[NSMutableArray alloc]init];
    //获取文件加下所有文件的路径
    for (NSString *name in fileNames) {
        if ([name hasSuffix:@"png"]||[name hasSuffix:@"jpg"]) {
            NSString *subFilePath = [filePath stringByAppendingPathComponent:name];
            [subFile addObject:subFilePath];
        }
    }
    NSLog(@"%@",subFile);
    
    //获取根目录 的方法
    NSString *path = NSHomeDirectory();
    NSString *path2 = [[NSBundle mainBundle]resourcePath];
    //获取document\temp\lib的方法
    NSString *path3 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path4 = NSTemporaryDirectory();
    NSString *path5 = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //获取绝对路径
//    NSString *path6 = [[NSBundle mainBundle] pathForResource:<#(nullable NSString *)#> ofType:<#(nullable NSString *)#>];
//    NSString *path7 = [[NSBundle mainBundle] pathForResource:<#(nullable NSString *)#> ofType:<#(nullable NSString *)#> inDirectory:<#(nullable NSString *)#>];
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
