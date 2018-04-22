


```
//用pod导入库
pod 'Masonry'
```


>    *  //新增约束
>   -(NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;



>   *  //更新约束
>   -(NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
 
 
 
 >   *  //清除之前的所有约束,从新添加最新的约束
 >   -(NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;





