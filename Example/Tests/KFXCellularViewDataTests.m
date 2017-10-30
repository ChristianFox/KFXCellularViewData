


#import <XCTest/XCTest.h>
// SUT
#import <KFXCellularViewData/KFXCellularViewData.h>

@interface KFXCellularViewDataTests : XCTestCase
@property (strong,nonatomic) KFXCellularViewData *sut;
@end

@implementation KFXCellularViewDataTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [[KFXCellularViewData alloc] init];
}

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

//======================================================
#pragma mark - ** Initilisation Tests **
//======================================================
-(void)testSUT{
    XCTAssertNotNil(self.sut);
}

-(void)testCellularViewDataInitiliser{
    KFXCellularViewData *cellularData = [KFXCellularViewData cellularViewData];
    XCTAssertNotNil(cellularData);
    XCTAssertNotNil(cellularData.sections);
}


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================
//--------------------------------------------------------
#pragma mark Test SectionData Setters
//--------------------------------------------------------
//-----------------------------------
// -addSection:
//-----------------------------------
-(void)testAddSection_WithNilSectionData_ShouldThrow{
    
    // GIVEN
    KFXSectionData *sectionData = nil;
    // WHEN + THEN
    XCTAssertThrows([self.sut addSection:sectionData]);
    XCTAssertEqual(self.sut.count, 0);
}

-(void)testAddSection_WithValidSectionData_ShouldAddToSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    
    // WHEN
    [self.sut addSection:sectionData0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertNotNil(sectionData0.cellularViewData);
    XCTAssertEqualObjects(sectionData0.cellularViewData, self.sut);
    XCTAssertEqual([self.sut.sections indexOfObject:sectionData0], 0);
}


//-----------------------------------
// -addSections:
//-----------------------------------
-(void)testAddSections_WithValidSections_ShouldAddToCellularData{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    
    // WHEN
    [self.sut addSections:@[sectionData0,sectionData1]];

    // THEN
    XCTAssertEqual(self.sut.count, 2);
    XCTAssertNotNil(sectionData0.cellularViewData);
    XCTAssertNotNil(sectionData1.cellularViewData);
    XCTAssertEqualObjects(sectionData0.cellularViewData, self.sut);
    XCTAssertEqualObjects(sectionData1.cellularViewData, self.sut);
}

//-----------------------------------
// -insertSection:atIndex:
//-----------------------------------
-(void)testInsertSectionAtIndex_WithValidSectionData_ShouldAddToSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSections:@[sectionData0,sectionData1]];
    NSUInteger index = 1;
    
    // WHEN
    [self.sut insertSection:sectionData2 atIndex:index];
    
    // THEN
    XCTAssertEqual(self.sut.count, 3);
    XCTAssertNotNil(sectionData2.cellularViewData);
    XCTAssertEqualObjects(sectionData2.cellularViewData, self.sut);
    XCTAssertEqual([self.sut.sections indexOfObject:sectionData2], index);
}

-(void)testInsertSectionsAtIndex_ShouldAddSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSections:@[sectionData0,sectionData1,sectionData2]];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    NSUInteger index = 1;
    
    // WHEN
    [self.sut insertSections:@[sectionData3,sectionData4] atIndex:index];
    
    // THEN
    XCTAssertEqual(self.sut.count, 5);
    XCTAssertNotNil(sectionData4.cellularViewData);
    XCTAssertEqualObjects(sectionData4.cellularViewData, self.sut);
    XCTAssertEqual([self.sut.sections indexOfObject:sectionData3], index);

}

//-----------------------------------
// -deleteSection:
//-----------------------------------
-(void)testDeleteSection_WithValidSection_ShouldDeleteSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    XCTAssertEqual(self.sut.count, 1);
    
    // WHEN
    [self.sut deleteSection:sectionData0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 0);
    XCTAssertNil(sectionData0.cellularViewData);
}

//-----------------------------------
// -deleteSectionAtIndex:
//-----------------------------------
-(void)testDeleteSectionAtIndex_WithValidSection_ShouldDeleteSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    XCTAssertEqual(self.sut.count, 1);
    
    // WHEN
    [self.sut deleteSectionAtIndex:0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 0);
    XCTAssertNil(sectionData0.cellularViewData);
}

