//
//  RestoraEditViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/13.
//  Copyright © 2017年 wasterd. All rights reserved.
//

#import "RestoraEditViewController.h"
#import "CBBTView.h"
#import <QBImagePickerController/QBImagePickerController.h>
#import "ShowEditItem.h"
#import "RRZSendShowTextCell.h"
#import "RRZSendShowImageCell.h"

static NSString *sendShowTextCellID = @"SendShowTextCellID";
static NSString *sendShowImageCellID = @"SendShowImageCellID";
@interface RestoraEditViewController ()<UITextViewDelegate,QBImagePickerControllerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UIScrollView *scrollView;
@property(nonatomic ,strong) CBBTView * titleTextView;
@property(nonatomic ,strong) CBBTView * contentTextView;

@property (strong, nonatomic)UITableView *myTableView;
@property (nonatomic,retain) UIImagePickerController *imagePickerController;
@property (nonatomic,retain) QBImagePickerController *picker;
@property (nonatomic,retain) ShowEditItem *showEditItem;
@property (weak, nonatomic) CBBTView *textView;




@end

@implementation RestoraEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Add Information";
//    [self createScrollView];
    [self setupTabelView];
    [self setupNavItem];

}


- (ShowEditItem*)showEditItem{
    if (!_showEditItem) {
        _showEditItem = [[ShowEditItem alloc]init];
        _showEditItem.selectedImages = [NSMutableArray array];
        _showEditItem.selectedAssets = [NSMutableArray array];
    }
    return _showEditItem;
}



- (QBImagePickerController*)picker{
    if (!_picker) {
        _picker = [[QBImagePickerController alloc]init];
        _picker.delegate = self;
        _picker.automaticallyAdjustsScrollViewInsets = YES;
        _picker.minimumNumberOfSelection = 1;
        _picker.maximumNumberOfSelection = 11;
        //指定显示的相册
        _picker.assetCollectionSubtypes = @[                               @(PHAssetCollectionSubtypeSmartAlbumUserLibrary), //相机胶卷
                                                                           //@(PHAssetCollectionSubtypeAlbumMyPhotoStream), //我的照片流
                                                                           //@(PHAssetCollectionSubtypeSmartAlbumPanoramas), //全景图
                                                                           //@(PHAssetCollectionSubtypeSmartAlbumVideos), //视频
                                                                           //@(PHAssetCollectionSubtypeSmartAlbumBursts) //连拍模式拍摄的照片
                                                                           ];
        //设置媒体类型
        _picker.mediaType = QBImagePickerMediaTypeAny;//图片与视频
        //设置每行显示的图像数量
        _picker.numberOfColumnsInPortrait = 4;//竖屏下每行4个
        _picker.numberOfColumnsInLandscape = 7;//横惬意下每行7个
        _picker.prompt = @"请选择图片";
        _picker.showsNumberOfSelectedAssets = YES;
        _picker.allowsMultipleSelection = YES;
    }
    [_picker.selectedAssets removeAllObjects];
    [_picker.selectedAssets addObjectsFromArray:self.showEditItem.selectedAssets];
    return _picker;
}
- (UIImagePickerController*)imagePickerController{
    if (!_imagePickerController) {
        _imagePickerController  = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = NO;//设置可编辑
    }
    return _imagePickerController;
}


#pragma mark - UIAlertController
- (void)showActionForPhoto{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择照片路径" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            NSLog(@"该设备不支持相机");
        }else{
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.navigationController presentViewController:self.imagePickerController
                                                    animated:YES
                                                  completion:nil];
        }
    }];
    
    
    UIAlertAction *cameroAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            
            NSLog(@"该设备不支持从相册选取文件");
        }else{
            
            [self presentViewController:self.picker animated:YES completion:nil];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:photoAction];
    [alertController addAction:cameroAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


-(void)setupTabelView
{
    //    添加myTableView
    _myTableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[RRZSendShowTextCell class] forCellReuseIdentifier:sendShowTextCellID];
        [tableView registerClass:[RRZSendShowImageCell class] forCellReuseIdentifier:sendShowImageCellID];
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });


}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        RRZSendShowTextCell *cell = [tableView dequeueReusableCellWithIdentifier:sendShowTextCellID];
        self.textView = cell.contentTextView;
        cell.contentTextView.delegate = self;
//        cell.textValueChangedBlock = ^(NSString *valueStr){
//                    weakSelf.valueStr = valueStr;
//                };
        return cell;
    }else{
        RRZSendShowImageCell *cell = [tableView dequeueReusableCellWithIdentifier:sendShowImageCellID];
        cell.item = self.showEditItem;
        __weak typeof(self) weakSelf = self;
        cell.addPicturesBlock = ^(){
            [weakSelf showActionForPhoto];
        };
        cell.deleteImageBlock = ^(ShowEditItem *item){
            weakSelf.showEditItem = item;
            [weakSelf.myTableView reloadData];
        };
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }else{
        return 300;
    }
}




