//
//  ViewController.m
//  RDWave
//
//  Created by 刘吉六 on 2017/7/27.
//  Copyright © 2017年 liujiliu. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    waveView.center = self.view.center;
    waveView.progress = 0.5;
    [self.view addSubview:waveView];

    WaveView *maskWaveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    maskWaveView.progress = 0.5;
    maskWaveView.waveColor = [UIColor blueColor];
    maskWaveView.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [UILabel new];
    label.text = @"RD";
    label.font = [UIFont boldSystemFontOfSize:50];
    label.textColor = waveView.waveColor;
    label.frame = waveView.frame;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UILabel *maskLabel = [UILabel new];
    maskLabel.frame = waveView.frame;
    maskLabel.text = @"RD";
    maskLabel.textAlignment = NSTextAlignmentCenter;
    maskLabel.font = [UIFont boldSystemFontOfSize:50];
    maskLabel.textColor = [UIColor whiteColor];
    maskLabel.maskView = maskWaveView;
    [self.view addSubview:maskLabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
