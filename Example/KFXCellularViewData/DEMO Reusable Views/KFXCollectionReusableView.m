

#import "KFXCollectionReusableView.h"

@implementation KFXCollectionReusableView

+(UINib *)nib{
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:[NSBundle mainBundle]];
    return nib;
}

+(NSString *)reuseIdentifier{
    return NSStringFromClass([self class]);
}

@end
