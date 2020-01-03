import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_1/models/AccountPageListItem.dart';
import 'package:flutter_challenge_1/themes/MyColors.dart';
import 'package:flutter_challenge_1/themes/ThemesData.dart';

Widget buildAccountListItem(BuildContext context,AccountPageListItem item){

  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      border: Border(bottom: BorderSide(color: Theme.of(context).accentColor == darkTheme().accentColor ? MyColors().darkGreyColor : MyColors().lightGreyColor))
    ),
    padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
    child: Row(
      children: <Widget>[
        Container(
          child: IconTheme(
            child: item.icon,
            data: IconThemeData(
              size: 22
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              item.title,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
              child: IconTheme(
                child: Icon(Icons.arrow_forward_ios),
                data: IconThemeData(
                    color: MyColors().greyColor,
                   size: 13
                ),
              )
          ),
        )
      ],
    ),
  );
}