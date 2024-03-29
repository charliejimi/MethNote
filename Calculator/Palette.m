//
//  Palette.m
//  MyPalette
//
//  Created by xiaozhu on 11-6-23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Palette.h"


@implementation Palette
@synthesize x;
@synthesize y;
@synthesize myallline=_myallline;
@synthesize myallColor=_myallColor;
@synthesize myallwidth=_myallwidth;

-(NSMutableArray*)myallwidth{
    if(_myallwidth==nil){
        _myallwidth=[[NSMutableArray alloc]init];
    }
    return _myallwidth;
}


-(NSMutableArray*)myallline{
    if(_myallline==nil){
        _myallline=[[NSMutableArray alloc]init];
    }
    return _myallline;
}

-(NSMutableArray*)myallColor{
    if(_myallColor==nil){
        _myallColor=[[NSMutableArray alloc]init];
    }
    return _myallColor;
}

- (id)initWithFrame:(CGRect)frame {
    
	NSLog(@"initwithframe");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
	
}
-(void)IntsegmentColor
{
	
    //NSLog(@"Thes is IntsegmentColor ");
    
    switch (Intsegmentcolor)
	{
		case 0:
			segmentColor=[[UIColor blackColor] CGColor];
			break;
		case 1:
			segmentColor=[[UIColor redColor] CGColor];
			break;
		case 2:
			segmentColor=[[UIColor blueColor] CGColor];

			break;
		case 3:
			segmentColor=[[UIColor greenColor] CGColor];
			break;
		case 4:
			segmentColor=[[UIColor yellowColor] CGColor];
			break;
		case 5:
			segmentColor=[[UIColor orangeColor] CGColor];
			break;
		case 6:
			segmentColor=[[UIColor grayColor] CGColor];
			break;
		case 7:
			segmentColor=[[UIColor purpleColor]CGColor];
			break;
		case 8:
			
			segmentColor=[[UIColor brownColor]CGColor];
			break;
		case 9:
			segmentColor=[[UIColor magentaColor]CGColor];
			break;
		case 10:
			segmentColor=[[UIColor whiteColor]CGColor];
			break;

		default:
			break;
	}
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect 
{
	//NSLog(@"Thes is drawRect ");
	//获取上下文
	CGContextRef context=UIGraphicsGetCurrentContext();
	//设置笔冒
	CGContextSetLineCap(context, kCGLineCapRound);
	//设置画线的连接处　拐点圆滑
	CGContextSetLineJoin(context, kCGLineJoinRound);
	//第一次时候个myallline开辟空间
	static BOOL allline=NO;
	if (allline==NO)
	{
		self.myallline=[[NSMutableArray alloc] initWithCapacity:10];
		self.myallColor=[[NSMutableArray alloc] initWithCapacity:10];
		self.myallwidth=[[NSMutableArray alloc] initWithCapacity:10];
		allline=YES;
	}
    
    //NSLog(@" allline= %d ",allline);
	//画之前线
    
    //NSLog(@" count allline= %d ",[myallline count]);

	if ([self.myallline count]>0)
	{
		for (int i=0; i<[self.myallline count]; i++)
		{
			NSArray* tempArray=[NSArray arrayWithArray:[self.myallline objectAtIndex:i]];
			//----------------------------------------------------------------
			if ([self.myallColor count]>0)
			{
				Intsegmentcolor=[[self.myallColor objectAtIndex:i] intValue];
				Intsegmentwidth=[[self.myallwidth objectAtIndex:i]floatValue]+1;
			}
			//-----------------------------------------------------------------
			if ([tempArray count]>1)
			{
				CGContextBeginPath(context);
				CGPoint myStartPoint=[[tempArray objectAtIndex:0] CGPointValue];
				CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
				
				for (int j=0; j<[tempArray count]-1; j++)
				{
					CGPoint myEndPoint=[[tempArray objectAtIndex:j+1] CGPointValue];
					//--------------------------------------------------------
					CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);	
				}
				[self IntsegmentColor];
				CGContextSetStrokeColorWithColor(context, segmentColor);
				//-------------------------------------------------------
				CGContextSetLineWidth(context, Intsegmentwidth);
				CGContextStrokePath(context);
			}
		}
	}
	//画当前的线
	if ([myallpoint count]>1)
	{
		CGContextBeginPath(context);
		//-------------------------
		//起点
		//------------------------
		CGPoint myStartPoint=[[myallpoint objectAtIndex:0]   CGPointValue];
		CGContextMoveToPoint(context,    myStartPoint.x, myStartPoint.y);
		//把move的点全部加入　数组
		for (int i=0; i<[myallpoint count]-1; i++)
		{
			CGPoint myEndPoint=  [[myallpoint objectAtIndex:i+1] CGPointValue];
			CGContextAddLineToPoint(context, myEndPoint.x,   myEndPoint.y);
		}
		//在颜色和画笔大小数组里面取不相应的值
		Intsegmentcolor=[[self.myallColor lastObject] intValue];
		Intsegmentwidth=[[self.myallwidth lastObject]floatValue]+1;
		
		//-------------------------------------------
		//绘制画笔颜色
		[self IntsegmentColor];
		CGContextSetStrokeColorWithColor(context, segmentColor);
		CGContextSetFillColorWithColor (context,  segmentColor);
		//-------------------------------------------
		//绘制画笔宽度
		CGContextSetLineWidth(context, Intsegmentwidth);
		//把数组里面的点全部画出来
		CGContextStrokePath(context);
	}
}
//===========================================================
//初始化
//===========================================================
-(void)Introductionpoint1
{
	//NSLog(@"in init allPoint");
	myallpoint=[[NSMutableArray alloc] initWithCapacity:10];
    
    
}
//===========================================================
//把画过的当前线放入　存放线的数组
//===========================================================
-(void)Introductionpoint2
{
	//NSLog(@" position myallpoint= %p ",self.myallline);
    
//    if ([self.myallline isEqual:nil]) {
//        NSLog(@" position myallpoint= %p ",self.myallline);
//    }
    [self.myallline addObject:myallpoint];
    
    
    //NSLog(@" count allline= %d ",[self.myallline count]);

}
-(void)Introductionpoint3:(CGPoint)sender
{
	//NSLog(@" Introductionpoint3 ");
    NSValue* pointvalue=[NSValue valueWithCGPoint:sender];
	[myallpoint addObject:pointvalue];
    
    //NSLog(@" count myallpoint= %d ",[myallpoint count]);
    
}
//===========================================================
//接收颜色segement反过来的值
//===========================================================
-(void)Introductionpoint4:(int)sender
{
	    //NSLog(@"Palette sender:%i", sender);
       
    NSNumber* Numbersender= [NSNumber numberWithInt:sender];
	[self.myallColor addObject:Numbersender];
    
    NSLog(@" count myallColor= %d ",[self.myallColor count]);


}
//===========================================================
//接收线条宽度按钮反回来的值
//===========================================================
-(void)Introductionpoint5:(int)sender
{
	//NSLog(@"Palette sender:%i", sender);
	NSNumber* Numbersender= [NSNumber numberWithInt:sender];
	[self.myallwidth addObject:Numbersender];
}
//===========================================================
//清屏按钮
//===========================================================
-(void)myalllineclear
{
	if ([self.myallline count]>0)
	{
		[self.myallline removeAllObjects];
		[self.myallColor removeAllObjects];
		[self.myallwidth removeAllObjects];
		[myallpoint removeAllObjects];
		self.myallline=[[NSMutableArray alloc] initWithCapacity:10];
		self.myallColor=[[NSMutableArray alloc] initWithCapacity:10];
		self.myallwidth=[[NSMutableArray alloc] initWithCapacity:10];
		[self setNeedsDisplay];
	}
}
//===========================================================
//撤销
//===========================================================
-(void)myLineFinallyRemove
{
	if ([self.myallline count]>0)
	{
		[self.myallline  removeLastObject];
		[self.myallColor removeLastObject];
		[self.myallwidth removeLastObject];
		[myallpoint removeAllObjects];
	}
	[self setNeedsDisplay];	
}
//===========================================================
//橡皮擦　segmentColor=[[UIColor whiteColor]CGColor];
//===========================================================
//-(void)myrubberseraser
//{
//	segmentColor=[[UIColor whiteColor]CGColor];
//}
-(void)button
{
	NSLog(@"button");
	
	//[self setNeedsDisplay];
}


@end
