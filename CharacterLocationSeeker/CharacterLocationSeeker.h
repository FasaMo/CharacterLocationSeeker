//
//  LabelCharacterPositionSeeker.h
//  计算某个字符的位置
//
//  Created by Fasa Mo on 16/3/30.
//  Copyright © 2016年 FasaMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CharacterLocationSeeker : NSObject
- (void)configWithLabel:(UILabel *)label;
- (CGRect)characterRectAtIndex:(NSUInteger)charIndex;
@end
