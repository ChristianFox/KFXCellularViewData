/********************************
 *
 * Copyright © 2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/

#import "KFXCellData.h"
#import "KFXCellData_Private.h"
#import "KFXSectionData.h"

@implementation KFXCellData


//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Initilisers
//--------------------------------------------------------
+(instancetype)cellData{
	return [[self alloc]init];
}

+(instancetype)cellDataWithContents:(id)contents{
	KFXCellData *cellData = [self cellData];
	cellData.contents = contents;
	return cellData;
}

//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------


//======================================================
#pragma mark - ** Primary Public Functionality **
//======================================================
-(NSIndexPath *)indexPath{
	
    if (self.sectionData == nil) {
        return nil;
    }
    NSInteger rowItem = [self.sectionData indexOfCellData:self];
	NSInteger section = [self.sectionData sectionIndex];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowItem inSection:section];
	return indexPath;
}

//--------------------------------------------------------
#pragma mark Accessors
//--------------------------------------------------------
-(NSString *)reuseIdentifier{
    if (!_reuseIdentifier) {
        _reuseIdentifier = self.sectionData.cellReuseIdentifier;
    }
    return _reuseIdentifier;
}

//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
-(NSString *)description{
    NSMutableString  *mutString = [[NSMutableString alloc]initWithString:@"<KFXCellData> "];
    if (self.title) {
        [mutString appendFormat:@"Title: %@; ",self.title];
    }
    if (self.identifier) {
        [mutString appendFormat:@"Identifier: %@; ",self.identifier];
    }
    if (self.reuseIdentifier) {
        [mutString appendFormat:@"ReuseIdentifier: %@; ",self.reuseIdentifier];
    }
    [mutString appendFormat:@"Tag: %ld",(long)self.tag];
    return mutString.copy;
}




//======================================================
#pragma mark - ** Protocol Methods **
//======================================================




//======================================================
#pragma mark - ** Private Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - Lazy Load
//--------------------------------------------------------



@end



















