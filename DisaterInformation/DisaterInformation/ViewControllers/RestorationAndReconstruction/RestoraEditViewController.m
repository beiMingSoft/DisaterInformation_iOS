//
//  RestoraEditViewController.m
//  DisaterInformation
//
//  Created by ya Liu on 2017/1/13.
//  Copyright © 2017年 wasterd. All rights reserved.
//

/*
 恢复重建上传资料
 */

#import "RestoraEditViewController.h"
#import "CBBTView.h"
#import "ShowEditItem.h"
#import "RRZSendShowTextCell.h"
#import "RRZSendShowImageCell.h"
#import "TZImagePickerController.h"


static NSString *sendShowTextCellID = @"SendShowTextCellID";
static NSString *sendShowImageCellID = @"SendShowImageCellID";
@interface RestoraEditViewController ()<UITextViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,TZImagePickerControllerDelegate>
@property(nonatomic ,strong)UIScrollView *scrollView;
@property(nonatomic ,strong) CBBTView * titleTextView;
@property(nonatomic ,strong) CBBTView * contentTextView;

@property (strong, nonatomic)UITableView *myTableView;
@property (nonatomic,retain) UIImagePickerController *imagePickerController;
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
        _showEditItem.selectedImages = @[].mutableCopy;
        _showEditItem.selectedAssets = @[].mutableCopy;
    }
    return _showEditItem;
}



#pragma mark - UIAlertController
- (void)showActionForPhoto{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:self ];
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray * assets, BOOL isSelectOriginalPhoto) {
        self.showEditItem.selectedImages = [NSMutableArray arrayWithArray:photos];
        self.showEditItem.selectedAssets = [NSMutableArray arrayWithArray:assets];
        [self.myTableView reloadData];
    }];
    

    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
    
//    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择照片路径" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//            NSLog(@"该设备不支持相机");
//        }else{
//            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
//            [self.navigationController presentViewController:self.imagePickerController
//                                                    animated:YES
//                                                  completion:nil];
//        }
//    }];
//    
//    
//    UIAlertAction *cameroAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
//            
//            NSLog(@"该设备不支持从相册选取文件");
//        }else{
//            
//            [self presentViewController:self.picker animated:YES completion:nil];
//        }
//    }];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }];
//    [alertController addAction:cancelAction];
//    [alertController addAction:photoAction];
//    [alertController addAction:cameroAction];
//    
//    [self presentViewController:alertController animated:YES completion:nil];
    
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
