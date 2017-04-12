//
//  ViewController.m
//  图片分割
//
//  Created by 曾小华 on 2017/4/11.
//  Copyright © 2017年 曾小华. All rights reserved.
//


#import "ViewController.h"
#import "Masonry.h"
#import "myview.h"
@interface ViewController ()<UITextViewDelegate>{
    UITextView* textview1;
    UITextView* textview2;
    UITextView* textview3;
    UITextView* textview4;
}
@property(nonatomic ,strong) UIImageView* imageview;
@property(nonatomic ,strong) UIPanGestureRecognizer *pan;
@property(nonatomic ,strong) NSMutableArray *framewarray;
@property(nonatomic ,strong) NSMutableArray *frameharray;
@property(nonatomic ,strong) UIScrollView *labelscrollview;
@property(nonatomic ,strong) UIView *textbgview;
@property(nonatomic ,strong) UIButton *button;
@property(nonatomic,strong) myview *myview;
@property (nonatomic , strong) UIScrollView *scrollview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:self.imageview];
//
//    _myview.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
//    _myview.layer.shadowOffset = CGSizeMake(0, 0);//偏移距离
//    _myview.layer.shadowOpacity = 1;//不透明度
//    _myview.layer.shadowRadius = 10;//半径
    
    
    
    
    
    
    
    
    
    
    
    
    
    for (int i=0; i<2; i++) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(i*self.view.bounds.size.width/2, 20, self.view.bounds.size.width/2, 30)];
        label.tag=i;
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 5;
        label.layer.borderWidth = 1.0;
        label.layer.borderColor = [[UIColor grayColor] CGColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.backgroundColor=[UIColor groupTableViewBackgroundColor];
        label.font=[UIFont systemFontOfSize:26];
        if (label.tag==0) {
            label.text=[NSString stringWithFormat:@"width=%d",(int)self.sourceimage.size.width];
        }else{
            label.text=[NSString stringWithFormat:@"height=%d",(int)self.sourceimage.size.height];
        }
        [self.view addSubview:label];
    }

    
    
    
    //    w
    for (int i=1; i<=self.sourceimage.size.width;i++) {
        if ((int)(self.sourceimage.size.width-3)%i==0) {
            NSString *w=[NSString stringWithFormat:@"width = %d(w) * %d(n)",i,(int)self.sourceimage.size.width/i];
            [self.framewarray addObject:w];
        }
    }
    
    CGFloat numberx=0;
    for (NSString* wstring in self.framewarray) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, numberx,self.view.bounds.size.width/2-20, 20)];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 5;
        label.layer.borderWidth = 1.0;
        label.layer.borderColor = [[UIColor blackColor] CGColor];
        label.font=[UIFont systemFontOfSize:20];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=wstring;
        [self.labelscrollview addSubview:label];
        numberx+=25;
    }
    
    
