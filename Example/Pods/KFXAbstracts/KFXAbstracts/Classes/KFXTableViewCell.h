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

@interface KFXTableViewCell : UITableViewCell

@property (nonatomic) CGFloat borderWidth;
@property (strong,nonatomic) UIColor *borderColour;

//
@property (weak,nonatomic) id cellData;
@property (weak,nonatomic) id identifier;




+(UINib*)nib;
+(NSString*)reuseIdentifier;
+(NSBundle*)bundle;

-(void)addBorder;

@end
