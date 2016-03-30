//
// CharacterLocationSeeker_TextView.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// CharacterLocationSeeker_TextView is a tool to figure out the rect of a character in UILabel, with the given character index. It uses a textView to do this
/// Usage:
///     1. Create an instance of CharacterLocationSeeker_TextView
///     2. Config it with the label
///     3. Get the rect with a certain character index

@interface CharacterLocationSeeker_TextView : NSObject

- (void)configWithLabel:(UILabel *)label;

- (CGRect)characterRectAtIndex:(NSUInteger)charIndex;

@end
