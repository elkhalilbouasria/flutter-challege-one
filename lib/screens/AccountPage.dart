import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/models/AccountPageListItem.dart';
import 'package:flutter_challenge_1/themes/MyColors.dart';
import 'package:flutter_challenge_1/themes/ThemesData.dart';
import 'package:flutter_challenge_1/widgets/BottomNavigationWidget.dart';
import 'package:flutter_challenge_1/providers/ThemeChangerProvider.dart';
import 'package:flutter_challenge_1/widgets/BuildAcountListItem.dart';
import 'package:provider/provider.dart';
class AccountPage extends StatelessWidget {
  final List<AccountPageListItem> items = [
     AccountPageListItem("Notification",Icon(Icons.notifications,color: Colors.orangeAccent,)),
     AccountPageListItem("ManageWallet",Icon(Icons.account_balance_wallet,color: Colors.blueAccent,)),
     AccountPageListItem("Currency",Icon(Icons.monetization_on,color: Colors.greenAccent,)),
     AccountPageListItem("Security",Icon(Icons.security,color: Colors.deepPurple,)),
     AccountPageListItem("Suggetions & Feed Back",Icon(Icons.assignment,color: Colors.deepOrangeAccent,)),
     AccountPageListItem("Settings",Icon(Icons.settings,color: Colors.lightBlue,)),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeChangerProvider _theme = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(),
       body: Container(
         width: MediaQuery.of(context).size.width,
         color: Theme.of(context).primaryColor,
         child: SafeArea(
           top: true,
           child: Column(
             children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(color: Colors.black12,blurRadius: 15)
                    ],
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton.icon(
                            onPressed: (){
                              if(lightTheme() == _theme.getTheme()){
                                _theme.setTheme(darkTheme());
                              }else{
                                _theme.setTheme(lightTheme());
                              }
                            },
                            icon: Icon(lightTheme() != _theme.getTheme() ? Icons.wb_sunny : Icons.brightness_2,color: Theme.of(context).accentColor,size: 13,),
                            label: Text(
                              lightTheme() == _theme.getTheme() ? "Dark " : "Light",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.w300
                              ),
                            )
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors().greyColor,width: 5),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                            backgroundColor: Theme.of(context).accentColor,
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Adia Christine",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 35),
                        child: Text(
                          "1434 23423",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFc8c8c8)
                            )
                        ),
                      )
                    ],
                  ),
                ),
               Expanded(
                 child: Container(
                   padding: EdgeInsets.only(top: 30),
                   child: ListView.builder(
                     itemCount: items.length,
                     itemBuilder: (BuildContext context,index){
                       return buildAccountListItem(context, items[index]
                       );
                     },
                   ),
                 ),
               )
             ],
           ),
         ),
       ),
    );
  }
}
