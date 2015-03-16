//
//  Course.m
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "Course.h"

@implementation Course

- (instancetype)initWithObjects:(NSString *)name gpa:(NSNumber *)G creditHours:(NSInteger)ch
{
    self = [super init];
    if (self) {
        self.name = name;
        self.GPA = G;
        self.creditHours = ch;
    }
    return self;
}


- (NSNumber *) getGPA:(NSString *)n
{
    if([self.name compare:n] == 0)
        return self.GPA;
    else
        return @(-1);
}

- (NSNumber *) getGPA
{
    return self.GPA;
}

@end