//-----------------------------------
// -deleteSections:
//-----------------------------------
-(void)testDeleteSections_WithValidSection_ShouldDeleteSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    XCTAssertEqual(self.sut.count, 3);
    
    // WHEN
    [self.sut deleteSections:@[sectionData0,sectionData2]];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertNil(sectionData0.cellularViewData);
    XCTAssertNil(sectionData2.cellularViewData);
    XCTAssertNotNil(sectionData1.cellularViewData);
}

//--------------------------------------------------------
#pragma mark Test CellData Setters
//--------------------------------------------------------
//-----------------------------------
// -addCellData:toSectionAtIndex:
//-----------------------------------
-(void)testAddCellData_WithNilCellData_ShouldThrow{
    
    // GIVEN
    KFXCellData *cellData = nil;
    [self.sut addSection:[KFXSectionData sectionData]];
    
    // WHEN + THEN
    XCTAssertThrows([self.sut addCellData:cellData toSectionAtIndex:0]);
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 0);
}

-(void)testAddCellData_WithNonNilCellData_ShouldAddToCellsArray{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];
    [self.sut addSection:[KFXSectionData sectionData]];
    // WHEN
    [self.sut addCellData:cellData toSectionAtIndex:0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 1);
    XCTAssertNotNil(cellData.sectionData);
    XCTAssertEqualObjects(cellData.sectionData.cellularViewData, self.sut);
}

//-----------------------------------
// -addCellDatas:toSectionAtIndex:
//-----------------------------------
-(void)testAddCellDatas_WithValidArray_ShouldAddToCells{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    NSArray *cells = @[cellData0,cellData1];
    
    // WHEN
    [self.sut addCellDatas:cells toSectionAtIndex:0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 2);
    XCTAssertNotNil(cellData0.sectionData);
    XCTAssertNotNil(cellData1.sectionData);
    XCTAssertEqualObjects(cellData0.sectionData.cellularViewData, self.sut);
    XCTAssertEqualObjects(cellData1.sectionData.cellularViewData, self.sut);
}

//-----------------------------------
// -insertCellData:atIndexPath:
//-----------------------------------
-(void)testInsertCellDataAtIndexPath_ShouldAddToCells{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    // WHEN
    [self.sut insertCellData:cellData2 atIndexPath:indexPath];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 3);
    XCTAssertNotNil(cellData2.sectionData);
    XCTAssertEqualObjects(cellData2.sectionData.cellularViewData, self.sut);
    XCTAssertEqual([self.sut.sections.firstObject.cells indexOfObject:cellData2], 1);
}

//-----------------------------------
// -insertCellDatas:atIndexPaths:
//-----------------------------------
-(void)testInsertCellDatasAtIndexPaths_ShouldAddToCells{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    // WHEN
    [self.sut insertCellDatas:@[cellData2] atIndexPaths:@[indexPath]];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 3);
    XCTAssertNotNil(cellData2.sectionData);
    XCTAssertEqualObjects(cellData2.sectionData.cellularViewData, self.sut);
    XCTAssertEqual([self.sut.sections.firstObject.cells indexOfObject:cellData2], 1);
}


//-----------------------------------
// -deleteCellDataAtIndexPath:
//-----------------------------------
-(void)testDeleteCellAtIndexPath_ShouldDeleteCell{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellDatas:@[cellData0,cellData1,cellData2] toSectionAtIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    // WHEN
    [self.sut deleteCellDataAtIndexPath:indexPath];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 2);
    XCTAssertNil(cellData1.sectionData);
    XCTAssertEqual([self.sut.sections.firstObject.cells indexOfObject:cellData2], 1);
}

//-----------------------------------
// -deleteCellData:
//-----------------------------------
-(void)testDeleteCellData_ShouldDeleteCell{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellDatas:@[cellData0,cellData1,cellData2] toSectionAtIndex:0];
    
    // WHEN
    [self.sut deleteCellData:cellData1];
    
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertEqual(self.sut.sections.firstObject.count, 2);
    XCTAssertNil(cellData1.sectionData);
    XCTAssertEqual([self.sut.sections.firstObject.cells indexOfObject:cellData2], 1);
}


 
//--------------------------------------------------------
#pragma mark Test SectionData Getters
//--------------------------------------------------------
-(void)testSectionForTag_ShouldFindSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    sectionData0.tag = 45;
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    sectionData1.tag = 99;
    [self.sut addSections:@[sectionData0,sectionData1]];
    
    // WHEN
    KFXSectionData *received0 = [self.sut sectionForTag:45];
    KFXSectionData *received1 = [self.sut sectionForTag:99];
    
    // THEN
    XCTAssertEqualObjects(sectionData0, received0);
    XCTAssertEqualObjects(sectionData1, received1);
}

