//
//  MyPaletteViewController.m
//  MyPalette
//
//  Created by xiaozhu on 11-6-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyPaletteViewController.h"
#import "CalculatorViewController.h"



@implementation MyPaletteViewController
@synthesize Segment;
@synthesize labelLoanshift;
@synthesize labelColor;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // 另外一種方式
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"BGkawa5.png"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
}
-(IBAction)myPalttealllineclear
{
	[(Palette*)self.view myalllineclear];
}
//
-(IBAction)LineFinallyRemove
{
	[(Palette*)self.view myLineFinallyRemove];
}
//颜色
-(IBAction)myAllColor
{
	[self segmentColor];
}
//宽度
-(IBAction)myAllWidth
{
	[self segmentWidth];
}
//橡皮
-(IBAction)myRubberSeraser
{
	
	Segment=10;
}

- (IBAction)back2Cal:(id)sender {
    
//    [self dismissModalViewControllerAnimated:YES completion:nil];
    
    
    NSLog(@"%p",self);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%p",self);
  
//    CalculatorViewController * viewController=
//  
//    
//   
//    
//    [self presentViewController:viewController animated:YES completion:nil];
}


//方法名
//方法作用
//方法
//===========================================================
-(void)segmentColor
{
	NSArray * segmentArray=[NSArray arrayWithObjects:@"黑",@"红",@"藍",@"綠",@"黄",@"橙",@"灰",@"紫",@"棕",@"粉红", nil];

	ColorButton=[[UISegmentedControl alloc] initWithItems:segmentArray];
	CGRect ButtonRect=CGRectMake(0, 420, 320, 40);
	[ColorButton setFrame:ButtonRect];
	[ColorButton setMomentary:YES];
	[ColorButton addTarget:self action:@selector(segmentColorButton:) 
		  forControlEvents:UIControlEventValueChanged];
	
	[ColorButton setSegmentedControlStyle:UISegmentedControlStyleBar];
	
	[ColorButton setTintColor:[UIColor darkGrayColor]];
	
	[self.view addSubview:ColorButton];
}
-(void)segmentColorButton:(id)sender
{
	Segment = [sender selectedSegmentIndex] ;
	switch (Segment)
	{
		case 0:
			labelColor.text=@"颜色:黑色";
			labelColor.textColor=[UIColor blackColor];
			break;
		case 1:
			labelColor.text=@"颜色:红色";
			labelColor.textColor=[UIColor redColor];
			break;
		case 2:
			labelColor.text=@"颜色:藍色";
			labelColor.textColor=[UIColor blueColor];
			break;
		case 3:
			labelColor.text=@"颜色:綠色";
			labelColor.textColor=[UIColor greenColor];
			break;
		case 4:
			labelColor.text=@"颜色:黄色";
			labelColor.textColor=[UIColor yellowColor];
			break;
		case 5:
			labelColor.text=@"颜色:橙色";
			labelColor.textColor=[UIColor orangeColor];
			break;
		case 6:
			labelColor.text=@"颜色:灰色";
			labelColor.textColor=[UIColor grayColor];
			break;
		case 7:
			labelColor.text=@"颜色:紫色";
			labelColor.textColor=[UIColor purpleColor];
			break;
		case 8:
			labelColor.text=@"颜色:棕色";
			labelColor.textColor=[UIColor brownColor];
			break;
		case 9:
			labelColor.text=@"颜色:粉红色";
			labelColor.textColor=[UIColor magentaColor];
			break;
		default:
			break;
	}
}
//====================================================================
-(void)segmentWidth
{
	NSArray * segmentArray=[NSArray arrayWithObjects:@"1.0",@"2.0",@"3.0",@"4.0",@"5.0",@"6.0",@"7.0",@"8.0",@"9.0",@"12.0", nil];
    
    
    
    
	WidthButton=[[UISegmentedControl alloc] initWithItems:segmentArray];
	CGRect ButtonRect=CGRectMake(0, 420, 320, 40);
	[WidthButton setFrame:ButtonRect];
	[WidthButton setMomentary:YES];
	[WidthButton addTarget:self action:@selector(segmentWidthButton:) 
		  forControlEvents:UIControlEventValueChanged];
	
	[WidthButton setSegmentedControlStyle:UISegmentedControlStyleBar];
	[WidthButton setTintColor:[UIColor darkGrayColor]];
	
	[self.view addSubview:WidthButton];
}
-(void)segmentWidthButton:(id)sender
{
	SegmentWidth =[sender selectedSegmentIndex];
	switch (SegmentWidth)
	{
		case 0:
			labelLoanshift.text=@"字級:1.0";
		//	labelColor.textColor=[UIColor blackColor];
			break;
		case 1:
			labelLoanshift.text=@"字級:2.0";
		//	labelColor.textColor=[UIColor redColor];
			break;
		case 2:
			labelLoanshift.text=@"字級:3.0";
		//	labelColor.textColor=[UIColor blueColor];
			break;
		case 3:
			labelLoanshift.text=@"字級:4.0";
		//	labelColor.textColor=[UIColor greenColor];
			break;
		case 4:
			labelLoanshift.text=@"字級:5.0";
		///	labelColor.textColor=[UIColor yellowColor];
			break;
		case 5:
			labelLoanshift.text=@"字級:6.0";
		//	labelColor.textColor=[UIColor orangeColor];
			break;
		case 6:
			labelLoanshift.text=@"字級:7.0";
		//	labelColor.textColor=[UIColor grayColor];
			break;
		case 7:
			labelLoanshift.text=@"字級:8.0";
		//	labelColor.textColor=[UIColor purpleColor];
			break;
		case 8:
			labelLoanshift.text=@"字級:9.0";
		//	labelColor.textColor=[UIColor brownColor];
			break;
		case 9:
			labelLoanshift.text=@"字級:12.0";
		//	labelColor.textColor=[UIColor magentaColor];
			break;
		default:
			break;
	}

	
}
//******************************************************************************************
-(IBAction)captureScreen
{
	//保存瞬间把view上的所有按钮的Alpha值改为０
	[[self.view subviews] makeObjectsPerformSelector:@selector (setAlpha:)];
	
	UIGraphicsBeginImageContext(self.view.bounds.size);
	
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
	//遍历view全部按钮在把他们改为１
	for (UIView* temp in [self.view subviews]) 
	{
		[temp setAlpha:1.0];
	}
	
	
}

