//
//  Course.h
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSNumber * GPA;
@property (nonatomic)         NSInteger  creditHours;

- (instancetype) initWithObjects:(NSString*)name gpa:(NSNumber*)G creditHours:(NSInteger)ch;
- (NSNumber *) getGPA:(NSString *)n;
- (NSNumber *) getGPA;
@end
