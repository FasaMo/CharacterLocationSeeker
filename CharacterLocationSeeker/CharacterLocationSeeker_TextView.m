//
// CharacterLocationSeeker_TextView.m
// Version 0.0.2 Created on 16/1/05
//
// Copyright (c) 2015 FasaMo ( http://github.com/FasaMo ; http://weibo.com/FasaMo )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
