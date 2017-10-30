


#import <XCTest/XCTest.h>
// SUT
#import <KFXCellularViewData/KFXCellularViewData.h>

@interface KFXSectionDataTests : XCTestCase
@property (strong,nonatomic) KFXSectionData *sut;
@end

@implementation KFXSectionDataTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [[KFXSectionData alloc]init];
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

-(void)testSectionDataInitiliser{
    KFXSectionData *sectionData = [KFXSectionData sectionData];
    XCTAssertNotNil(sectionData);
    XCTAssertNotNil(sectionData.cells);
}


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================
//--------------------------------------------------------
#pragma mark Test CellData Setters
//--------------------------------------------------------
-(void)testAddCellData_WithNilCellData_ShouldThrow{
    
    // GIVEN
    KFXCellData *cellData = nil;
    // WHEN + THEN
    XCTAssertThrows([self.sut addCellData:cellData]);
    XCTAssertEqual(self.sut.count, 0);
}

-(void)testAddCellData_WithNonNilCellData_ShouldAddToCellsArray{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];
    // WHEN
    [self.sut addCellData:cellData];
    // THEN
    XCTAssertEqual(self.sut.count, 1);
    XCTAssertNotNil(cellData.sectionData);
    XCTAssertEqualObjects(cellData.sectionData, self.sut);
}

-(void)testAddCellDataFromArray_WithValidArray_ShouldAddToCells{
    
    // GIVEN
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    NSArray *cells = @[cellData0,cellData1];
    
    // WHEN
    [self.sut addCellDataFromArray:cells];
    
    // THEN
    XCTAssertEqual(self.sut.count, 2);
    XCTAssertNotNil(cellData0.sectionData);
    XCTAssertNotNil(cellData1.sectionData);
    XCTAssertEqualObjects(cellData0.sectionData, self.sut);
    XCTAssertEqualObjects(cellData1.sectionData, self.sut);
}

-(void)testInsertCellDataAtIndex_WithValidCellData_ShouldAddToCells{
    
    // GIVEN
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellDataFromArray:@[cellData0,cellData1]];
    NSUInteger index = 1;
    
    // WHEN
    [self.sut insertCellData:cellData2 atIndex:index];
    
    // THEN
    XCTAssertEqual(self.sut.count, 3);
    XCTAssertNotNil(cellData2.sectionData);
    XCTAssertEqualObjects(cellData2.sectionData, self.sut);
    XCTAssertEqual([self.sut.cells indexOfObject:cellData2], 1);
}

-(void)testDeleteCellData_ShouldDeleteCellData{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];
    [self.sut addCellData:cellData];
    XCTAssertEqual(self.sut.count, 1);
    
    // WHEN
    [self.sut deleteCellData:cellData];
    
    // THEN
    XCTAssertEqual(self.sut.count, 0);
}

-(void)testDeleteCellDataAtIndex_ShouldDeleteCellData{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];
    [self.sut addCellData:cellData];
    XCTAssertEqual(self.sut.count, 1);
    
    // WHEN
    [self.sut deleteCellDataAtIndex:0];
    
    // THEN
    XCTAssertEqual(self.sut.count, 0);
}

//--------------------------------------------------------
#pragma mark Test CellData Getters
//--------------------------------------------------------
-(void)testCellForTag_WithValidCellData_ShouldReturnCellData{
    
    // GIVEN
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.tag = 45;
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.tag = 99;
    [self.sut addCellDataFromArray:@[cellData0,cellData1]];
    
    // WHEN
    KFXCellData *received0 = [self.sut cellForTag:45];
    KFXCellData *received1 = [self.sut cellForTag:99];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}

-(void)testCellForIdentifier_WithValidCellData_ShouldReturnCellData{
    
    // GIVEN
    KFXCellData *cellData0 = [KFXCellData cellData];
    cellData0.identifier = @"45";
    KFXCellData *cellData1 = [KFXCellData cellData];
    cellData1.identifier = @"99";
    [self.sut addCellDataFromArray:@[cellData0,cellData1]];
    
    // WHEN
    KFXCellData *received0 = [self.sut cellForIdentifier:@"45"];
    KFXCellData *received1 = [self.sut cellForIdentifier:@"99"];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}

-(void)testCellForIndexPath_ShouldReturnCellData{
    
    // GIVEN
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXCellData *cellData1 = [KFXCellData cellData];
    [self.sut addCellDataFromArray:@[cellData0,cellData1]];
    
    // WHEN
    KFXCellData *received0 = [self.sut cellForIndex:0];
    KFXCellData *received1 = [self.sut cellForIndex:1];
    
    // THEN
    XCTAssertEqualObjects(cellData0, received0);
    XCTAssertEqualObjects(cellData1, received1);
}


//--------------------------------------------------------
#pragma mark Test Queries
//--------------------------------------------------------
-(void)testCount{
    
    [self.sut addCellData:[KFXCellData cellData]];
    XCTAssertEqual(self.sut.count, 1);
    [self.sut addCellData:[KFXCellData cellData]];
    XCTAssertEqual(self.sut.count, 2);
    [self.sut addCellData:[KFXCellData cellData]];
    XCTAssertEqual(self.sut.count, 3);
}

-(void)testIndexOfCellData{
    
    KFXCellData *cellData0 = [KFXCellData cellData];
    [self.sut addCellData:cellData0];
    XCTAssertEqual([self.sut indexOfCellData:cellData0], 0);
    KFXCellData *cellData1 = [KFXCellData cellData];
    [self.sut addCellData:cellData1];
    XCTAssertEqual([self.sut indexOfCellData:cellData1], 1);
    KFXCellData *cellData2 = [KFXCellData cellData];
    [self.sut addCellData:cellData2];
    XCTAssertEqual([self.sut indexOfCellData:cellData2], 2);
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



@end


























