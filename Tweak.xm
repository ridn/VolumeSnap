

@interface AVCameraViewController
- (void)setPressingCameraButton:(BOOL)arg1;
- (void)setCapturedImage:(BOOL)arg1;
- (void)toggledCamera:(BOOL)arg1;
@end
%hook AVCameraViewController
- (void)viewDidBecomeActive
{
	%orig;


[[NSNotificationCenter defaultCenter] addObserver:self
	selector:@selector(volumeButtonPressedForPicture) 
	name:@"AVSystemController_SystemVolumeDidChangeNotification" 
	object:nil];
}
%new
- (void)volumeButtonPressedForPicture
{
	[self flashPressed];
}
%end
