import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signlingo/src/resources/home/setting/edit_profile.dart';

class SettingPage extends StatefulWidget {
   const SettingPage({super.key});
   @override
  State<StatefulWidget> createState() {
     return _SettingScreenState();
   }
}

class _SettingScreenState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          padding: EdgeInsets.only(top: 35.0, bottom: 25.0, right: 15.0, left: 15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(77, 210, 255, 0.3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: InkWell(
            onTap: () {
              // Xử lý sự kiện khi nút được nhấn
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage())
              );
              print("press");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Màu nền của khung ảnh
                    ),
                      child: Center(
                       child: ClipOval(
                        child: Image.network(
                          'https://i.pinimg.com/736x/11/e4/4d/11e44d85743b28fa62121b5ae71a914b.jpg',
                          width: 88.0,
                          height: 88.0,
                          fit: BoxFit.cover,
                        ),
                       ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hoàng Phạm',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'hoang@gmail.com',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),                // Profile
        Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                ),
                child: InkWell(
                  onTap: () {
                    // xu ly su kien
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0), // Bo tròn viền
                              color: Color.fromRGBO(77, 210, 255, 0.3), // Màu nền
                            ),
                            child: Icon(
                              Icons.person,
                              size: 20.0,
                              color: Color.fromRGBO(77, 210, 255, 1),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Container(
                            child: Text(
                                'Edit Personal Data',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                          // color: Color.fromRGBO(211, 211, 211, 0.5), // Màu nền
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.0,
                            color: Color.fromRGBO(77, 210, 255, 1)
                        ),
                      )
                    ],
                  ),
                ),
              ),             // edit data
              Container(                          // change pass
                margin: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                ),
                child: InkWell(
                  onTap: () {
                    // xu ly su kien
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0), // Bo tròn viền
                              color: Color.fromRGBO(184, 111, 220, 0.3), // Màu nền
                            ),
                            child: Icon(
                              Icons.vpn_key,
                              size: 20.0,
                              color: Color.fromRGBO(184, 111, 220, 1),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Container(
                            child: Text(
                                'Change Password',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                          // color: Color.fromRGBO(211, 211, 211, 0.5), // Màu nền
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.0,
                            color: Color.fromRGBO(184, 111, 220, 1)
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                ),
                child: InkWell(
                  onTap: () {
                    // xu ly su kien
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0), // Bo tròn viền
                              color: Color.fromRGBO(0, 230, 142, 0.3), // Màu nền
                            ),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 20.0,
                              color: Color.fromRGBO(0, 230, 142, 1),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Container(
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                          // color: Color.fromRGBO(0, 230, 142, 0.3), // Màu nền
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.0,
                          color: Color.fromRGBO(0, 230, 142, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                ),
                child: InkWell(
                  onTap: () {
                    // xu ly su kien
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0), // Bo tròn viền
                              color: Color.fromRGBO(233, 22, 64, 0.3), // Màu nền
                            ),
                            child: Icon(
                              Icons.logout,
                              size: 20.0,
                              color: Color.fromRGBO(233, 22, 64, 1),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Container(
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0), // Bo tròn viền
                          // color: Color.fromRGBO(211, 211, 211, 0.5), // Màu nền
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12.0,
                            color: Color.fromRGBO(233, 22, 64, 1)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  
}