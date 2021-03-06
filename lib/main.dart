import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
//gxw- for study flutter  void main() => runApp(new MyApp());


/**
 * runApp(根widget)
 *
 */

void main() => runApp(

     new MaterialApp(
       home:new LayoutDemoForContrainedBox(),
)

);

//SizeBox,如何指定了宽高，则child就是这个宽高，如果没有指定，SizeBox随child的宽高而变化
class LayoutDemoForSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SizedBox设置具体尺寸示例'),
      ),
      body: SizedBox(
        //固定宽为200.0 高为300.0
        width: 200.0,
        height: 300.0,
        child: const Card(
            child: Text('SizedBox',
              style: TextStyle(
                fontSize: 36.0,
              ),
            )),
      ),
    );
  }
}



class LayoutDemoForContrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ConstrainedBox限定宽高示例'),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 50.0,
          minHeight: 50.0,
          maxWidth: 300.0,
          maxHeight: 300.0,
        ),
       child: new Container(
          width: 300.0,
          height: 300.0,
          color: Colors.red,
        ),
      ),
    );
  }
}


class LayoutDemoForOverFlowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('OverflowBox溢出父容器显示示例'),
        ),
        body: Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(50.0),
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: 400.0,
            maxHeight: 250.0,
            child: Container(
              color: Colors.blueGrey,
              width: 280.0,
              height: 280.0,
            ),
          ),
        ));
  }
}



class MyAppForStackIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var stack = new IndexedStack(
      index: 1,//设置索引为1就只显示文本内容了
      alignment: const FractionalOffset(0.2, 0.2),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/1.jpeg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Text(
            '我是超级飞侠',
            style: new TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack层叠布局示例'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}




class MyAppForStackPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('层叠定位布局示例'),
      ),
      body: new Center(
        //添加层叠布局
        child: new Stack(
          children: <Widget>[
            //添加网络图片
            new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541655494719&di=6b49d24b5172a34828b9d6506e4bf100&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn11%2F266%2Fw640h426%2F20180813%2Fce56-hhqtawx8254771.jpg'),
            //设置定位布局
            new Positioned(
                bottom: 100.0,
                right: 50.0,
                child: new Text(
                  'hi flutter',
                  style: new TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Colors.white,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}


//Stack容器用Alignment来定位子布局的位置
class MyAppForStackAlignmeng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //相当于Android中的Fragment
    var stack = new Stack(
      //子组件左上角对齐
      alignment: Alignment.bottomRight,
      children: <Widget>[
        //底部添加一个头像
        new CircleAvatar(
          backgroundImage: new AssetImage('images/1.jpeg'),
          radius: 100.0,
        ),
        //上面加一个容器 容器里再放一个文本
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Text(
            '我是超级飞侠',
            style: new TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack层叠布局示例'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}


class LayoutDemoForFitterBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FittedBox缩放布局示例'),
      ),
      body: new Container(
        color: Colors.grey,
        width: 250.0,
        height: 250.0,
        child: new FittedBox(
          fit: BoxFit.contain, //尽可能大的填充空间，等比缩放
          alignment: Alignment.center,
          child: new Container(
            color: Colors.deepOrange,
            child: new Text("缩放布局"),
          ),
        ),
      ),
    );
  }
}




class LayoutDemoForColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局示例一'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Flutter'),
          new Text('垂直布局'),
          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain,  //内容尽可能大的天填充剩余空间Expanded
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );

  }
}

