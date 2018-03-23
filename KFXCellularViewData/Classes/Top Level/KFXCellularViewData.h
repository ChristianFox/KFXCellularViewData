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
#import <KFXCellularViewData/KFXSectionData.h>
#import <KFXCellularViewData/KFXCellData.h>

@class KFXCellularViewData;
@protocol KFXCellularViewDataDelegate <NSObject>

@optional
/// Called when sections are added
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
   didInsertSections:(NSArray<KFXSectionData*>*)sectionDatas
           atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when sections are removed
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
   didDeleteSections:(NSArray<KFXSectionData*>*)sectionDatas
           atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when SectionData is updated
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
   didUpdateSections:(NSArray<KFXSectionData*>*)sectionDatas
           atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when cells are added
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
      didInsertCells:(NSArray<KFXCellData*>*)cellDatas
        atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths;

/// Called when a cellData is removed
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
      didDeleteCells:(NSArray<KFXCellData*>*)cellDatas
         atIndexPaths:(NSArray<NSIndexPath*>*)indexPath;

/// Called when CellData is updated
-(void)cellularViewData:(KFXCellularViewData*)cellularViewData
      didUpdateCells:(NSArray<KFXCellData*>*)cellDatas
         atIndexPaths:(NSArray<NSIndexPath*>*)indexPath;
@end


@interface KFXCellularViewData : NSObject

// Delegate
@property (weak, nonatomic) id<KFXCellularViewDataDelegate> delegate;
// Data
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
//-----------------------------------
// Add Sections
//-----------------------------------
/// Add a single KFXSectionData
-(void)addSection:(__kindof KFXSectionData*)section;
/// Add multiple KFXSectionDatas
-(void)addSections:(NSArray<__kindof KFXSectionData*>*)sections;
//-----------------------------------
// Insert Sections
//-----------------------------------
/// Insert a KFXSectionData at the index
-(void)insertSection:(__kindof KFXSectionData*)section
             atIndex:(NSUInteger)index;
/// Insert multiple KFXSectionDatas starting at the given index
-(void)insertSections:(NSArray<__kindof KFXSectionData*>*)sections
              atIndex:(NSUInteger)index;
//-----------------------------------
// Delete Sections
//-----------------------------------
/// Delete the KFXSectionData if it exists in the receiver's sections
-(void)deleteSection:(__kindof KFXSectionData*)sectionData;
/// Delete the KFXSectionData at the given index
-(void)deleteSectionAtIndex:(NSUInteger)index;
/// Delete all the sections if they exist in the receiver's sections. Will throw exception if any of the sections do not exist in the receiver's sections.
-(void)deleteSections:(NSArray<__kindof KFXSectionData*>*)sections;


//--------------------------------------------------------
#pragma mark CellData Setters
//--------------------------------------------------------
//-----------------------------------
// Add Cells
//-----------------------------------
/// Add KFXCellData to the KFXSectionData at the given index
-(void)addCellData:(KFXCellData*)cell
  toSectionAtIndex:(NSUInteger)sectionIndex;
/// Add KFXCellDatas from an array to the KFXSectionData at the given index
-(void)addCellDatas:(NSArray<KFXCellData*>*)cellDatas toSectionAtIndex:(NSUInteger)sectionIndex;
//-----------------------------------
// Insert Cells
//-----------------------------------
/// Insert KFXCellData at IndexPath
-(void)insertCellData:(KFXCellData*)cell
          atIndexPath:(NSIndexPath*)indexPath;
/// Insert KFXCellDatas at IndexPaths
-(void)insertCellDatas:(NSArray<KFXCellData*>*)cells
          atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths;
//-----------------------------------
// Delete Cells
//-----------------------------------
/// Delete the KFXCellData
-(void)deleteCellData:(KFXCellData*)cellData;
/// Delete the KFXCellData at the index path
-(void)deleteCellDataAtIndexPath:(NSIndexPath*)indexPath;

//--------------------------------------------------------
#pragma mark SectionData Getters
//--------------------------------------------------------
/// Return the KFXSectionData for the given tag
-(__kindof KFXSectionData*)sectionForTag:(NSInteger)tag;

/// Return the KFXSectionData for the given identifier
-(__kindof KFXSectionData*)sectionForIdentifier:(NSString*)identifier;

/// Return the KFXSectionData for the given index
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
//-----------------------------------
// Counts
//-----------------------------------
/// The number of sections
-(NSUInteger)count;

/// The number of cells in the section at the index
-(NSUInteger)countForSectionAtIndex:(NSUInteger)index;

//-----------------------------------
// Indexs of Sections
//-----------------------------------
/// The index of the section data in the recevier's sections array
-(NSUInteger)indexOfSectionData:(__kindof KFXSectionData*)sectionData;
/// Returns an array of NSIndexSets for the sections in the receiver. The returned array may have less indexSets than sections because the indexSets may be ranges. They will also be ordered.
-(NSArray<NSIndexSet*>*)orderedIndexSetsForSections:(NSArray<__kindof KFXSectionData*>*)sections;
/// Returns an array of NSNumbers where each number is the index of the equivilantly placed section
-(NSArray<NSNumber*>*)indexesForSections:(NSArray<__kindof KFXSectionData*>*)sections;

//-----------------------------------
// Index Paths of cells
//-----------------------------------
/// Returns the indexPath of the given cellData
-(NSIndexPath*)indexPathOfCellData:(KFXCellData*)cellData;
/// Returns an array of NSIndexPath for the cells in the receiver. They will also be ordered.
-(NSArray<NSIndexPath*>*)orderedIndexPathsForCells:(NSArray<KFXCellData*>*)cells;
/// Returns an array of NSIndexPath for the cells in the receiver.
-(NSArray<NSIndexPath*>*)indexPathsForCells:(NSArray<KFXCellData*>*)cells;





@end























