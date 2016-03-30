//
//  LabelPositionSeeker.m
//  计算某个字符的位置
//
//  Created by Fasa Mo on 16/3/30.
//  Copyright © 2016年 FasaMo. All rights reserved.
//

#import "CharacterLocationSeeker.h"

@interface CharacterLocationSeeker ()
@property (strong, nonatomic) NSTextStorage *textStorage;
@property (strong, nonatomic) NSLayoutManager *layoutManager;
@property (strong, nonatomic) NSTextContainer *textContainer;
@end

@implementation CharacterLocationSeeker

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
    self.textStorage = [NSTextStorage new];
    self.layoutManager = [NSLayoutManager new];
    self.textContainer = [NSTextContainer new];
    [self.textStorage addLayoutManager:self.layoutManager];
    [self.layoutManager addTextContainer:self.textContainer];
}

- (void)configWithLabel:(UILabel *)label
{
    self.textContainer.size = label.bounds.size;
    self.textContainer.lineFragmentPadding = 0;
    self.textContainer.maximumNumberOfLines = label.numberOfLines;
    self.textContainer.lineBreakMode = label.lineBreakMode;
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange textRange = NSMakeRange(0, attributedText.length);
    [attributedText addAttribute:NSFontAttributeName value:label.font range:textRange];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = label.textAlignment;
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:textRange];
    [self.textStorage setAttributedString:attributedText];
}

- (CGRect)characterRectAtIndex:(NSUInteger)charIndex
{
    if (charIndex >= self.textStorage.length) {
        NSLog(@"Plz enter a correct number");
        return CGRectZero;
    }
    NSRange characterRange = NSMakeRange(charIndex, 1);
    NSRange glyphRange = [self.layoutManager glyphRangeForCharacterRange:characterRange actualCharacterRange:nil];
    return [self.layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:self.textContainer];
}

@end
