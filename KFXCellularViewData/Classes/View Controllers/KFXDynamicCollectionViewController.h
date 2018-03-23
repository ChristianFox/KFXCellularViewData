/********************************
 *
 * Copyright © 2016-2018 Christian Fox
 *
 * MIT Licence - Full licence details can be found in the file 'LICENSE' or in the Pods-{yourProjectName}-acknowledgements.markdown
 *
 * This file is included with KFXCellularViewData
 *
 ************************************/

#import <KFXAbstracts/KFXCollectionViewController.h>
#import <KFXCellularViewData/KFXCollectionViewData.h>

@interface KFXDynamicCollectionViewController : KFXCollectionViewController

// Data
@property (strong,nonatomic) KFXCollectionViewData *collectionData;

@end