-(void)testSectionForIdentifier_ShouldFindSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    sectionData0.identifier = @"45";
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    sectionData1.identifier = @"99";
    [self.sut addSections:@[sectionData0,sectionData1]];
    
    // WHEN
    KFXSectionData *received0 = [self.sut sectionForIdentifier:@"45"];
    KFXSectionData *received1 = [self.sut sectionForIdentifier:@"99"];
    
    // THEN
    XCTAssertEqualObjects(sectionData0, received0);
    XCTAssertEqualObjects(sectionData1, received1);

}

-(void)testSectionForIndex_ShouldFindSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSections:@[sectionData0,sectionData1]];
    
    // WHEN
    KFXSectionData *received0 = [self.sut sectionForIndex:0];
    KFXSectionData *received1 = [self.sut sectionForIndex:1];
    
    // THEN
    XCTAssertEqualObjects(sectionData0, received0);
    XCTAssertEqualObjects(sectionData1, received1);

}

//--------------------------------------------------------
#pragma mark Test CellData Getters
//--------------------------------------------------------
-(void)testCellForTag_WithValidCellData_ShouldReturnCellData{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.tag = 45;
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.tag = 99;
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];
    
    // WHEN
    KFXCellData *received0 = [self.sut cellForTag:45];
    KFXCellData *received1 = [self.sut cellForTag:99];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}

-(void)testCellForIdentifier_WithValidCellData_ShouldReturnCellData{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.identifier = @"45";
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.identifier = @"99";
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];

    // WHEN
    KFXCellData *received0 = [self.sut cellForIdentifier:@"45"];
    KFXCellData *received1 = [self.sut cellForIdentifier:@"99"];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}

