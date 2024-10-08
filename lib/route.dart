import "package:flutter/material.dart";
import 'package:open_language/pages/login/home_page.dart';
import 'package:open_language/pages/login/other_page.dart';
import 'package:open_language/pages/space/space_page.dart';
import 'package:open_language/pages/home/home.dart';
import 'package:open_language/pages/login/app_index.dart';

///定义路由
Map<String, WidgetBuilder> routes = {
  "/check": (context) => const AppIndexPage(),

  // login 首页. app的默认路由页面
  "/loginHome": (context) => const LoginHome(),
  // login 其他页面
  "/loginOther": (context) => const LoginOtherPage(),
  // 邮箱+密码登录页
  // "/loginEmailPassword": (context) => EmailPasswordPage(),
  // 手机+密码登录页
  // 邮箱+验证码登录页

  // space 首页
  "/space": (context) => const SpaceHome(),
  // 选择language category
  // 1. 使用的语言，传递所有语言
  // 2. 学习的语言, 排除使用的语言
  // "/language": (context) => LanguagePage(),

  "/home": (context, {arguments}) => MyHomePage(
        arguments: arguments,
      ),
};

// ，onGenerateRoute属性是MaterialApp或者CupertinoApp的一个回调函数，它用于在应用中动态生成路由。当使用Navigator.pushNamed跳转到一个命名路由时，如果该命名路由没有在routes表中直接定义，Flutter会调用onGenerateRoute来生成对应的页面路由。

// RouteSettings包含了路由的配置信息，如路由名称（name）和传递给路由的参数（arguments）。
var onGenerateRoute22 = (RouteSettings settings) {
  // 这个name就是路由的路径/news
  final String? name = settings.name;
  // 这个是传递过来的参数 settings.arguments

  //获取route map中路径对应的函数
  final Function? pageContentBuilder = routes[name];

  //如果路由对应的函数存在时进行处理
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      //判断传递的参数不为空时处理
      // MaterialPageRoute是一个泛型类，用于在Flutter中实现页面路由。它提供了页面进入和退出时的标准材料设计动画。
// 它是使用名为builder的命名参数构造的，这个builder参数是一个函数，它返回应该被导航到的Widget。
      print("----> $name ${settings.arguments}");
      final Route route = MaterialPageRoute(
          // builder函数：

//这个builder函数是一个构造函数，它的任务是构建即将显示的页面。
//这个函数接收一个BuildContext参数，通常命名为context。BuildContext是Flutter框架中一个非常核心的概念，它在构建组件树////（Widget tree）时代表了当前widget的位置。
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      //参数为空时处理
      print("----> $name");
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      //相当于
      // MaterialPageRoute(builder: (context){return NewsPage()});
      return route;
    }
  }
  return null;
};
