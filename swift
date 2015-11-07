#Swift 语言中 类型后面的 ？和 ！ 有什么作用？  
在实际用Swift写CocoaTouch时，发现下面这样写才可以通过编译
var amiteLbl :UILabel?
self.amiteLbl = UILabel(frame:CGRectMake(50,100,200,40))
self.amiteLbl!.text = "I love mixbox"
self.view?.addSubview(self.amiteLbl)
这里不是很明白!号的意义。而在view addSubview 时却又加上了?号

请帮忙解释下 “！”在Swift里的意义
由于amiteLbl是可选变量，所以可能有值，也可能为nil。

使用self.amiteLbl!是明确声明此时self.amiteLbl里一定有值，无论什么情况都调用后面的.text赋值方法。
而使用self.view?是声明此时并不确定self.view里是否有值，所以只在view有值时调用后面.addSubview方法。
这样做的目的一是让代码更明确， 二是给编译器提供更多线索，在编译时发现更多潜在错误。
Swift显然是一门非常明确，需要开发者先想清楚再编程的语言，秉承了Apple一贯的作风：）
http://swiftist.org/topics/27#4
