//
//  SALViewController.m
//  ScrollViewAutoLayoutSample
//
//  Created by mito on 2014/02/20.
//  Copyright (c) 2014年 mito. All rights reserved.
//

#import "SALViewController.h"

@interface SALViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet UILabel *imageTitleLabel;

@end

@implementation SALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _updateConstraint];
}

- (IBAction)changePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;

    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [self _updateConstraint];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)_updateConstraint
{
    UIImage *image = self.imageView.image;
    CGFloat multiplier = (CGRectGetWidth(self.imageView.bounds) / image.size.width);
    [self.heightConstraint setConstant:multiplier * image.size.height];
    self.imageTitleLabel.text = @[@"寝起きのコツメカワウソ", @"コツメカワウソの日常", @"ポン・デ・カワウソ", @"横幅を超える長さのとても長い文章のテスト"][rand() % 4];
}
@end