class LayoutDemoForColumn2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局示例二'),
      ),
      //文本按重起方向排列
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,//水平方向靠左对齐
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text('Flutter是谷歌的移动UI框架'),
          new Text('可以快速在iOS和Android上构建高质量的原生用户界面'),
          new Text('Flutter可以与现有的代码一起工作。在全世界'),
          new Text('Flutter正在被越来越多的开发者和组织使用'),
          new Text('并且Flutter是完全免费、开源的。'),
          new Text('Flutter!', style: TextStyle(fontSize: 36.0,)),//放大字号
        ],
      ),
    );

  }
}
class LayoutDemoForRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('水平布局示例'),
      ),
      body: new Row(
        children: <Widget>[
          new Expanded(
            child: new Text('左侧文本', textAlign: TextAlign.center),
            flex: 4,
          ),
          new Expanded(
            child: new Text('中间文本', textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );

  }
}

//ALIGN START
class LayoutDemoForAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Align对齐布局示例'),
      ),
      body: new Stack(
          children: <Widget>[
            //左上角
            new Align(
              alignment: new FractionalOffset(0.0, 0.0),
              child: new Image.asset('images/1.jpeg',width: 128.0,height: 128.0,),
            ),
            //右上角
            new Align(
              alignment: FractionalOffset(1.0,0.0),
              child: new Image.asset('images/1.jpeg',width: 128.0,height: 128.0,),
            ),
            //水平垂直方向居中
            new Align(
              alignment: FractionalOffset.center,
              child: new Image.asset('images/3.jpeg',width: 128.0,height: 128.0,),
            ),
            //左下角
            new Align(
              alignment: FractionalOffset.bottomLeft,
              child: new Image.asset('images/2.jpeg',width: 128.0,height: 128.0,),
            ),
            //右下角
            new Align(
              alignment: FractionalOffset.bottomRight,
              child: new Image.asset('images/2.jpeg',width: 128.0,height: 128.0,),
            ),
          ]
      ),
    );
  }
}
//ALIGN END
class LayoutDemoForPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Padding填充布局示例'),
      ),
      body: new Center(

        child: new Container(
          width: 300.0,
          height: 300.0,
          padding: EdgeInsets.all(6.0),//容器填充上下左右设置为60.0
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
              color: Colors.green,
              width: 8.0,
            ),
          ),
          child: new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                color: Colors.blue,
                width: 8.0,
              ),
            ),
            child: new FlutterLogo(),
          ),
        ),
      ),
    );
  }
}






//Center Widget START
class LayoutDemoForCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Center居中布局示例'),
      ),
      body: new Center(
        child: new Text(
          'Hello Flutter',
          style:  TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
//Center Widget END

//Container START
class LayoutDemoForContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //返回一个Container对象
    Widget container = new Container(
      //添加装饰效果
      decoration: new BoxDecoration(
        color: Colors.grey,
      ),
      //子元素指定为一个垂直水平嵌套布局的组件
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              //使用Expanded防止内容溢出
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  //添加边框样式
                  decoration: new BoxDecoration(
                    //上下左右边框设置为宽度10.0 颜色为蓝灰色
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    //上下左右边框弧度设置为8.0
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  //上下左右增加边距
                  margin: const EdgeInsets.all(4.0),
                  //添加图片
                  child: new Image.asset('images/1.jpeg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/2.jpeg'),
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/3.jpeg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/2.jpeg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Container布局容器示例'),
      ),
      body:  Center(
      child:container,
      )
    );
  }
}
//Container END

class MyAppForCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var card = new SizedBox(
      height: 250.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                '深圳市南山区深南大道35号',style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('创想科技有限公司'),
              leading: new Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                '深圳市罗湖区沿海大道32号',style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text('一木培训机构'),
              leading: new Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),

          ],
        ),
      ),
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Card布局示例'),
      ),
      body:  Center(
        child: card,
      ),
    );
  }
}

//SnackBar START

class MyAppForSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar示例'),
        ),
        body: Center(
          child: Text(
            'SnackBar示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              //点击回调事件 弹出一句提示语句
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("显示SnackBar"),
              ));
            },
            shape: new CircleBorder(),
          );
        }),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniStartTop, //居中放置 位置可以设置成左中右
      ),
    );
  }
}
//SnackBar END


//MyAppForAlertDlg START
class MyAppForAlertDlg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupMenuButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButton组件示例'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('提示'), //对话框标题
            content: SingleChildScrollView(
//对话框内容部分
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除?'),
                  Text('一旦删除数据不可恢复！'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//MyAppForAlertDlg END






//MyAppForSimpleDlg
class MyAppForSimpleDlg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupMenuButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButton组件示例'),
        ),
        body: Center(
          child: SimpleDialog(
            title: const Text('对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {  },
                child: const Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: () {  },
                child: const Text('第二行信息'),
              ),
            ],
          ),



        ),
      ),
    );
  }
}





