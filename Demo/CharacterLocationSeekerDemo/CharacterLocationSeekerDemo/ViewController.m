//
//  ViewController.m
//  CharacterLocationSeekerDemo
//
//  Created by Fasa Mo on 16/3/30.
//  Copyright © 2016年 FasaMo. All rights reserved.
//

#import "ViewController.h"
#import "CharacterLocationSeeker.h"
#import "CharacterLocationSeeker_TextView.h"

@interface ViewController ()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIView *flagView;
@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) CharacterLocationSeeker *locationSeeker;
@property (strong, nonatomic) CharacterLocationSeeker_TextView *textViewSeeker;
@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViews];
    [self setupLayout];
}

#pragma mark - Setup Views
- (void)setupViews
{
    // Attributes
    NSString *string = @"五花肉的9大销魂吃法！忍住，千万要忍住！！！叹号！！";
    UIFont *font = [UIFont systemFontOfSize:20];
    CGColorRef cgColor = [UIColor magentaColor].CGColor;
    CGFloat borderW = 1.f;
    
    // View Init
    UILabel *label = [UILabel new];
    label.layer.borderColor = cgColor;
    label.layer.borderWidth = borderW;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = font;
    label.text = string;
    [self.view addSubview:label];
    self.label = label;
    
    UIView *flagView = [UIView new];
    flagView.frame = CGRectZero;
    flagView.layer.borderColor = [UIColor redColor].CGColor;
    flagView.layer.borderWidth = 1.f;
    flagView.clipsToBounds = YES;
    [self.label addSubview:flagView];
    self.flagView = flagView;
    
    self.buttons = [NSMutableArray arrayWithCapacity:3];
    [self.buttons addObject:[self buttonWithTitle:@"locationSeeker" action:@selector(onLocationSeekerButton:)]];
    [self.buttons addObject:[self buttonWithTitle:@"textViewSeeker" action:@selector(onTextViewButton:)]];
    [self.buttons addObject:[self buttonWithTitle:@"reset" action:@selector(onRestButton:)]];
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(SEL)action
{
    UIButton *button = [UIButton new];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.tag = 0;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (void)setupLayout
{
    // Layout
    [self.view addConstraint:[self.label.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.7f]];
    [self.view addConstraint:[self.label.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-100]];
    [self.view addConstraint:[self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]];
    
    __block UIView *lastView = self.label;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull button, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view addConstraint:[button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]];
        [self.view addConstraint:[button.topAnchor constraintEqualToAnchor:lastView.bottomAnchor constant:50.f]];
        lastView = button;
    }];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
}

#pragma mark - Actions
- (IBAction)onLocationSeekerButton:(UIButton *)sender
{
    if (!self.locationSeeker) {
        self.locationSeeker = [CharacterLocationSeeker new];
        [self.locationSeeker configWithLabel:self.label];
    }
    
    [self layoutFlagWithFrame:[self.locationSeeker characterRectAtIndex:sender.tag]];
    sender.tag++;
    if (sender.tag == self.label.text.length) {
        sender.tag = 0;
    }
}

- (IBAction)onTextViewButton:(UIButton *)sender
{
    if (!self.textViewSeeker) {
        self.textViewSeeker = [CharacterLocationSeeker_TextView new];
        [self.textViewSeeker configWithLabel:self.label];
    }
    [self layoutFlagWithFrame:[self.textViewSeeker characterRectAtIndex:sender.tag]];
    sender.tag++;
    if (sender.tag == self.label.text.length) {
        sender.tag = 0;
    }
}

- (void)layoutFlagWithFrame:(CGRect)newFrame
{
    [UIView animateWithDuration:0.15 animations:^{
        self.flagView.frame = newFrame;
    }];
}

- (IBAction)onRestButton:(UIButton *)sender
{
    self.flagView.frame = CGRectZero;
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            subview.tag = 0;
        }
    }
}

@end