-(void)testCellForIndexPath_ShouldReturnCellData{
    
    // GIVEN
    [self.sut addSection:[KFXSectionData sectionData]];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    [self.sut addCellDatas:@[cellData0,cellData1] toSectionAtIndex:0];

    // WHEN
    KFXCellData *received0 = [self.sut cellForIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    KFXCellData *received1 = [self.sut cellForIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}

//--------------------------------------------------------
#pragma mark Test Queries
//--------------------------------------------------------
-(void)testCount{
    
    [self.sut addSection:[KFXSectionData sectionData]];
    XCTAssertEqual(self.sut.count, 1);
    [self.sut addSection:[KFXSectionData sectionData]];
    XCTAssertEqual(self.sut.count, 2);
    [self.sut addSection:[KFXSectionData sectionData]];
    XCTAssertEqual(self.sut.count, 3);
}

-(void)testCountForSectionAtIndex{
    
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    XCTAssertEqual([self.sut countForSectionAtIndex:0], 0);
    [sectionData0 addCellData:[KFXCellData cellData]];
    XCTAssertEqual([self.sut countForSectionAtIndex:0], 1);
    [sectionData0 addCellData:[KFXCellData cellData]];
    XCTAssertEqual([self.sut countForSectionAtIndex:0], 2);
    [sectionData0 addCellData:[KFXCellData cellData]];
    XCTAssertEqual([self.sut countForSectionAtIndex:0], 3);

}

-(void)testIndexOfSectionData{
    
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    XCTAssertEqual([self.sut indexOfSectionData:sectionData0], 0);
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    XCTAssertEqual([self.sut indexOfSectionData:sectionData1], 1);
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    XCTAssertEqual([self.sut indexOfSectionData:sectionData2], 2);
}

-(void)testSectionIndex{
    
    KFXCellularViewData *cellularData = [KFXCellularViewData cellularViewData];
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [cellularData addSection:sectionData0];
    XCTAssertEqual([sectionData0 sectionIndex], 0);
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [cellularData addSection:sectionData1];
    XCTAssertEqual([sectionData1 sectionIndex], 1);
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [cellularData addSection:sectionData2];
    XCTAssertEqual([sectionData2 sectionIndex], 2);
    
}

//-----------------------------------
// -indexSetsForSections:
//-----------------------------------
-(void)testOrderedIndexSetsForSections_WithOneSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    NSArray *expected = @[[NSIndexSet indexSetWithIndex:0]];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData0]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithTwoSequentialSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 2)]];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData0,sectionData1]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithThreeSequentialSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)]];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData0,sectionData1,sectionData2]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithFiveSequentialSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];

    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 5)]];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData0,sectionData1,sectionData2,sectionData3,sectionData4]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithOneRandomSection{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    
    NSArray *expected = @[
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 1)]
                          ];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData3]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithTwoRandomSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    
    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 1)]
                          ];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData1,sectionData3]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithThreeRandomSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    
    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(4, 1)]
                          ];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData0,sectionData2,sectionData4]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithThreeRandomOutOfOrderSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    
    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 2)]
                          ];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData4,sectionData1,sectionData3]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexSetsForSections_WithMixedRandomAmndSequentialSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    KFXSectionData *sectionData5 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData5];
    KFXSectionData *sectionData6 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData6];

    NSArray *expected = @[[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 1)],
                          [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(5, 2)]
                          ];
    // WHEN
    NSArray *received = [self.sut orderedIndexSetsForSections:@[sectionData5,sectionData0,sectionData2,sectionData6]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testIndexesForSections_WithMixedRandomAmndSequentialSections{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXSectionData *sectionData2 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData2];
    KFXSectionData *sectionData3 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData3];
    KFXSectionData *sectionData4 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData4];
    KFXSectionData *sectionData5 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData5];
    KFXSectionData *sectionData6 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData6];
    NSArray *expected = @[@5,@0,@2,@6];
    
    // WHEN
    NSArray *received = [self.sut indexesForSections:@[sectionData5,sectionData0,sectionData2,sectionData6]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

//-----------------------------------
// -indexPathsForCells:
//-----------------------------------
-(void)testOrderedIndexPathsForSections_WithOneCellData{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData0];
    NSArray *expected = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    
    // WHEN
    NSArray *received = [self.sut orderedIndexPathsForCells:@[cellData0]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexPathsForSections_WithTwoSequentialCellDatas{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData0];
    KFXCellData *cellData1 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData1];
    NSArray *expected = @[[NSIndexPath indexPathForRow:0 inSection:0],
                          [NSIndexPath indexPathForRow:1 inSection:0]
                          ];
    
    // WHEN
    NSArray *received = [self.sut orderedIndexPathsForCells:@[cellData0,cellData1]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testOrderedIndexPathsForSections_WithThreeCellDatas{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData0];
    KFXCellData *cellData1 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData1];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData2];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXCellData *cellData3 = [KFXCellData cellData];
    [sectionData1 addCellData:cellData3];
    KFXCellData *cellData4 = [KFXCellData cellData];
    [sectionData1 addCellData:cellData4];

    NSArray *expected = @[[NSIndexPath indexPathForRow:0 inSection:0],
                          [NSIndexPath indexPathForRow:2 inSection:0],
                          [NSIndexPath indexPathForRow:1 inSection:1],
                          ];
    
    // WHEN
    NSArray *received = [self.sut orderedIndexPathsForCells:@[cellData0,cellData2,cellData4]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}

-(void)testIndexPathsForSections_WithThreeCellDatas{
    
    // GIVEN
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData0];
    KFXCellData *cellData0 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData0];
    KFXCellData *cellData1 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData1];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [sectionData0 addCellData:cellData2];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    [self.sut addSection:sectionData1];
    KFXCellData *cellData3 = [KFXCellData cellData];
    [sectionData1 addCellData:cellData3];
    KFXCellData *cellData4 = [KFXCellData cellData];
    [sectionData1 addCellData:cellData4];
    
    NSArray *expected = @[[NSIndexPath indexPathForRow:0 inSection:0],
                          [NSIndexPath indexPathForRow:2 inSection:0],
                          [NSIndexPath indexPathForRow:1 inSection:1],
                          ];
    
    // WHEN
    NSArray *received = [self.sut indexPathsForCells:@[cellData0,cellData2,cellData4]];
    
    // THEN
    XCTAssertEqualObjects(received, expected);
}







@end


