//会控菜单项START
enum ConferenceItem { AddMember, LockConference, ModifyLayout, TurnoffAll }

class MyAppForPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupMenuButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButton组件示例'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {},
            child: PopupMenuButton<ConferenceItem>(
              onSelected: (ConferenceItem result) {},
              itemBuilder: (BuildContext context) =>//菜单项构造器
              <PopupMenuEntry<ConferenceItem>>[
                const PopupMenuItem<ConferenceItem>(//菜单项
                  value: ConferenceItem.AddMember,
                  child: Text('添加成员'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.LockConference,
                  child: Text('锁定会议'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.ModifyLayout,
                  child: Text('修改布局'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.TurnoffAll,
                  child: Text('挂断所有'),
                ),
              ],
            ),
          ),



        ),
      ),
    );
  }
}


//fab start
class MyAppFloatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(

       child:    FlatButton(
            onPressed: () {},
            child: Text(
              'FlatButton',
              style: TextStyle(fontSize: 24.0,color: Colors.red
              ),
            ),
          ),

        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
            child: const Icon(Icons.add),
            //提示信息
            tooltip: "请点击FloatingActionButton",
            //前景色为白色
            foregroundColor: Colors.white,
            //背景色为蓝色
            backgroundColor: Colors.blue,
            //未点击阴影值
            elevation: 7.0,
            //点击阴影值
            highlightElevation: 14.0,
            onPressed: () {
              //点击回调事件 弹出一句提示语句
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("你点击了FloatingActionButton"),
              ));
            },
            mini: true,
            //圆形边
            shape: new CircleBorder(),
            isExtended: true,
          );
        }),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat, //居中放置 位置可以设置成左中右
      ),
    );
  }
}//fab end

//drawer start
class LayoutDemoDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息 头像、用户名、Email等
            UserAccountsDrawerHeader(
              accountName: new Text(
                "玄微子",
              ),
              accountEmail: new Text(
                "xuanweizi@163.com",
              ),
              //设置当前用户头像
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("images/1.jpeg"),
              ),
              onDetailsPressed: () {},
              //属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('images/code.jpeg'),
                ),
              ],
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens)),//导航栏菜单
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo)),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi)),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );

  }
}

//drawer end



//tabBar START
class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //添加DefaultTabController关联TabBar及TabBarView
      home: new DefaultTabController(
        length: items.length,//传入选项卡数量
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('TabBar选项卡示例'),
            bottom: new TabBar(
              isScrollable: false,//设置为可以滚动
              tabs: items.map((ItemView item) {//迭代添加选项卡子项
                return new Tab(
                  text: item.title,
                  icon: new Icon(item.icon),
                );
              }).toList(),
            ),
          ),
          //添加选项卡视图
          body: new TabBarView(
            children: items.map((ItemView item) {//迭代显示选项卡视图
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new SelectedView(item: item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

//视图项数据
class ItemView {
  const ItemView({ this.title, this.icon });//构造方法
  final String title;//标题
  final IconData icon;//图标
}

//选项卡的类目
const List<ItemView> items = const <ItemView>[
  const ItemView(title: '自驾', icon: Icons.directions_car),
  const ItemView(title: '自行车', icon: Icons.directions_bike),
  const ItemView(title: '轮船', icon: Icons.directions_boat),
  const ItemView(title: '公交车', icon: Icons.directions_bus),
  const ItemView(title: '火车', icon: Icons.directions_railway),
  const ItemView(title: '步行', icon: Icons.directions_walk),
];

//被选中的视图
class SelectedView extends StatelessWidget {
  const SelectedView({ Key key, this.item }) : super(key: key);

  //视图数据
  final ItemView item;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,//垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center,//水平方向居中对齐
          children: <Widget>[
            new Icon(item.icon, size: 128.0, color: textStyle.color),
            new Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
//tabBar  END



//BottomNavigationBar Demo Start
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;//当前选中项的索引
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),//居中显示某一个文本
      ),
      //底部导航按钮 包含图标及文本
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')),
        ],
        currentIndex: _selectedIndex,//当前选中项的索引
        fixedColor: Colors.deepPurple,//选项中项的颜色
        onTap: _onItemTapped,//选择按下处理
      ),
    );
  }

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
//BottomNavigationBar Demo End