//    h
    for (int i=1; i<=self.sourceimage.size.height;i++) {
        if ((int)(self.sourceimage.size.height-1)%i==0) {
            NSString *h=[NSString stringWithFormat:@"hight=%d(h)*%d(n)",i,(int)self.sourceimage.size.height/i];
            [self.frameharray addObject:h];
        }
    }
    CGFloat numbery=0;
    for (NSString* hstring in self.frameharray) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2+10,numbery,self.view.bounds.size.width/2-20, 20)];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 5;
        label.layer.borderWidth = 1.0;
        label.layer.borderColor = [[UIColor blackColor] CGColor];
        label.font=[UIFont systemFontOfSize:20];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=hstring;
        [self.labelscrollview addSubview:label];
        numbery+=25;
    }
    CGFloat fnumber;
    fnumber=numberx>numbery?numberx:numbery;
    self.labelscrollview.contentSize=CGSizeMake(0, fnumber);
    [self.view addSubview:self.labelscrollview];
    [self.labelscrollview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@100);
        make.top.equalTo(self.view).with.offset(60);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(100);
    }];
    
    [self.view addSubview:self.textbgview];
    [self.textbgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@100);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
    }];
    
    textview1=[self createtextview];
    textview2=[self createtextview];
    textview3=[self createtextview];
    textview4=[self createtextview];
    [self.textbgview addSubview:textview1];
    textview1.text=@"410";
    textview2.text=@"53";
    textview3.text=@"1109";
    textview4.text=@"1";
    [self.textbgview addSubview:textview2];
    [self.textbgview addSubview:textview3];
    [self.textbgview addSubview:textview4];
    [self registerForKeyboardNotifications];
    [textview1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
        make.top.equalTo(self.textbgview).with.offset(10);
        make.left.equalTo(self.textbgview.mas_left).with.offset(10);
        make.right.equalTo(textview2.mas_left).with.offset(-10);
        make.height.mas_equalTo(@30);
        make.width.equalTo(textview2);
    }];
    [textview2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
        make.top.equalTo(self.textbgview).with.offset(10);
        make.left.equalTo(textview1.mas_right).with.offset(10);
        make.right.equalTo(self.textbgview.mas_right).with.offset(-80);
        make.height.mas_equalTo(@30);
        make.width.equalTo(textview1);
    }];
    [textview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.top.equalTo(self.textbgview).with.offset(10);
        make.left.equalTo(self.textbgview.mas_left).with.offset(10);
        make.right.equalTo(textview4.mas_left).with.offset(-10);
        make.height.mas_equalTo(@30);
        make.width.equalTo(textview4);
        make.bottom.equalTo(self.textbgview).with.offset(-10);
    }];
    [textview4 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.top.equalTo(self.textbgview).with.offset(10);
        make.left.equalTo(textview3.mas_right).with.offset(10);
        make.right.equalTo(self.textbgview.mas_right).with.offset(-80);
        make.height.mas_equalTo(@30);
        make.width.equalTo(textview3);
        make.bottom.equalTo(self.textbgview).with.offset(-10);
    }];
  
    [self.textbgview addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@100);
//        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.textbgview).with.offset(-10);
//        make.bottom.equalTo(self.view).with.offset(0);
        make.centerY.mas_equalTo(self.textbgview.mas_centerY);
//        make.center.equalTo(self.textbgview).centerOffset(CGPointMake(0, 50));
        
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    CGRect contentrect=CGRectMake(0, 0, 21730/2,1108/2);
    //
    _myview=[[myview alloc]initWithFrame:contentrect];
    _scrollview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollview.userInteractionEnabled=YES;
    _scrollview.contentSize =CGSizeMake(_myview.bounds.size.width, 0);
    
    //右侧的滑动条
    _scrollview.showsVerticalScrollIndicator = NO;
    //    _scrollview.showsHorizontalScrollIndicator=NO;
    //    _scrollview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Shouye_ChangTu(1).jpg"]];
    [_scrollview addSubview:_myview];
    [self.view addSubview:self.scrollview];

}

