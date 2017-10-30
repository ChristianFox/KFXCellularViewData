/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/

#import <UIKit/UIKit.h>

@interface KFXCollectionReusableView : UICollectionReusableView

+(UINib*)nib;
+(NSString*)reuseIdentifier;
+(NSBundle*)bundle;

@end