//AppBar demo start
class LayoutDemoForAppbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('AppBar应用按钮示例'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          ),
        ],
      ),

    );

  }
}
//AppBar demo end


//Scaffold实例START
class LayoutDemoForScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      //头部元素 比如：左侧返回按钮 中间标题 右侧菜单
      appBar: AppBar(
        title: Text('Scaffold脚手架组件示例'),
      ),
      //视图内容部分
      body: Center(
        child: Text('Scaffold'),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      //添加FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //FAB按钮居中展示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
//Scaffold实例END



/*class MyAppForRoute extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      theme:new ThemeData(primarySwatch: Colors.red),
      home: new MyHomePage(),
      title: 'MaterialApp示例',
      routes: {
        '/first': (BuildContext context) => FirstPage(), //添加路由
        '/second': (BuildContext context) => SecondPage(),
      },
      initialRoute: '/first',//初始路由页面为first页面
    );
  }
}

//这是一个可改变的Widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}*/

//第一个路由页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('这是第一页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //路由跳转到第二个页面
            Navigator.pushNamed(context, '/second');
          },
          child: new Text(
            '这是第first页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}

//第二个路由页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //路由跳转到第一个页面
            Navigator.pushNamed(context, '/first');
          },
          child: Text(
            '这是第二页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}


//Material design APP START
/*
class MyMeterialDesignApp extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
      title: 'MaterialApp示例',
    );
  }
}

//这是一个可改变的Widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}
*/


//Material design APP END


//表单START
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  //用户名
  String userName;

  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;

    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form表单示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form表单示例'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: loginKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(

                      decoration: new InputDecoration(
                        labelText: '请输入用户名',
                      ),
                      onSaved: (value) {
                        userName = value;
                      },
                      onFieldSubmitted: (value){

                      },
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        return value.length < 6 ? "密码长度不够6位" : null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            new SizedBox(
              width: 340.0,
              height: 42.0,
              child: new RaisedButton(
                onPressed: login,
                child: new Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//表单END



class RaiseButtonDemo extends StatelessWidget {

//iconButton
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标按钮组件示例'),
      ),
      body: new Center(
        child: new RaisedButton(
          color: Colors.green[500],
          child:new Text(
              'gaoxiaowei',

               style: new TextStyle(
              color: Colors.red[500]

               ),


          ),
          onPressed: () {
            print('按下操作');
          },
        ),
      ),
    );

  }
}



class LayoutDemo extends StatelessWidget {


/*ICON:
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标组件示例'),
      ),
      body: new Icon(Icons.phone,color: Colors.green[500],size: 80.0,),
    );

  }*/

//iconButton
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标按钮组件示例'),
      ),
      body: new Center(
        child: new IconButton(
          icon: Icon(Icons.volume_up,size: 48.0,),
          tooltip: '按下操作',
          onPressed: () {
            print('按下操作');
          },
        ),
      ),
    );

  }


}


//TEXT组件START
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(

      child:new Column(


              children:<Widget>[


                new Text(
                    "abc",
                     style: new TextStyle(
                       color: const Color(0xff00ff00),
                       decoration: TextDecoration.lineThrough,
                       decorationColor: const Color(0xff000000),
                       fontSize: 18

                     ),
                     textAlign: TextAlign.center,
                ),

                new Text(
                    "abcdef",
                     textAlign: TextAlign.right
                  ,
                )

              ]


      )


    );
  }
}
//TEXT组件end

