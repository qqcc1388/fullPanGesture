UINavigationController系统自带有侧滑手势，但是这个手势第一点只能边缘侧滑才可以有效，第二点当手动隐藏系统的导航时，这个手势就不能生效了
为了能到达到全屏pop的效果这里有2中解决方案：
1、通过runtime拿到系统的侧滑手势，并把这个手势添加到UINavigationController的全屏view上(这里主要介绍这一种方案)
```
        //利用运行时动态拿到系统的侧滑手势 action + target  手动创建一个全屏的pan手势，响应事件用系统的
        //拿到interactivePopGestureRecognizer这个对象里面全部的属性
//        var count:UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//             //拿到ivar指针
//            let nameP = ivar_getName(ivars[Int(i)])
//            //根据指针找到对应的属性的字符串
//            let name = String(cString: nameP!)
//            print(name)
//        }
        guard  let targets = interactivePopGestureRecognizer?.value(forKey: "_targets") as?[AnyObject] else {
            return
        }
        //拿到 action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff515c0dc80>
        
        let dict = targets[0]
        //拿到action
        let target = dict.value(forKey: "target") as Any
        //通过字典无法拿到action，这里通过Selector方法包装action
        let action = Selector(("handleNavigationTransition:"))

        //拿到target action 创建pan手势并添加到全屏view上
        let gesture = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(gesture)
```

2、利用第三方[FDFullscreenPopGesture](https://github.com/forkingdog/FDFullscreenPopGesture)达到全屏侧滑手势的效果

```
viewController.fd_interactivePopDisabled = YES;

```
