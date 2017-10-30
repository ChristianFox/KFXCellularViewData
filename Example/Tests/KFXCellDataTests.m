


#import <XCTest/XCTest.h>
// SUT
#import <KFXCellularViewData/KFXCellularViewData.h>

@interface KFXCellDataTests : XCTestCase
@property (strong,nonatomic) KFXCellData *sut;
@end

@implementation KFXCellDataTests


//======================================================
#pragma mark - ** Setup, Tear down **
//======================================================
- (void)setUp {
    [super setUp];
    self.sut = [[KFXCellData alloc]init];
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

-(void)testCellDataInitiliser{
    
    KFXCellData *cellData = [KFXCellData cellData];
    XCTAssertNotNil(cellData);
}

-(void)testCellDataWithContentsInitiliser{
    
    NSString *contents = @"This is some contents";
    KFXCellData *cellData = [KFXCellData cellDataWithContents:contents];
    XCTAssertNotNil(cellData);
    XCTAssertEqualObjects(cellData.contents, contents);
}


//======================================================
#pragma mark - ** Primary Function Tests **
//======================================================
-(void)testIndexPath_WhenCellDataIsNotInSection_ShouldReturnNil{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];

    // WHEN
    NSIndexPath *indexPath = [cellData indexPath];
    
    // THEN
    XCTAssertNil(indexPath);
}

-(void)testIndexPath_WhenCellDataIsFirstInSectionEtc_ShouldReturnCorrectIndexPath{
    
    // GIVEN
    KFXCellData *cellData = [KFXCellData cellData];
    KFXSectionData *sectionData = [KFXSectionData sectionData];
    KFXCellularViewData *celluarData = [KFXCellularViewData cellularViewData];
    [celluarData addSection:sectionData];
    [sectionData addCellData:cellData];
    
    // WHEN
    NSIndexPath *indexPath = [cellData indexPath];
    
    // THEN
    XCTAssertNotNil(indexPath);
    XCTAssertEqual(indexPath.section, 0);
    XCTAssertEqual(indexPath.row, 0);
}

-(void)testIndexPath_WhenCellDataIsSecondInSectionEtc_ShouldReturnCorrectIndexPath{
    
    // GIVEN
    KFXCellData *cellData1 = [KFXCellData cellData];
    KFXCellData *cellData0 = [KFXCellData cellData];
    KFXSectionData *sectionData0 = [KFXSectionData sectionData];
    KFXSectionData *sectionData1 = [KFXSectionData sectionData];
    KFXCellularViewData *celluarData = [KFXCellularViewData cellularViewData];
    [celluarData addSection:sectionData0];
    [celluarData addSection:sectionData1];
    [sectionData1 addCellData:cellData0];
    [sectionData1 addCellData:cellData1];

    // WHEN
    NSIndexPath *indexPath = [cellData1 indexPath];
    
    // THEN
    XCTAssertNotNil(indexPath);
    XCTAssertEqual(indexPath.section, 1);
    XCTAssertEqual(indexPath.row, 1);
}










@end


























