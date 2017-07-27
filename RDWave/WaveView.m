//
//  WaveView.m
//  RDWave
//
//  Created by 刘吉六 on 2017/7/27.
//  Copyright © 2017年 liujiliu. All rights reserved.
//

#import "WaveView.h"

@interface WaveView ()
{
    UILabel *textLabel;
    CADisplayLink *displayLink;
    CGFloat currentOffset;
}


@end

@implementation WaveView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _progress = 0.5;
        _amplitude = 0.1;
        _offset = 1 * (M_PI * 2 / 60);
        _waveColor = [UIColor blueColor];
        self.backgroundColor = [UIColor whiteColor];
        [self drectCircle];
//        [self contrutUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    textLabel.font = [UIFont boldSystemFontOfSize:self.bounds.size.height * 0.5];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(ctx, 1);
    CGContextSetFillColorWithColor(ctx, _waveColor.CGColor);
    
    float radius = MIN(rect.size.width, rect.size.height);
    float startY = _progress * radius;
    float y = startY;
    
    CGPathMoveToPoint(path, nil, 0, y);
    
    for(float x = 0; x <= radius; x++){
        y = _amplitude * radius * sin( x / radius * M_PI * 2 + currentOffset) + startY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, radius, radius);
    CGPathAddLineToPoint(path, nil, 0, radius);
    CGPathAddLineToPoint(path, nil, 0, y);
    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);
    CGPathRelease(path);
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil) {
        [self stopAnimation];
    }
}

- (void)didMoveToWindow {
    [self startAnimation];
}

- (void)startAnimation {
    if (displayLink) {
        [self stopAnimation];
    }
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculateOffset)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)calculateOffset {
    currentOffset += _offset;
    [self setNeedsDisplay];
}

- (void)stopAnimation {
    [displayLink invalidate];
    displayLink = nil;
}

- (void)contrutUI {
    textLabel = [UILabel new];
    textLabel.textColor = _waveColor;
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.frame = self.bounds;
    [self addSubview:textLabel];
}

- (void)setText:(NSString *)text {
    textLabel.text = text;
}
    
- (void)drectCircle {
    self.layer.cornerRadius = self.frame.size.width * 0.5;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor greenColor].CGColor;
}

@end
