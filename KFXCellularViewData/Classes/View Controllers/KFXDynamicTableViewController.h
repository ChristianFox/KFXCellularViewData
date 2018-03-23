/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/


#import <KFXAbstracts/KFXTableViewController.h>
#import <KFXCellularViewData/KFXTableViewData.h>

@interface KFXDynamicTableViewController : KFXTableViewController

// Data
@property (strong,nonatomic) KFXTableViewData *tableData;
// Animations
@property (nonatomic) UITableViewRowAnimation insertSectionAnimation;
@property (nonatomic) UITableViewRowAnimation deleteSectionAnimation;
@property (nonatomic) UITableViewRowAnimation reloadSectionAnimation;
@property (nonatomic) UITableViewRowAnimation insertRowAnimation;
@property (nonatomic) UITableViewRowAnimation deleteRowAnimation;
@property (nonatomic) UITableViewRowAnimation reloadRowAnimation;


@end

