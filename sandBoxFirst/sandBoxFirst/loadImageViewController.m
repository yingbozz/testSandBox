//
//  loadImageViewController.m
//  sandBoxFirst
//
//  Created by 薛迎波 on 15/12/7.
//  Copyright © 2015年 XueYingbo. All rights reserved.
//

#import "loadImageViewController.h"

@interface loadImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) NSFileHandle *fh;

@property (nonatomic,strong) NSMutableData *data;

@property (nonatomic) long long fileLength;


@end

@implementation loadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imagePath = @"/Users/xueyingbo/Desktop/ForTest/达内桌面背景.jpg";
    NSFileManager *fm = [NSFileManager defaultManager];
    
    _fh = [NSFileHandle fileHandleForReadingAtPath:imagePath];
    
    _fileLength = [_fh seekToEndOfFile];
    [_fh seekToFileOffset:0];
    
    _data = [NSMutableData data];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(loadImage:) userInfo:nil repeats:YES];
   
}

- (void)loadImage:(NSTimer *)timer{
    NSData *subData = [_fh readDataOfLength:1000];
    [_data appendData:subData];
    _imageView.image = [UIImage imageWithData:_data];
    
    if (_data.length == _fileLength) {
        [timer invalidate];
    }  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
