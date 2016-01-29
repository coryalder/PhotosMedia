//
//  ViewController.m
//  Media
//
//  Created by Cory Alder on 2016-01-29.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import "ViewController.h"
//#import <AVFoundation/AVFoundation.h>
@import AVFoundation;


@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Actions

- (IBAction)playAudioAction:(id)sender {
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"audio" withExtension:@"mp3"];
    
//    AVAsset *asset = [AVAsset assetWithURL:fileURL];
//    
//    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
//    
//    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    
    AVPlayer *player2 = [AVPlayer playerWithURL:fileURL];
    
//    player2.currentItem.asset
    
    [player2 play];
    
    [player2 setRate:2.0];
    
    self.player = player2;

}

- (IBAction)pickImageAction:(id)sender {
    
//    [self.player setVolume:0.5];
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];

    pickerController.delegate = self;
    
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//    pickerController.mediaTypes = 
    
    [self presentViewController:pickerController animated:YES completion:nil];
}


#pragma mark - Image Picker Delegate


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {


    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (image) {
        self.imageView.image = image;
    }
    
    NSLog(@"Picked!");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
