//
//  WriteViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/7.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiele;
@property (nonatomic,strong) NSFileHandle *writeFH;
@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fileStr = @"/Users/xueyingbo/Desktop/tt.text";
    NSFileManager *mgr = [NSFileManager defaultManager];
    //BOOL isDir;
    if (![mgr fileExistsAtPath:fileStr]) {
        NSError *error = nil;
        [mgr createFileAtPath:fileStr contents:nil attributes:nil];
        
        if (error) {
            NSLog(@"%@",[error localizedDescription]);
        }
    }
    _writeFH = [NSFileHandle fileHandleForWritingAtPath:fileStr];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)writeFile:(UIButton *)sender {
    [_writeFH writeData:[_textFiele.text dataUsingEncoding:NSUTF8StringEncoding]];
    
}



@end
