//
//  ZYGLoginModel.h
//  Dese
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 hewenjie. All rights reserved.
//

#import "BaseModel.h"

@interface ZYGUserModel : BaseModel

@property (nonatomic,copy) NSString <Optional> * createTime;
@property (nonatomic,copy) NSString <Optional> * password;
@property (nonatomic,copy) NSString <Optional> * telephone;
@property (nonatomic,copy) NSString <Optional> * usableFlg;
@property (nonatomic,copy) NSString <Optional> * userId;
@property (nonatomic,copy) NSString <Optional> * headPicture;
@property (nonatomic,copy) NSString <Optional> * userName;
@property (nonatomic,copy) NSString <Optional> * sex;
@property (nonatomic,copy) NSString <Optional> * birthday;
@property (nonatomic,copy) NSString <Optional> * autograph;
@property (nonatomic,copy) NSString <Optional> * usertype;
@property (nonatomic,copy) NSString <Optional> * tendency;
@property (nonatomic,copy) NSString <Optional> * city;
@property (nonatomic,copy) NSString <Optional> * cityName;
@property (nonatomic,copy) NSString <Optional> * internationalCode;
@end

@interface ZYGLoginModel : BaseModel

@property (nonatomic,copy) NSString <Optional> * hasTelepone;
@property (nonatomic,copy) NSString <Optional> * hasUserDetail;
@property (nonatomic,copy) NSString <Optional> * isAble;
@property (nonatomic,copy) NSString <Optional> * token;
@property (nonatomic,copy) NSString <Optional> * userLevel;
@property (nonatomic,copy) ZYGUserModel <Optional> * user;

@end
