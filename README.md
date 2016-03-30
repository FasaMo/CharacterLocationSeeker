# CharacterLocationSeeker
Figure out the rect of a character in UILabel, with the given character index.
There is another way to do the same thing with a UITextView, you can check the demo.

[相关blog](http://www.jianshu.com/p/c26893bd0f48)
# Installation
`pod 'CharacterLocationSeeker', '~> 0.0.3'`

or `pod search CharacterLocationSeeker` to check

# Usage
  1. Create an instance of CharacterLocationSeeker
 
  `self.locationSeeker = [CharacterLocationSeeker new];`
  2. Config it with the label

  `[self.locationSeeker configWithLabel:self.label];`
  3. Get the rect with a certain character index
  
  `CGRect charRect = [self.locationSeeker characterRectAtIndex:someIndex];` 
