# iOS 中的内存管理

iOS 的对象都继承于 NSObject , 该对象有一个方法: retainCount ，内存引用计数。

一般情况下

alloc 对象分配后引用计数为 1

retain 对象的引用计数 +1

copy 一个对象变成新的对象(新内存地址)，引用计数为 1 原来对象计数不变

release 对象引用计数 -1 如果为 0 释放内存

autorelease 对象引用计数 -1 如果为 0 不马上释放，最近一个 pool 时释放

NSLog(@"sMessage retainCount:%u",[sMessage retainCount]);





内存管理的原则就是最终的引用计数要平衡，

如果最后引用计数大于 0 则会内存泄露，

如果引用计数等于 0 还对该对象进行操作，则会出现内存访问失败，crash 所以尽量设置为 nil 。

这两个问题都很严重，所以请一定注意内存释放和不用过后设置为 nil 。

<!--NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)myObject))-->




asssign 相于于指针赋值，不对引用计数进行操作，注意原对象不用了，一定要把这个设置为nil
// assign
-(void)setTestObject :(id)newValue{
testObject= newValue;
}

retain 相当于对原对象的引用计数加1
// retain
-(void)setTestObject :(id)newValue{
if (testObject!= newValue) {
[testObject release];
testObject= [newValue retain];
}
}

copy 不对原对象的引用计数改变，生成一个新对象引用计数为1
// copy
-(void)setTestObject :(id)newValue{
if (testObject != newValue) {
[testObject release];
testObject = [newValue copy];
}
}




注意:
self.testObject 左值调用的是setTestObject 方法. 右值为get方法，get 方法比较简单不用说了
而 真接testObject 使用的是成员变量
self.testObject = [[testObject alloc] init]; // 错 reatin 两次
testObject = [NSArray objectbyindex:0]; //错 不安全，没有retain 后面release会出错
如果testObject已有值也会mem leak





copy 和 retain 的区别
copy： 建立一个索引计数为 1 的对象，然后释放旧对象
retain：释放旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为 1
那上面的是什么该死的意思呢？


Copy其实是建立了一个相同的对象，而retain不是：

比如一个NSString对象，地址为0×1111，内容为@”STR”
Copy到另外一个NSString之后，地址为0×2222，内容相同，新的对象retain为1，旧有对象没有变化

-----------------------------------------------------------


retain到另外一个NSString之后，地址相同（建立一个指针，指针拷贝），内容当然相同，这个对象的retain值+1

也就是说，

retain是指针拷贝，copy是内容拷贝。

哇，比想象的简单多了…




Cocoa不同内存管理环境下的autorelease
H 混合内存管理环境：垃圾收集法（Garbage Collection）+索引计数法（Reference Counting）
虽然大多数情况下混合环境是不被推荐的，但是如果在这个情况下，autorelease需要注意以下事项：
垃圾收集混合环境下：应该使用drain方法，因为release在GC模式下没有意义
索引计数环境下：drain和release对于autoreleasepool（自动释放池）的效果相同



Interface Builder参与的内存管理问题
要点：
如果一个变量在类中被定义为了 IBOutlet 那么你无需对其进行实例化，xib载入器会对其初始化。
如果一个变量在类中被定义为了 IBOutlet 那么你必须负责将其释放。xib载入器不会帮忙的… …
*切不要初始化两回，内存会溢出，而且对象锁定也会出错。




关于索引计数（Reference Counting）的问题

view plaincopy to clipboardprint?

1.  *retain值 = 索引计数//（Reference Counting）

*retain值 = 索引计数//（Reference Counting）

NSArray对象会retain（retain值加一）任何数组中的对象。当NSArray被卸载（dealloc）的时候，所有数组中的对象会被执行一次释放（retain值减一）。不仅仅是NSArray，任何收集类（Collection Classes）都执行类似操作。例如NSDictionary，甚至UINavigationController。

Alloc/init建立的对象，索引计数为1。无需将其再次retain。

[NSArray array]和[NSDate date]等“方法”建立一个索引计数为1的对象，但是也是一个自动释放对象。所以是本地临时对象，
那么无所谓了。如果是打算在全Class中使用的变量（iVar），则必须retain它。

缺省的类方法返回值都被执行了“自动释放”方法。（*如上中的NSArray）
在类中的卸载方法“dealloc”中，release所有未被平衡的NS对象。（*所有未被autorelease，而retain值为1的）





NSString的内存管理
如下实例：

1.  aString = @"I am a string that 2 years old, man!";

aString = @"I am a string that 2 years old, man!";

这种情况下，字符串储存和管理由系统做，我们不用操心。


1.  aString = [NSString stringWithFormat:@"I am a string that %d years old, man!",2];

aString = [NSString stringWithFormat:@"I am a string that %d years old, man!",2];

第二种情况下，我们需要去retain和release这个字符串，系统不管。



Objective-C内存管理
1，你初始化（alloc/init）的对象，你需要释放（release）它。例如：

1.  NSMutableArray aArray = [[NSArray alloc] init];

NSMutableArray aArray = [[NSArray alloc] init];

后，需要

1.  [aArray release];

[aArray release];

2，你retain或copy的，你需要释放它。例如：

1.  [aArray retain]

[aArray retain]

后，需要

1.  [aArray release];

[aArray release];

3，被传递(assign)的对象，你需要斟酌的retain和release。例如：

1.  obj2 = [[obj1 someMethod] autorelease];

obj2 = [[obj1 someMethod] autorelease];

对象2接收对象1的一个自动释放的值，或传递一个基本数据类型（NSInteger，NSString）时： 你或希望将对象2进行retain，以防止它在被使用之前就被自动释放掉。但是在retain后，一定要在适当的时候进行释放。

为什么不能直接调用dealloc而是release
dealloc不等于C中的free，dealloc并不将内存释放，也不会将索引计数（Reference counting）降低。于是直接调用dealloc反而无法释放内存。
在Objective-C中，索引计数是起决定性作用的。





strong 和weak

iOS 5 中对属性的设置新增了strong 和 weak 关键字来修饰属性（iOS 5 之前不支持ARC）

strong 用来修饰强引用的属性；

@property (strong) SomeClass * aObject;
对应原来的
@property (retain) SomeClass * aObject; 和 @property (copy) SomeClass * aObject;

weak 用来修饰弱引用的属性；
@property (weak) SomeClass * aObject;
对应原来的
@property (assign) SomeClass * aObject;




