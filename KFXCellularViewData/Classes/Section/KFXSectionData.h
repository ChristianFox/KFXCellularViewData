/********************************
 *
 * Copyright © 2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/



#import <Foundation/Foundation.h>
@class KFXCellData, KFXCellularViewData;

@interface KFXSectionData : NSObject

@property (strong,nonatomic) NSMutableArray<KFXCellData*> *cells;
@property (copy,nonatomic) NSString *titleForHeader;
@property (copy,nonatomic) NSString *titleForFooter;
@property (copy,nonatomic) NSString *identifier;
@property (nonatomic) NSInteger tag;
@property (copy,nonatomic) NSString *cellReuseIdentifier;
// parent reference
@property (weak,nonatomic,readonly) __kindof KFXCellularViewData *cellularViewData;


//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
+(instancetype)sectionData;

//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
-(void)addCellData:(KFXCellData*)cellData;
-(void)addCellDataFromArray:(NSArray<KFXCellData*>*)cellData;
-(void)insertCellData:(KFXCellData*)cellData atIndex:(NSUInteger)index;
-(void)deleteCellData:(KFXCellData*)cellData;
-(void)deleteCellDataAtIndex:(NSUInteger)index;

//--------------------------------------------------------
#pragma mark CellData Getters
//--------------------------------------------------------
-(KFXCellData*)cellForTag:(NSInteger)tag;
-(KFXCellData*)cellForIdentifier:(NSString*)identifier;
-(KFXCellData*)cellForIndex:(NSUInteger)index;

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
-(NSUInteger)count;
-(NSUInteger)sectionIndex;
-(NSUInteger)indexOfCellData:(KFXCellData*)cellData;


@end
