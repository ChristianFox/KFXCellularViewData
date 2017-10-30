

@import Foundation;
#import <KFXCellularViewData/KFXCollectionViewData.h>

@class KFXDynamicCollectionViewData;
@protocol KFXDynamicCollectionViewDataDelegate <NSObject>
@optional
/// Called when a sectionData in added
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
               didAddSectionData:(KFXSectionData*)sectionData atIndex:(NSUInteger)index;

/// Called when multiple sections are added
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
                  didAddSections:(NSArray<KFXSectionData*>*)sectionDatas atIndexes:(NSIndexSet*)indexSet;

/// Called when a sectionData is removed
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
       didDeleteSectionData:(KFXSectionData*)sectionData atIndex:(NSUInteger)index;

/// Called when SectionData is updated
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
       didUpdateSectionData:(KFXSectionData*)sectionData atIndex:(NSUInteger)index;

/// Called when a cellData is added
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
             didAddCellData:(KFXCellData*)cellData atIndexPath:(NSIndexPath*)indexPath;

/// Called when multiple cells are added
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
            didAddCellDatas:(NSArray<KFXCellData*>*)cellDatas atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths;

/// Called when a cellData is removed
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
          didDeleteCellData:(KFXCellData*)cellData atIndexPath:(NSIndexPath*)indexPath;

/// Called when CellData is updated
-(void)dynamicCollectionViewData:(KFXDynamicCollectionViewData*)collectionViewData
          didUpdateCellData:(KFXCellData*)cellData atIndexPath:(NSIndexPath*)indexPath;
@end


@interface KFXDynamicCollectionViewData : KFXCollectionViewData

// delegate
@property (weak, nonatomic) id<KFXDynamicCollectionViewDataDelegate> delegate;

@end
