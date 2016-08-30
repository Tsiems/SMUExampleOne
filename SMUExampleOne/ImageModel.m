//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()

@property (strong,nonatomic) NSArray* imageNames;
@property (strong,nonatomic) NSArray* images;

-(UIImage*)getImageWithName:(NSString*)name;

@end



@implementation ImageModel
@synthesize imageNames = _imageNames;

-(NSArray*)imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3",@"stark",@"lannister",@"arrestedwesteros"];
    
    return _imageNames;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}

-(NSArray*)getImage:(NSInteger *)index{
    UIImage* image = nil;
    image = [self getImages][(int) index];
    
    NSString* name = nil;
    name = [self getImageNames][(int) index];
    return @[image,name];
}

-(NSArray*)getImageNames {
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3",@"stark",@"lannister",@"arrestedwesteros"];
    
    return _imageNames;
}

-(NSArray*)getImages {
    if(!_images) {
        NSArray* imageNames = [self getImageNames];
        NSMutableArray *tempImages = [NSMutableArray new];
        for (NSString* name in imageNames) {
            [tempImages addObject:[self getImageWithName:name]];
        }
        _images = [tempImages copy];
    }
    
    return _images;
}

-(NSInteger*)getImageCount {
    NSArray *array = [self getImages];
    return (NSInteger*)[array count];
}



@end
