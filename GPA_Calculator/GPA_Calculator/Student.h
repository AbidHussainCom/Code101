//
//  Student.h
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface Student : NSObject

@property (nonatomic) NSInteger roll;

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSArray  * courses;

- (instancetype)initWithObjects:(NSString *)name roll:(NSInteger) r;
- (NSNumber * ) getMarksofCourse:(Course *)c;
- (NSNumber * ) getGPAofStudent;
- (void) showDetails;
@end
