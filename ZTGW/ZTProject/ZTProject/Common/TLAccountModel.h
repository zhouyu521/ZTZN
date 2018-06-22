//
//  TLAccountModel.h
//  TLYL
//
//  Created by mac_zhou on 2018/3/5.
//  Copyright © 2018年 mac_zhou. All rights reserved.
//

#import "BaseModel.h"


@interface TLUserModel : BaseModel

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

@interface TLAccountModel : BaseModel

@property (nonatomic,copy) NSString <Optional> * hasTelepone;
@property (nonatomic,copy) NSString <Optional> * hasUserDetail;
@property (nonatomic,copy) NSString <Optional> * isAble;
@property (nonatomic,copy) NSString <Optional> * token;
@property (nonatomic,copy) NSString <Optional> * userLevel;
@property (nonatomic,copy) TLUserModel <Optional> * user;

@end


