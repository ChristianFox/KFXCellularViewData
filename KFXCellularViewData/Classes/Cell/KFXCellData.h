/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/

#import <Foundation/Foundation.h>
@class KFXSectionData;

@interface KFXCellData : NSObject

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *identifier;
@property (copy,nonatomic) NSString *reuseIdentifier;
@property (nonatomic) NSInteger tag;
@property (strong,nonatomic) id contents;
// parent reference
@property (weak,nonatomic,readonly) __kindof KFXSectionData *sectionData;

//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
/// Initiliser a instance of KFXCellData
+(instancetype)cellData;

/// Initiliser a instance of KFXCellData with the contents
+(instancetype)cellDataWithContents:(id)contents;

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
/// Return the NSIndexPath of the receiver in it's parent system
-(NSIndexPath*)indexPath;

@end
