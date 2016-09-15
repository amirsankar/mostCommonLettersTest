//
//  main.m
//  commonLetterTest
//
//  Created by amir sankar on 9/15/16.
//  Copyright © 2016 amir sankar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSArray *charArray = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
        
        
        
        NSString *txtFileContents = [NSString stringWithContentsOfFile:@"/Users/amirsankar/Documents/Breakfast.txt"];
        
        
        
        // NSLog(@"path is %@",txtFileContents);
        
        
        
        NSMutableDictionary *countDictionary = [[NSMutableDictionary alloc]init];
        
        
        
        for (NSString *letter in charArray) {
            
            long letterCount = [[txtFileContents componentsSeparatedByString:letter]count]-1;
            
            NSString *upperLetter = [letter uppercaseString];
            
            long upperLetterCount = [[txtFileContents componentsSeparatedByString:upperLetter]count]-1;
            
            long finalCount = letterCount + upperLetterCount;
            
            [countDictionary setValue:[NSNumber numberWithLong:finalCount]forKey:letter];
            
        }
        
        NSLog(@"%@", countDictionary);
        
        
        
        NSArray *orderedKeys = [countDictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2){
            
            return [obj2 compare: obj1];
            
        }];
        
        NSLog(@"%@", orderedKeys);
        
        
        
        NSLog(@"Top 5 letters that appears most often are: \n 1. %@: %@ \n 2. %@: %@ \n 3. %@: %@ \n 4. %@: %@ \n 5. %@: %@ \n\n", orderedKeys[0], [countDictionary valueForKey:orderedKeys[0]], orderedKeys[1], [countDictionary valueForKey:orderedKeys[1]], orderedKeys[2], [countDictionary valueForKey:orderedKeys[2]], orderedKeys[3], [countDictionary valueForKey:orderedKeys[3]], orderedKeys[4], [countDictionary valueForKey:orderedKeys[4]]);
        
        
    }
    return 0;
}
