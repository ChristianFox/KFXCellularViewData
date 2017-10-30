/********************************
 *
 * Copyright © 2016-2017 Christian Fox
 * All Rights Reserved
 * Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXAbstracts
 *
 ************************************/



#import "KFXViewController.h"

@interface KFXViewController ()

@end

@implementation KFXViewController


//======================================================
#pragma mark - ** Public Methods **
//======================================================

//--------------------------------------------------------
#pragma mark Inject Dependencies
//--------------------------------------------------------


//--------------------------------------------------------
#pragma mark Actions
//--------------------------------------------------------




//======================================================
#pragma mark - ** Inherited Methods **
//======================================================
//--------------------------------------------------------
#pragma mark UIViewController
//--------------------------------------------------------
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	self.visible = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
	self.visible = NO;
}
//-(void)viewWillDisappear:(BOOL)animated{
//	[super viewWillDisappear:animated];
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    
//}




//======================================================
#pragma mark - ** Protocol Methods **
//======================================================



//======================================================
#pragma mark - ** Private Methods **
//======================================================
//--------------------------------------------------------
#pragma mark Lazy Load
//--------------------------------------------------------





//======================================================
#pragma mark - ** Navigation **
//======================================================
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
//}






@end
















