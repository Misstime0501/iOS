# iOS 中的属性

### atomic:
    原子操作（原子性是指事务的一个完整操作，操作成功就提交，反之就回滚。原子操作就是指具有原子性的操作）在 objective-c 属性设置里面默认的就是 atomic，意思就是 setter/getter 函数是一个原子操作，如果多线程同时调用 setter 时，不会出现某一个线程执行完 setter 所有语句之前，另一个线程就开始执行 setter ，相当于函数头尾加了锁。这样的话并发访问性能会比较低。

### nonatomic: 
	非原子操作一般不需要多线程支持的时候就用它，这样在并发访问的时候效率会比较高。 在 objective-c 里面通常对象类型都应该声明为非原子性的。 iOS 中程序启动的时候系统只会自动生成一个单一的主线程。程序在执行的时候一般情况下是在同一个线程里面对一个属性进行操作。如果在程序中我们确定某一个属性会在多线程中被使用，并且需要做数据同步，就必须设置成原子性的，但也可以设置成非原子性的，然后自己在程序中用加锁之类的来做数据同步。通常说 nonatomic 是提高在非多线程应用中的读写效率。
	
	在头文件中声明属性的时候使用 atomic 和 nonatomic 等价于在头文件里面添加 2 个函数一个是用于设置这个属性的，一个是用于读取这个属性，例如：- (nsstring *)name; - (void)setName:(NSString *)str;

	atomic / nonatomic 需要和@synthesize/@dynamic配和使用才有意义。

### readwrite
	如果没有声明成readonly，那就默认是readwrite。可以用来赋值，也可以被赋值。

### readonly
	只可以取值，不可以被赋值。
		
### assign
	所有属性都默认assign，通常用于标量（简单变量 int， float，CGRect等）,只是简单的传递指针。一种典型情况是用在对对象没有所有权的时候，通常是 delegate ，避免造成死循环（如果用 retain 的话会死循环）。

### retain
	属性必须是 objc 对象，拥有对象所有权，必须在 dealloc 中 release 一次，是在传递指针后 retainCount +1 。

### copy
	属性必须是 objc 对象，拥有对象所有权，必须在 dealloc 中 release 一次。且属性必须实现 NSCopying 协议一般常用于 NSString 类型，是创建分配一个新的空间，从原址的内容复制内容过来。
	
### dynamic
	@dynamic 表示变量对应的属性访问器方法，是动态实现的，你需要在 NSObject 中继承而来的 
	+ (BOOL)resolveInstanceMethod:(SEL)sel 方法中指定动态实现的方法或者函数。
	
### synthesize
	@synthesize 如果不实现 setter 和 getter 方法，编译器将会自动在生产 setter 和 getter 方法。
	
	属性修饰其他关键字：
	
	getter = getterName
	指定 get 方法，并需要实现这个方法。必须返回与声明类型相同的变量，没有参数。

	setter = setterName
	指定 set 方法，并需要实现这个方法。带一个与声明类型相同的参数，没有返回值（返回空值）。
	当声明为 readonly 的时候，不能指定 set 方法。








<!--NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)myObject))-->


#### dealloc 后 relase 的事情，建议是在每个 object 的 .m 文件里完成对像销毁。谁创建的对象谁负责销毁，谁 retain 谁来 release 。
