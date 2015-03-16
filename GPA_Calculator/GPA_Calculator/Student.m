//
//  Student.m
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)initWithObjects:(NSString *)name roll:(NSInteger) r
{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.roll = r;
        
        NSNumber * a = [[NSNumber alloc]initWithDouble:((arc4random_uniform(4))+1.0/rand())];
        NSNumber * b = [[NSNumber alloc]initWithDouble:((arc4random_uniform(4))+1.0/rand())];
        NSNumber * c = [[NSNumber alloc]initWithDouble:((arc4random_uniform(4))+1.0/rand())];
        NSNumber * d = [[NSNumber alloc]initWithDouble:((arc4random_uniform(4))+1.0/rand())];
        NSNumber * e = [[NSNumber alloc]initWithDouble:((arc4random_uniform(4))+1.0/rand())];
        
        
        Course * c1 = [[Course alloc]initWithObjects:@"C++"  gpa:a creditHours:3];
        Course * c2 = [[Course alloc]initWithObjects:@"Java" gpa:b creditHours:3];
        Course * c3 = [[Course alloc]initWithObjects:@"OOP"  gpa:c creditHours:3];
        Course * c4 = [[Course alloc]initWithObjects:@"DSA"  gpa:d creditHours:3];
        Course * c5 = [[Course alloc]initWithObjects:@"TOA"  gpa:e creditHours:3];
        
        
        self.courses = [[NSArray alloc]initWithObjects:c1,c2,c3,c4,c5, nil];
        
    }
    return self;
}

- (NSNumber * ) getMarksofCourse:(Course *)c
{
    for(NSInteger i =0; i < self.courses.count;i++)
    {
        NSInteger val = [self.courses[i] getGPA:c.name].integerValue;
        if(val != -1)
        {
            return @(val);
        }
    }
    return @(-1);
}



- (NSNumber * ) getGPAofStudent
{
    double x = 0;
    for(NSInteger i =0; i < self.courses.count;i++)
    {
        double d = [self.courses[i] getGPA].doubleValue * 3;
        x+=d;
    }
    x = x / (3*self.courses.count);
    return [NSNumber numberWithDouble:x];
}


- (void) showDetails
{
    NSLog(@"name:%@ roll:%d GPA:%@",self.name,self.roll,[self getGPAofStudent]);
}



@end
