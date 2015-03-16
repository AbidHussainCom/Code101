//
//  ViewController.h
//  imageViewerUsingScrollView
//
//  Created by Coeus on 02/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@end
