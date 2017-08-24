//
//  cFunc.c
//  Tips21 -UnsafePointer和C指针内存管理
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 lirui. All rights reserved.
//

#include "cFunc.h"

int cFunction(int (callback)(int x, int y)) {
    return callback(1, 2);
}
