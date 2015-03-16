//
//  ViewController.m
//  imageViewerUsingScrollView
//
//  Created by Coeus on 02/03/2015.
//  Copyright (c) 2015 Coeus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray * innerScrollViewImages;
@property(nonatomic) NSInteger updatePage;
@property (strong, nonatomic) NSMutableArray * innerScrollViews;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _innerScrollViewImages = [NSMutableArray new];
    _innerScrollViews = [NSMutableArray new];
   
    [self.mainScrollView setScrollEnabled:YES];
    [self.mainScrollView setPagingEnabled:YES];
    [self addImagestoScrollView:10];
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView==_mainScrollView) {
        return nil;
    }
    else {

        for (int i =0; i < _innerScrollViews.count; i++) {

            if(scrollView == _innerScrollViews[i]){
                return _innerScrollViewImages[i];
            }

        }
    }
    return nil;
}

-(void)addImagestoScrollView:(NSInteger)count
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"imageDefault" ofType:@"jpg"];
    UIImage * image = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView * imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.image = image;

    
    CGFloat x = 0;
    
    [_mainScrollView setContentSize:(CGSizeMake(320*count-1, _mainScrollView.frame.size.height))];

  
    for (int i =0; i < count; i++) {
        
        UIScrollView * innerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(x, 0, 320, 320)];
        
        UIImage * image = [[UIImage alloc] initWithContentsOfFile:path];
        UIImageView * imageView =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
        [self.innerScrollViewImages addObject:imageView];
        imageView.image = image;
        
        innerScrollView.delegate = self;
        
        [innerScrollView addSubview:imageView];
        [innerScrollView setMaximumZoomScale:2];

        [_innerScrollViews addObject:innerScrollView];
        [_mainScrollView addSubview:innerScrollView];
        x+=320;
        
    }
    NSLog(@"---------  %d ----------",_mainScrollView.subviews.count);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
