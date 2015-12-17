//
//  FileHandleViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/4.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "FileHandleViewController.h"

@interface FileHandleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic) int count;

@property (nonatomic,strong) NSMutableData *data;

@end

@implementation FileHandleViewController

-(NSMutableData *)data{
    if (!_data) {
        _data = [NSMutableData data];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //读取文字
    NSString *filePath = @"/Users/xueyingbo/Desktop/zz/c";
    NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:filePath];
    
    NSData *data = [readFH readDataToEndOfFile];
    _label.text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    //读取图片
    /*
     NSString *imagePath = @"/Users/xueyingbo/Desktop/ForTest/美女/fbb01.jpg";
     NSFileHandle *readFHImage = [NSFileHandle fileHandleForReadingAtPath:imagePath];
     
     
     NSData *imageData = [readFHImage readDataToEndOfFile];
     
     _imageVIew.image = [UIImage imageWithData:imageData];
     */
    
    
    //    NSString *imagePath = @"/Users/xueyingbo/Desktop/ForTest/美女/fbb01.jpg";
    //    NSFileHandle *readFHImage = [NSFileHandle fileHandleForReadingAtPath:imagePath];
    //    long long imageDataLength = [readFHImage seekToEndOfFile];
    //    [readFHImage seekToFileOffset:0];
    //    NSData *imageData = [readFHImage readDataOfLength:imageDataLength / 2];
    //    _imageVIew.image = [UIImage imageWithData:imageData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateImage:(UIButton *)sender {
    
    _count ++;
    NSString *imagePath = @"/Users/xueyingbo/Desktop/ForTest/美女/fbb01.jpg";
    NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:imagePath];
    long long fileLenth = [readFH seekToEndOfFile];
    [readFH seekToFileOffset:self.data.length];
    
    NSData *subData = nil;
    if (_count  < 3) {
        subData= [readFH readDataOfLength:fileLenth / 3];
    }else{
        subData = [readFH readDataToEndOfFile];
    }
    [_data appendData:subData];
    
    _imageVIew.image = [UIImage imageWithData:_data];
    
}

@end
