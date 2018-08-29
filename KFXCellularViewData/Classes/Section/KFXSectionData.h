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
@class KFXCellData, KFXCellularViewData;

@interface KFXSectionData : NSObject

// Data
@property (strong,nonatomic) NSMutableArray<KFXCellData*> *cells;
@property (copy,nonatomic) NSString *titleForHeader;
@property (copy,nonatomic) NSString *titleForFooter;
@property (copy,nonatomic) NSString *identifier;
@property (nonatomic) NSInteger tag;
@property (copy,nonatomic) NSString *cellReuseIdentifier;
@property (strong,nonatomic) id extraInfo;
// parent reference
@property (weak,nonatomic,readonly) __kindof KFXCellularViewData *cellularViewData;


//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
+(instancetype)sectionData;

//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
/// Add the cell
-(void)addCellData:(KFXCellData*)cellData;

/// Add the cells from the array to the section cells array
-(void)addCellDataFromArray:(NSArray<KFXCellData*>*)cellData;

/// Insert the cell at the given index
-(void)insertCellData:(KFXCellData*)cellData atIndex:(NSUInteger)index;

/// Delete the cell
-(void)deleteCellData:(KFXCellData*)cellData;

/// Delete the cell at the index
-(void)deleteCellDataAtIndex:(NSUInteger)index;

//--------------------------------------------------------
#pragma mark CellData Getters
//--------------------------------------------------------
/// Return the KFXCellData for the given tag
-(KFXCellData*)cellForTag:(NSInteger)tag;

/// Return the KFXCellData for the given identifier
-(KFXCellData*)cellForIdentifier:(NSString*)identifier;

/// Return the KFXCellData for the given index
-(KFXCellData*)cellForIndex:(NSUInteger)index;

/// Get the content properties from all of this section's cells
-(NSArray<id>*)allContents;

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
/// The number of cells in this section
-(NSUInteger)count;

/// The index of this section in it's parent
-(NSUInteger)sectionIndex;

/// The index of the cellData in this section's cells
-(NSUInteger)indexOfCellData:(KFXCellData*)cellData;







@end
