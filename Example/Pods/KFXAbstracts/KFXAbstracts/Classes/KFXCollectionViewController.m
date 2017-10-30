/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/



#import "KFXCollectionViewController.h"

@interface KFXCollectionViewController ()

@end

@implementation KFXCollectionViewController




//======================================================
#pragma mark - ** Public Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Initilisation
//--------------------------------------------------------
+(instancetype)initiliseWithFlowLayout{
	
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
	id cvc = [[self alloc]initWithCollectionViewLayout:layout];
	return cvc;
}

//--------------------------------------------------------
#pragma mark - Inject Dependencies
//--------------------------------------------------------



//--------------------------------------------------------
#pragma mark - Actions
//--------------------------------------------------------




//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UIViewController
////--------------------------------------------------------
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}

-(void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	self.visible = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
	self.visible = NO;
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}



//======================================================
#pragma mark - ** Protocol Methods **
//======================================================
//--------------------------------------------------------
#pragma mark - UICollectionViewDataSource
//--------------------------------------------------------



//--------------------------------------------------------
#pragma mark - UICollectionViewDelegate
//--------------------------------------------------------


//--------------------------------------------------------
#pragma mark - UICollectionViewDelegateFlowLayout
//--------------------------------------------------------



//======================================================
#pragma mark - ** Private Methods **
//======================================================

//--------------------------------------------------------
#pragma mark - Lazy Load
//--------------------------------------------------------



//======================================================
#pragma mark - ** Navigation **
//======================================================



@end






















