import 'package:flutter/material.dart';
import '../me/me_cell.dart';
import 'package:flutter/services.dart';
import 'me_header.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        appBar: AppBar(
          title: barSearch(),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            MeHeader(),
//            SizedBox(
//              height: 10,
//            ),
            buildItem1(context),
            SizedBox(
              height: 10,
            ),
            buildItem2(context),
            SizedBox(
              height: 10,
            ),
            buildVideoItem(),
          ],
        ));
  }

  Widget buildItem1(BuildContext) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        shrinkWrap: true,
        children: <Widget>[
          MeCell(
            title: '学习记录',
            icon: Icons.school,
            onPressed: () {},
          ),
          MeCell(
            title: '已购',
            icon: Icons.shopping_basket,
            onPressed: () {},
          ),
          MeCell(
            title: '余额礼券',
            icon: Icons.add_shopping_cart,
            onPressed: () {},
          ),
          MeCell(
            title: '读书会',
            icon: Icons.book,
            onPressed: () {},
          ),
          MeCell(
            title: '我的书架',
            icon: Icons.collections_bookmark,
            onPressed: () {},
          ),
          MeCell(
            title: '下载中心',
            icon: Icons.file_download,
            onPressed: () {},
          ),
          MeCell(
            title: '付费咨询',
            icon: Icons.monetization_on,
            onPressed: () {},
          ),
          MeCell(
            title: '活动广场',
            icon: Icons.accessibility,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildItem2(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          MeCell(
            title: '社区建设',
            icon: Icons.home,
            onPressed: () {},
          ),
          MeCell(
            title: '社区建设',
            icon: Icons.home,
            onPressed: () {},
          ),
          MeCell(
            title: '社区建设',
            icon: Icons.home,
            onPressed: () {},
          ),
          MeCell(
            title: '社区建设',
            icon: Icons.home,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget barSearch() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 8,
            child: FlatButton.icon(
                color: Colors.black12,
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text(
                  '搜索知乎内容',
                ))),
        Expanded(
          flex: 2,
          child: FlatButton.icon(
              onPressed: () {}, icon: Icon(Icons.scanner), label: Text('')),
        ),
      ],
    );
  }

  Widget buildVideoItem() {
    final String imageUrl1 =
        'https://pic2.zhimg.com/80/v2-d70598a50a28bb9498b0d8ea16f5add5_hd.jpg';
    final String imageUrl2 =
        'https://pic4.zhimg.com/80/a787c8a5f6b2a95a1cf764dbd178374b_hd.jpg';
    final String imageUrl3 =
        'https://pic1.zhimg.com/50/v2-ed4a8b3d82d0d79d8efa80f779e84d13_fhd.jpg';
    final String imageUrl4 =
        'https://pic4.zhimg.com/v2-c8318639c3c44e424104747ecb63a1fb_b.jpg';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                child: Icon(Icons.videocam),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text('视频创作'),
              ),
              Row(
                children: <Widget>[
                  Text('拍一个'),
                  Icon(Icons.navigate_next),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: AspectRatio(
                      aspectRatio: 4.0 / 3.0,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(imageUrl1),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: AspectRatio(aspectRatio: 4.0 / 3.0),
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl2),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: AspectRatio(aspectRatio: 4.0 / 3.0),
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl4),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: AspectRatio(aspectRatio: 4.0 / 3.0),
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl3),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