-(void)setupNavItem
{
    self.navigationItem.rightBarButtonItem = [ToolObject backBarButtonWithImageName:@"commit_icon" select:@selector(commitActionClicked:) target:self];


}

-(void)commitActionClicked:(UIButton *)btn
{
    MMLog(@"发布");

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UIImagePickerControllerDelegate

//拍照回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *pickerImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //添加照片
    [self.showEditItem.selectedImages addObject:pickerImage];
    [self.myTableView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}



//相册方法回调
- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //清数据
        [self.showEditItem.selectedImages removeAllObjects];
        [self.showEditItem.selectedAssets removeAllObjects];
        
        if (assets.count == 0) {
            [self.myTableView reloadData];
            [self dismissViewControllerAnimated:YES completion:nil];
            return ;
        }
        
        //将选好的图片资源存入数组
        //1.PHAsset数组
        [self.showEditItem.selectedAssets addObjectsFromArray:assets];
        //2.照片数组
        for (PHAsset *asset in self.showEditItem.selectedAssets) {
            [[PHImageManager defaultManager]requestImageForAsset:asset
                                                      targetSize:CGSizeMake(asset.pixelWidth, asset.pixelHeight)
                                                     contentMode:PHImageContentModeDefault
                                                         options:nil
                                                   resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                                                       [self.showEditItem.selectedImages addObject:result];
                                                   }];
            
        }
        [self.myTableView reloadData];
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}
                   
                   
                   
-(void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController{
     [self dismissViewControllerAnimated:YES completion:nil];
}



















































// 压缩图片
- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize
{
    //先调整分辨率
    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);
    
    CGFloat tempHeight = newSize.height / 1024;
    CGFloat tempWidth = newSize.width / 1024;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData;
    if (UIImagePNGRepresentation(newImage)) {
        imageData = UIImagePNGRepresentation(newImage);
    }else{
        imageData = UIImageJPEGRepresentation(newImage, 0.5);
    }
    
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    if (sizeOriginKB > maxSize) {
        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.50);
        return finallImageData;
    }
    
    return imageData;
}














- (void)textViewDidChange:(CBBTView *)textView

{
    
    if([textView.placeholder length] == 0)
    {
        return;
    }
    if([textView.placeholder length]  == 0)
    {
        [textView.placeHolderLabel setAlpha:1];
    }
    else
    {
        [textView.placeHolderLabel  setAlpha:0];
    }
    
    if ([textView.text isEqualToString:@""]) {
        [textView.placeHolderLabel setAlpha:1];
    }
}


//-(void)createScrollView
//{
//    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT - 64) ];
//    [self.view addSubview:self.scrollView];
//
//    self.titleTextView =[[CBBTView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 30)];
//     self.titleTextView.backgroundColor = [UIColor whiteColor];
//     self.titleTextView.placeholderColor = [UIColor lightGrayColor];
//     self.titleTextView.placeholder = @"Please  Entry Title";
//     self.titleTextView.font = [UIFont systemFontOfSize:17];
//     self.titleTextView.delegate = self;
////    titleTextView.layer.borderWidth =1;
////    titleTextView.layer.borderColor =[UIColor lightGrayColor].CGColor;
////    [titleTextView.layer setCornerRadius:10.0f];
//    [self.scrollView addSubview: self.titleTextView];
//
//
//    UIView *sqliteLineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY( self.titleTextView.frame) + 10, DEVICE_WIDTH, 1) ];
//    sqliteLineView.backgroundColor = [UIColor colorWithRGBString:COLOR_LINEVIEW_F0F0F];
//
//    [self.scrollView addSubview:sqliteLineView];
//
//    self.contentTextView =[[CBBTView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(sqliteLineView.frame) + 10, [UIScreen mainScreen].bounds.size.width - 20, 150)];
//    self.contentTextView.backgroundColor = [UIColor whiteColor];
//    self.contentTextView.placeholderColor = [UIColor lightGrayColor];
//    self.contentTextView.placeholder = @"Please  Entry Content";
//    self.contentTextView.font = [UIFont systemFontOfSize:17];
//    self.contentTextView.delegate = self;
//    self.contentTextView.layer.borderWidth =1;
//    self.contentTextView.layer.borderColor =[UIColor lightGrayColor].CGColor;
//    [self.contentTextView.layer setCornerRadius:5];
//    [self.scrollView addSubview:self.contentTextView];
//
//
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//         button.frame = CGRectMake( 100, CGRectGetMaxY(self.contentTextView.frame )+ 50, 100, 100);
//        [button addTarget:self action:@selector(showActionForPhoto) forControlEvents:UIControlEventTouchUpInside];
//        [button setImage:[UIImage imageNamed:@"拍照"] forState:UIControlStateNormal];
//            [self.view addSubview:button];
//
//
//}
//

@end
