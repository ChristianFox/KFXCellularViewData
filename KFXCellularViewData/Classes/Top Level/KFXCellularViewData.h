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
#import <KFXCellularViewData/KFXSectionData.h>
#import <KFXCellularViewData/KFXCellData.h>


@interface KFXCellularViewData : NSObject

@property (strong,nonatomic) NSMutableArray<__kindof KFXSectionData*> *sections;
@property (copy,nonatomic) NSString *identifier;
@property (nonatomic) NSInteger tag;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *cellReuseIdentifier;


//--------------------------------------------------------
#pragma mark Initilisers
//--------------------------------------------------------
+(instancetype)cellularViewData;

//--------------------------------------------------------
#pragma mark SectionData Setters
//--------------------------------------------------------
/// Add a single KFXSectionData
-(void)addSection:(__kindof KFXSectionData*)section;
/// Add multiple KFXSectionDatas
-(void)addSections:(NSArray<__kindof KFXSectionData*>*)sections;
/// Insert a KFXSectionData at the index
-(void)insertSection:(__kindof KFXSectionData*)section
             atIndex:(NSUInteger)index;
/// Insert multiple KFXSectionDatas starting at the given index
-(void)insertSections:(NSArray<__kindof KFXSectionData*>*)sections
              atIndex:(NSUInteger)index;
/// Delete the KFXSectionData if it exists in the receiver's sections
-(void)deleteSection:(__kindof KFXSectionData*)sectionData;
/// Delete the KFXSectionData at the given index
-(void)deleteSectionAtIndex:(NSUInteger)index;
/// Delete all the sections if they exist in the receiver's sections. Will throw exception if any of the sections do not exist in the receiver's sections.
-(void)deleteSections:(NSArray<__kindof KFXSectionData*>*)sections;


//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
/// Add KFXCellData to the KFXSectionData at the given index
-(void)addCellData:(KFXCellData*)cell
  toSectionAtIndex:(NSUInteger)sectionIndex;
/// Add KFXCellDatas from an array to the KFXSectionData at the given index
-(void)addCellDatas:(NSArray<KFXCellData*>*)cellDatas toSectionAtIndex:(NSUInteger)sectionIndex;
/// Insert KFXCellData at IndexPath
-(void)insertCellData:(KFXCellData*)cell
          atIndexPath:(NSIndexPath*)indexPath;
/// Insert KFXCellDatas at IndexPaths
-(void)insertCellDatas:(NSArray<KFXCellData*>*)cells
          atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths;
/// Delete the KFXCellData at the index path
-(void)deleteCellDataAtIndexPath:(NSIndexPath*)indexPath;
/// Delete the KFXCellData
-(void)deleteCellData:(KFXCellData*)cellData;

//--------------------------------------------------------
#pragma mark SectionData Getters
//--------------------------------------------------------
-(__kindof KFXSectionData*)sectionForTag:(NSInteger)tag;
-(__kindof KFXSectionData*)sectionForIdentifier:(NSString*)identifier;
-(__kindof KFXSectionData*)sectionForIndex:(NSUInteger)index;

//--------------------------------------------------------
#pragma mark CellData Getters
//--------------------------------------------------------
-(KFXCellData*)cellForTag:(NSInteger)tag;
-(KFXCellData*)cellForIdentifier:(NSString*)identifier;
-(KFXCellData*)cellForIndexPath:(NSIndexPath*)indexPath;

//--------------------------------------------------------
#pragma mark Queries
//--------------------------------------------------------
-(NSUInteger)count;
-(NSUInteger)countForSectionAtIndex:(NSUInteger)index;
-(NSUInteger)indexOfSectionData:(__kindof KFXSectionData*)sectionData;
-(NSIndexPath*)indexPathOfCellData:(KFXCellData*)cellData;
-(NSArray<NSIndexSet*>*)orderedIndexSetsForSections:(NSArray<__kindof KFXSectionData*>*)sections;
-(NSArray<NSNumber*>*)indexesForSections:(NSArray<__kindof KFXSectionData*>*)sections;
-(NSArray<NSIndexPath*>*)orderedIndexPathsForCells:(NSArray<KFXCellData*>*)cells;
-(NSArray<NSIndexPath*>*)indexPathsForCells:(NSArray<KFXCellData*>*)cells;







@end























