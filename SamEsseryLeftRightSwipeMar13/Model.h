//
//  Model.h
//  SamEsseryLeftRightSwipeMar13
//
//  Created by Sam Essery on 2015-03-13.
//  Copyright (c) 2015 Sam Essery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseClass.h"

@interface Model : NSObject

@property int SelectionCourse1;
@property int SelectionCourse2;
@property int SelectionCourse3;
@property int SelectionCourse4;
@property int SelectionCourse5;
@property int SelectionCourse6;
@property int SelectionCourse7;
@property int SelectionCourse8;
@property int SelectionCourse9;
@property int SelectionCourse10; 


@property CourseClass *class1;
@property CourseClass *class2;
@property CourseClass *class3;
@property CourseClass *class4;
@property CourseClass *class5;
@property CourseClass *class6;
@property CourseClass *class7;
@property CourseClass *class8;
@property CourseClass *class9;
@property CourseClass *class10;

@property CourseClass *courseStorage;

@property (strong, nonatomic) NSMutableArray *courseArray;


@end