-(NSMutableArray*)framewarray{
    if (!_framewarray) {
        _framewarray=[[NSMutableArray alloc]init];
    }
    return _framewarray;
}
-(NSMutableArray*)frameharray{
    if (!_frameharray) {
        _frameharray=[[NSMutableArray alloc]init];
    }
    return _frameharray;
}
-(UIButton*)button{
    if (!_button) {
        _button=[UIButton buttonWithType:UIButtonTypeSystem];
        _button.backgroundColor=[UIColor greenColor];
        [_button addTarget:self action:@selector(textview) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
-(void)textview{
    
//    NSLog(@"%@",textview1.text);
//    NSLog(@"%@",textview2.text);
//    NSLog(@"%@",textview3.text);
//    NSLog(@"%@",textview4.text);
//    UIImageView *imgview = [[UIImageView alloc] initWithImage:srcimg];
//    imgview.frame = CGRectMake(0, 0, imgview.bounds.size.width, imgview.bounds.size.height);
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.sourceimage.size.height, self.sourceimage.size.height)];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
//    UIPanGestureRecognizer *pan1=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [view addGestureRecognizer:self.pan];
    int number=0;
    for (int i=0; i<[textview2.text floatValue]; i++) {
        for (int j=0; j<[textview4.text floatValue]; j++) {
            CGRect rect =  CGRectMake(i*[textview1.text floatValue], j*[textview3.text floatValue], [textview1.text floatValue],[textview3.text floatValue]);//要裁剪的图片区域，按照原图的像素大小来，超过原图大小的边自动适配
            CGImageRef cgimg = CGImageCreateWithImageInRect([self.sourceimage CGImage], rect);
            NSData *data=UIImagePNGRepresentation([UIImage imageWithCGImage:cgimg]);
            NSString *File=[NSString stringWithFormat:@"/Users/zengxiaohua/Desktop/wenwutu/wenwuxiangqingyemianj%d_%d.jpg",i,j];
            [data writeToFile:File atomically:YES];
            //            if(number<96){
            UIImageView *imageview1=[[UIImageView alloc]initWithFrame:rect];
            imageview1.userInteractionEnabled=YES;
            imageview1.image = [UIImage imageWithCGImage:cgimg];
            
            [view addSubview:imageview1];
            //            }
            
            //用完一定要释放，否则内存泄露
            CGImageRelease(cgimg);
            number++;
        }
    }
    
    
    
}
-(UIView*)textbgview{
    if (!_textbgview) {
        _textbgview=[[UIView alloc]init];
        _textbgview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    }
    return _textbgview;
}
-(UIImage*)sourceimage{
    if (!_sourceimage) {
        _sourceimage=[UIImage imageNamed:@"422.jpg"];
    }
    return _sourceimage;
}
-(UIImageView*)imageview{
    if (!_imageview) {
        _imageview=[[UIImageView alloc]initWithImage:self.sourceimage];
        _imageview.userInteractionEnabled=YES;
        [_imageview addGestureRecognizer:self.pan];
    }
    return _imageview;
}
-(UIScrollView*)labelscrollview{
    if (!_labelscrollview) {
        _labelscrollview=[[UIScrollView alloc]init];
        _labelscrollview.layer.masksToBounds = YES;
        _labelscrollview.layer.cornerRadius = 5;
        _labelscrollview.layer.borderWidth = 1.0;
        _labelscrollview.layer.borderColor = [[UIColor grayColor] CGColor];
        _labelscrollview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    }
    return _labelscrollview;
}

-(UIPanGestureRecognizer*)pan{
    if (!_pan) {
        _pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    }
    return _pan;
}
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    //视图前置操作
    [recognizer.view.superview bringSubviewToFront:recognizer.view];
    CGPoint center = recognizer.view.center;
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];
}
-(UITextView*)createtextview{
   UITextView* textview = [[UITextView alloc] init];
    textview.backgroundColor=[UIColor grayColor]; //背景色
    textview.scrollEnabled = NO;    //当文字超过视图的边框时是否允许滑动，默认为“YES”
    textview.editable = YES;        //是否允许编辑内容，默认为“YES”
    textview.delegate = self;       //设置代理方法的实现类
    textview.font=[UIFont fontWithName:@"Arial" size:18.0]; //设置字体名字和字体大小;
    textview.returnKeyType = UIReturnKeyDefault;//return键的类型
    textview.keyboardType = UIKeyboardTypeDefault;//键盘类型
    textview.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
    textview.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
    textview.textColor = [UIColor blackColor];
    return textview;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)registerForKeyboardNotifications
{
    NSNotificationCenter *centter=[NSNotificationCenter defaultCenter];
    [centter addObserver:self selector:@selector(keyboardwillchangeframe:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
-(void)keyboardwillchangeframe:(NSNotification*)noteinfo{
    CGRect rectend=[noteinfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardhight=rectend.origin.y;
    self.textbgview.transform=CGAffineTransformMakeTranslation(0,keyboardhight-self.view.bounds.size.height);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