-(IBAction)callCame
{
	//指定图片来源
	UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
	//判断如果摄像机不能用图片来源与图片库
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
	}
	UIImagePickerController *picker=[[UIImagePickerController alloc] init];
	picker.delegate=self;
	//前后摄像机
	//picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
	picker.allowsEditing=YES;
	picker.sourceType=sourceType;
    [self presentViewController:picker animated:YES completion:nil];
	
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	//返回原来界面
	//[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
	//
	UIImage* image=[info objectForKey:UIImagePickerControllerEditedImage];
	//延时
	[self performSelector:@selector(saveImage:) withObject:image afterDelay:0.5];
	
}
//按取消键时
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	//[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//保存图片
-(void)saveImage:(id)sender
{
	
	if (pickImage!=nil)
	{
		[pickImage removeFromSuperview];
		//[pickImage initWithImage:sender];
		pickImage.frame=CGRectMake(40, 40, 200, 200);

		[self.view insertSubview:pickImage atIndex:2];
		//[self.view sendSubviewToBack:pickImage];//添加到最后一层
		//self.view.backgroundColor=[UIColor clearColor];
		//self.view.alpha=0;
		//[self.view addSubview:pickImage];
	
		
		
	}
	else 
	{
		pickImage=[[UIImageView alloc] initWithImage:sender];
		pickImage.frame=CGRectMake(40, 40, 200, 200);
		
		[self.view insertSubview:pickImage atIndex:2];
		//[self.view sendSubviewToBack:pickImage];//添加到最后一层
		//self.view.backgroundColor=[UIColor clearColor];
		//self.view.alpha=0;
		///[self.view addSubview:pickImage];
	}
}
//******************************************************************************************
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark -
//手指开始触屏开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

	[ColorButton removeAllSegments];
	[WidthButton removeAllSegments];
	UITouch* touch=[touches anyObject];
	MyBeganpoint=[touch locationInView:self.view ];
	
	[(Palette*)self.view Introductionpoint4:Segment];
	[(Palette*)self.view Introductionpoint5:SegmentWidth];
	[(Palette*)self.view Introductionpoint1];
	[(Palette*)self.view Introductionpoint3:MyBeganpoint];
	
	NSLog(@"======================================");
	NSLog(@"MyPalette Segment=%i",Segment);
}
//手指移动时候发出
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray* MovePointArray=[touches allObjects];
	MyMovepoint=[[MovePointArray objectAtIndex:0] locationInView:self.view];
	[(Palette*)self.view Introductionpoint3:MyMovepoint];
	[self.view setNeedsDisplay];
}
//当手指离开屏幕时候
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[(Palette*)self.view Introductionpoint2];
	[self.view setNeedsDisplay];
}
//电话呼入等事件取消时候发出
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	//NSLog(@"touches Canelled");
}
@end
