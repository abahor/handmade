import 'package:flutter/material.dart';
import 'package:handmade/widgets/app_drawer.dart';


class HomeScreen extends StatefulWidget {

  static const String routeName = '/';

  @override
  _Homescreen createState() => _Homescreen();
}

enum FilterOptions {
  Favorites,
  all,
}

class _Homescreen extends State<HomeScreen> {





  bool _isInit = true;
  bool _isloading = true;


  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies

    if (_isInit){
      // Future.delayed(Duration.zero).then((value) async {
      //   setState(() {
      //     _isloading = true;
      //   });
      //   await

      // } ) ;

    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final List<Product> loadedProducts = ;


    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),


      body: _isloading ? Center(
        child: CircularProgressIndicator()  ,
      )
          : Text('kk')
      // RefreshIndicator(
          // onRefresh: () {},
          // child:

    // ),
    );
  }
}

