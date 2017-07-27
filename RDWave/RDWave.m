//
//  RDWave.m
//  RDWave
//
//  Created by 刘吉六 on 2017/7/27.
//  Copyright © 2017年 liujiliu. All rights reserved.
//

#import "RDWave.h"
#import "WaveView.h"

@implementation RDWave

- (instancetype)initWithFrame:(CGRect)frame andText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        WaveView *waveView = [[WaveView alloc] initWithFrame:self.bounds];
        waveView.progress = 0.5;
        waveView.textLabel.text = text;
        [self addSubview:waveView];
        
        WaveView *maskWaveView = [[WaveView alloc] initWithFrame:self.bounds];
        maskWaveView.progress = 0.5;
        maskWaveView.waveColor = [UIColor blueColor];
        maskWaveView.backgroundColor = [UIColor clearColor];
        
        UILabel *maskLabel = [UILabel new];
        maskLabel.frame = waveView.textLabel.frame;
        maskLabel.text = waveView.textLabel.text;
        maskLabel.textAlignment = waveView.textLabel.textAlignment;
        maskLabel.font = waveView.textLabel.font;
        maskLabel.textColor = [UIColor whiteColor];
        maskLabel.maskView = maskWaveView;
        [self addSubview:maskLabel];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
