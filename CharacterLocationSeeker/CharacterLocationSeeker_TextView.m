//
//  TextViewCharacterLocationSeeker.m
//  计算某个字符的位置
//
//  Created by Fasa Mo on 16/3/30.
//  Copyright © 2016年 FasaMo. All rights reserved.
//

#import "CharacterLocationSeeker_TextView.h"

@interface CharacterLocationSeeker_TextView ()
@property (strong, nonatomic) UITextView *textView;
@end

@implementation CharacterLocationSeeker_TextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupBasic];
    }
    return self;
}

- (void)setupBasic
{
    UITextView *textView = [UITextView new];
    textView.scrollEnabled = NO;
    textView.scrollsToTop = NO;
    textView.editable = NO;
    textView.textContainerInset = UIEdgeInsetsZero;
    textView.textContainer.lineFragmentPadding = 0;
    self.textView = textView;
}

- (void)configWithLabel:(UILabel *)label
{
    self.textView.text = label.text;
    self.textView.font = label.font;
    self.textView.textAlignment = label.textAlignment;
    self.textView.textContainer.lineBreakMode = label.lineBreakMode;
    self.textView.bounds = label.bounds;
}

- (CGRect)characterRectAtIndex:(NSUInteger)charIndex
{
    if (charIndex >= self.textView.text.length) {
        NSLog(@"Plz enter a correct number");
        return CGRectZero;
    }
    return [self rectInTextView:self.textView stringRange:NSMakeRange(charIndex, 1)];
}

- (CGRect)rectInTextView:(UITextView *)textView stringRange:(NSRange)stringRange
{
    UITextPosition *begin = [textView positionFromPosition:textView.beginningOfDocument offset:stringRange.location];
    UITextPosition *end = [textView positionFromPosition:begin offset:stringRange.length];
    UITextRange *textRange = [textView textRangeFromPosition:begin toPosition:end];
    return [textView firstRectForRange:textRange];
}

@end
