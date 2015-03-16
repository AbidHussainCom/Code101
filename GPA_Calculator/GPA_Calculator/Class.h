//
//  Class.h
//  GPA_Calculator
//
//  Created by Coeus on 18/02/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"


@interface Classs : NSObject


@property (nonatomic, strong) NSMutableArray * students;

-(instancetype) initWithNumberOfStudents:(NSInteger) n;
-(Student *) topInSubject:(Course *)c;
-(Student *) topInClass;
-(NSNumber*) getStandardDeviation;
-(NSNumber*) getAverage;


@end
