//
//  ViewController.m
//  RunTime
//
//  Created by haodai on 15/12/22.
//  Copyright (c) 2015年 zhouyong. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewDelegate.h"
#import "MultipleDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController
{
    MultipleDelegate *_multipleDelegate;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(300, 800);
    
    _multipleDelegate = [MultipleDelegate new];
    _multipleDelegate.allDelegate = @[self,[ScrollViewDelegate new]];
    self.scrollView.delegate = (id<UIScrollViewDelegate>)_multipleDelegate;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"2");
}


@end
