


#import "KFXDynamicTableViewData.h"

@implementation KFXDynamicTableViewData



//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark KFXCellularViewData
//--------------------------------------------------------
//-------------
#pragma mark SectionData Setters
//-------------
-(void)addSection:(KFXSectionData*)section{
    [super addSection:section];
    if ([self.delegate respondsToSelector:@selector(dynamicTableViewData:didInsertSections:atIndexes:)]) {
        [self.delegate dynamicTableViewData:self
                             didInsertSections:@[section]
                                  atIndexes:@[[NSIndexSet indexSetWithIndex:self.count-1]]];
    }
}

-(void)addSections:(NSArray<KFXSectionData*>*)sections{
    [super addSections:sections];
    if ([self.delegate respondsToSelector:@selector(dynamicTableViewData:didInsertSections:atIndexes:)]) {
        [self.delegate dynamicTableViewData:self
                             didInsertSections:sections
                                  atIndexes:@[[NSIndexSet indexSetWithIndex:self.count-1]]];
    }
}

-(void)insertSection:(KFXSectionData*)section
             atIndex:(NSUInteger)index{
    [super insertSection:section
                 atIndex:index];
    if ([self.delegate respondsToSelector:@selector(dynamicTableViewData:didInsertSections:atIndexes:)]) {
        [self.delegate dynamicTableViewData:self
                             didInsertSections:@[section]
                                  atIndexes:@[[NSIndexSet indexSetWithIndex:index]]];
    }
}



-(void)deleteSectionAtIndex:(NSUInteger)index{
    
    KFXSectionData *section = [self sectionForIndex:index];
    [super deleteSectionAtIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(dynamicTableViewData:didDeleteSections:atIndexes:)]) {
        [self.delegate dynamicTableViewData:self
                          didDeleteSections:@[section]
                                  atIndexes:@[[NSIndexSet indexSetWithIndex:index]]];
    }
}

-(void)deleteSections:(NSArray<KFXSectionData *> *)sections{
    
    NSArray<NSIndexSet*> *indexes = [self orderedIndexSetsForSections:sections];
    [super deleteSections:sections];
    
    if ([self.delegate respondsToSelector:@selector(dynamicTableViewData:didDeleteSections:atIndexes:)]) {
        [self.delegate dynamicTableViewData:self
                          didDeleteSections:sections
                                  atIndexes:indexes];
    }
}

//-------------
#pragma mark CellData Setters
//-------------
-(void)addCell:(KFXCellData*)cell toSectionAtIndex:(NSUInteger)sectionIndex{
    [super addCellData:cell toSectionAtIndex:sectionIndex];
}

-(void)insertCell:(KFXCellData*)cell atIndexPath:(NSIndexPath*)indexPath{
    [super insertCellData:cell atIndexPath:indexPath];
}

-(void)addCellDatas:(NSArray<KFXCellData*>*)cellDatas toSectionAtIndex:(NSUInteger)sectionIndex{
    [super addCellDatas:cellDatas toSectionAtIndex:sectionIndex];
}

-(void)deleteCellAtIndexPath:(NSIndexPath*)indexPath{
    [super deleteCellDataAtIndexPath:indexPath];
}





@end
