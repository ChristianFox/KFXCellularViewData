

#import <KFXCellularViewData/KFXTableViewData.h>

@class KFXDynamicTableViewData;
@protocol KFXDynamicTableViewDataDelegate <NSObject>
@optional
/// Called when sections are added
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
          didInsertSections:(NSArray<KFXSectionData*>*)sectionDatas
                  atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when sections are removed
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
          didDeleteSections:(NSArray<KFXSectionData*>*)sectionDatas
                  atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when SectionData is updated
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
          didUpdateSections:(NSArray<KFXSectionData*>*)sectionDatas
                  atIndexes:(NSArray<NSIndexSet*>*)indexSets;

/// Called when cells are added
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
             didInsertCells:(NSArray<KFXCellData*>*)cellDatas
               atIndexPaths:(NSArray<NSIndexPath*>*)indexPaths;

/// Called when a cellData is removed
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
             didDeleteCells:(NSArray<KFXCellData*>*)cellDatas
                atIndexPath:(NSIndexPath*)indexPath;

/// Called when CellData is updated
-(void)dynamicTableViewData:(KFXDynamicTableViewData*)tableViewData
             didUpdateCells:(NSArray<KFXCellData*>*)cellDatas
                atIndexPath:(NSIndexPath*)indexPath;
@end

@interface KFXDynamicTableViewData : KFXTableViewData

// delegate
@property (weak, nonatomic) id<KFXDynamicTableViewDataDelegate> delegate;

@end