//容器组件start
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(

      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
              color: Colors.green,
              width: 8.0,
            ),
            borderRadius: const BorderRadius.all(const  Radius.circular(48.0))
        ),
        child: new Center(
          child: new Text(
            'FlutterB',
            textAlign: TextAlign.center,
          ),

        )
      ),
    );
  }
}
//容器组件end

//HTTP CLIENT FOR MyApp  START
class MyAppForHttpClient extends StatelessWidget {

  //获取天气数据
  void getWeatherData() async {
    try {
      //实例化一个HttpClient对象
      HttpClient httpClient = new HttpClient();

      //发起请求
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));

      //等待服务器返回数据
      HttpClientResponse response = await request.close();

      //使用utf8.decoder从response里解析数据
      var result = await response.transform(utf8.decoder).join();
      //输出响应头
      print("请求成功"+result);

      //httpClient关闭
      httpClient.close();

    } catch (e) {
      print("请求失败：$e");
    } finally {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'httpclient请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('httpclient请求'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("获取天气数据"),
            onPressed: getWeatherData,
          ),
        ),
      ),
    );
  }
}

class T = S with A;//多继承，如果S与A有相同的函数，则会优先调研A

class S
{
  a()
  {
    print("gaoxiaoweiS:a");
  }
}


class A
{
  a()
  {
    print("gaoxiaoweiA:a");
  }

  b()
  {
    print("gaoxiaoweiA:b");
  }
}

//HTTP CLIENT FOR MyApp  END

//HTTP START
class MyAppForHttp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'http请求示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('http请求示例'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () {

              var url = 'http://httpbin.org/';
              //向http://httpbin.org/发送get请求
              http.get(url).then((response) {
                print("状态： ${response.statusCode}");
                print("正文： ${response.body}");
              });

            },
            child: new Text('发起http请求'),
          ),
        ),
      ),
    );
  }
}
//HTTP end

//包应用start
class MyAppForUsePackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '容器组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件示例'),
        ),
        body: Center(

            child:new RaisedButton(
              onPressed:(){
                const String url = 'http://www.baidu.com';
                launch(url);
              },
              child:new Text('打开百度')

          )


          //添加容器
   /*       child: Container(
            width: 200.0,
            height: 200.0,
            //添加边框装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              //设置上下左右四个边框样式
              border: new Border.all(
                color: Colors.grey, //边框颜色
                width: 8.0, //边框粗细
              ),
              borderRadius:
              const BorderRadius.all(const Radius.circular(8.0)), //边框的弧度
            ),
            child: Text(
              'Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),


          ),*/
        ),
      ),
    );
  }
}
//包应用end


//主题应用START
/*class MyAppForThem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.light,//应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[600],//App主要部分的背景色
        accentColor: Colors.orange[600],//前景色（文本、按钮等）
      ),
      home: new MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          //获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
        //使用copyWith的方式获取accentColor
        data: Theme.of(context).copyWith(accentColor: Colors.grey),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.computer),
        ),
      ),
    );
  }
}*/
//主题应用END





//购物车START
class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
//购物车END








/**
 * 负责显示
 */
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

/**
 * 负责计数
 */
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increment),  //显示传参，参数明是onPressed，传递函数类型的实参：_increment，单击按钮执行_increment
      new CounterDisplay(count: _counter),//显示传参，参数明是count，传递基本类型的实参：_counter，显示_counter数字
    ]);
  }
}

/*
class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  void _minus()
  {
    setState(() {

      _counter--;

    });


  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: $_counter'),

        new RaisedButton(
          onPressed: _minus,
          child: new Text('minus')
        )
      ],
    );
  }
}
*/









class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('gaoxiaowei'),
        ),
      ),
    );
  }
}


class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),

        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Text('Hello, world!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(  //传递一个Text Widget
              'my title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}








/*
//收藏列表
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.white,
      )
    );
  }
}
*/

class RandomWords extends StatefulWidget
{
  @override
  createState() => new RandomWordsState();

}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[]; //单词数组
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  //setState会触发State中的build对象，从而刷新UI
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {

    Navigator.of(context).push( new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );

        }
      )
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );



  }
}