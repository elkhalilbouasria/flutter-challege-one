import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/models/BottomNavigationItem.dart';
import 'package:flutter_challenge_1/providers/NavigationProvider.dart';
import 'package:flutter_challenge_1/themes/MyColors.dart';
import 'package:provider/provider.dart';
class BottomNavigationWidget extends StatelessWidget {
  final List<BottomNavigationItem> items = [
    BottomNavigationItem("Wallet", Icon(Icons.account_balance_wallet)),
    BottomNavigationItem("Discover", Icon(Icons.find_replace)),
    BottomNavigationItem("Community", Icon(Icons.group)),
    BottomNavigationItem("Account", Icon(Icons.person)),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NavigationProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5
          )
        ]
      ),
      padding: EdgeInsets.only(top: 15,bottom: 15,left: 30,right: 30),
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item){
           return GestureDetector(
              onTap: (){
                 provider.currentIndex = items.indexOf(item);
                 Navigator.pushNamed(context, "/" + item.title);
              },
              child: _buildBottomNavigationItem(context,item, items.indexOf(item) == provider.currentIndex),
           );
        }).toList(),
      ),
    );
  }
}

Widget _buildBottomNavigationItem(BuildContext context,BottomNavigationItem item,isSelected){
    return Container(
      child: Column(
        children: <Widget>[
             IconTheme(
               child: item.icon,
               data: IconThemeData(
                 color: isSelected ? Theme.of(context).accentColor : MyColors().greyColor,
                 size: 20
               ),
             ),
             Text(
                 item.title,
                 style: TextStyle(
                   color: isSelected ? Theme.of(context).accentColor : MyColors().greyColor,
                   fontSize: 10,
                   fontWeight: FontWeight.bold
                 ),
             ),
        ],
      ),
    );
}
