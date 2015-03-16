//
//  Class.m
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "Class.h"

@implementation Classs

- (id)initWithNumberOfStudents:(NSInteger)n
{
    self = [super init];
    if (self) {
        
        self.students = [[NSMutableArray alloc]initWithCapacity:n];
        
        for (NSInteger i = 0; i < n; i++)
        {
            Student* std = [[Student alloc]initWithObjects:[NSString stringWithFormat:@"Student %d",i] roll:i];
            [self.students addObject:std];
        }
        
    }
    return self;
}



-(Student *) topInSubject:(Course *)c
{
    NSNumber * num = [self.students[0] getMarksofCourse:c];
    
    if(num.doubleValue == -1)
    {
        NSLog(@"This course does not exist! :P");
        return nil;
    }

    
    Student * std = self.students[0];
    for(NSInteger i =1; i < self.students.count;i++)
    {
        NSNumber * val = [self.students[i] getMarksofCourse:c];
        if(val.doubleValue != -1 && val.doubleValue > num.doubleValue)
        {
            num = val;
            std = self.students[i];
        }
    }
    
    return std;
}



-(Student *) topInClass
{
    NSNumber* max = [self.students[0] getGPAofStudent];
    Student* std = self.students[0];
    for (NSInteger i =0; i < self.students.count; i++) {
        if([self.students[i] getGPAofStudent].doubleValue > max.doubleValue)
        {
            max = [self.students[i] getGPAofStudent];
            std = self.students[i];
        }
    }
    
    return std;
}



-(NSNumber*) getStandardDeviation
{
    NSNumber * sd = @(0);
    NSNumber * mean = [self getAverage];
    
    NSNumber * sum = @(0);
    
    for (int i =0;  i<self.students.count; i++) {
        NSNumber* _add = @([self.students[i] getGPAofStudent].doubleValue - mean.doubleValue);
        sum = @(sum.doubleValue + pow(_add.doubleValue, 2));
    }
    
    sd = @(sum.doubleValue / self.students.count);
    
    sd = @(sqrt(sd.doubleValue));
    
    return sd;
}
-(NSNumber*) getAverage
{
    NSNumber * mean = @(0);
    
    for (int i =0; i < self.students.count; i++) {
        mean = @(mean.doubleValue + [self.students[i] getGPAofStudent].doubleValue);
    }
    
    mean = @(mean.doubleValue/self.students.count);
    
    return mean;
}




@end
