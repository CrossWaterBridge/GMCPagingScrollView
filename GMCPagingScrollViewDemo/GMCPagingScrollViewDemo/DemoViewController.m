// DemoViewController.m
//
// Copyright (c) 2013 Hilton Campbell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DemoViewController.h"
#import "GMCPagingScrollView.h"

static NSString * const kPageIdentifier = @"Page";

@interface DemoViewController () <GMCPagingScrollViewDataSource>

@property (nonatomic, strong) GMCPagingScrollView *pagingScrollView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pagingScrollView = [[GMCPagingScrollView alloc] initWithFrame:self.view.bounds];
    self.pagingScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pagingScrollView.dataSource = self;
    self.pagingScrollView.infiniteScroll = YES;
    self.pagingScrollView.interpageSpacing = 0;
    [self.view addSubview:self.pagingScrollView];
    
    [self.pagingScrollView registerClass:[UIView class] forReuseIdentifier:kPageIdentifier];
    
    [self.pagingScrollView reloadData];
}

#pragma mark - GMCPagingScrollViewDataSource

- (NSUInteger)numberOfPagesInPagingScrollView:(GMCPagingScrollView *)pagingScrollView {
    return 3;
}

- (UIView *)pagingScrollView:(GMCPagingScrollView *)pagingScrollView pageForIndex:(NSUInteger)index {
    UIView *page = [pagingScrollView dequeueReusablePageWithIdentifier:kPageIdentifier];
    
    switch (index) {
        case 0:
            page.backgroundColor = [UIColor redColor];
            break;
        case 1:
            page.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            page.backgroundColor = [UIColor blueColor];
            break;
    }
    
    return page;
}

@end
