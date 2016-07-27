//
//  main.m
//  QuickSort
//
//  Created by wzzyinqiang on 16/7/10.
//  Copyright © 2016年 wzzyinqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger partition(NSMutableArray * a, NSInteger p, NSInteger r) {
    NSNumber * x = a[r];
    
    NSInteger i = p - 1;
    
    for (NSInteger j = p; j < r; j++) {
        if ([a[j] floatValue] <= [x floatValue]) {
            i++;
            
            NSNumber * temp_number = a[i];
            
            a[i] = a[j];
            //wzz
            a[j] = temp_number;
        }
    }
    
    NSNumber * temp_number = a[i + 1];
    
    a[i + 1] = a[r];
    
    a[r] = temp_number;
    
    return i + 1;
}

void quick_sort(NSMutableArray * a, NSInteger p, NSInteger r) {
    if (p < r) {
        NSInteger q = partition(a, p, r);
        
        quick_sort(a, p, q - 1);
        
        quick_sort(a, q + 1, r);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray * the_array = [NSMutableArray arrayWithArray:@[@4,@1,@3,@2,@16,@9,@10,@14,@8,@7]];
        
        quick_sort(the_array, 0, the_array.count - 1);
        
        for (NSNumber * number in the_array) {
            NSLog(@"%li",(long)[number integerValue]);
        }
    }
    return 0;
}
