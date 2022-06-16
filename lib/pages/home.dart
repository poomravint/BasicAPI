import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Computer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder( builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return Mybox(data[index]['title'], data[index]['subtitle'], data[index]['url'], data[index]['detail']);

              }, 
              itemCount: data.length, );
        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'), //! โหลดข้อมูลจาก data.json

          
        )
      ),
    );
  }

  


Widget Mybox(String title , String subtitle , String url , String detail) {
    var v1 = title;
    var v2 = subtitle;
    var v3 = url;
    var v4 = detail;
    return Container(
      margin:  EdgeInsets.all(20), //! ระยะห่างระหว่างกล่อง
      //! .only(top: 20) เอาเเค่ด้านบน
      padding: EdgeInsets.all(20), //! ระยะห่างระหว่างตัวอักษรกับขอบกล่อง
      //color: Colors.red[50],
      height: 150, //! ความสูงของกล่อง
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), //! ขอบ
        image: DecorationImage(
          image: NetworkImage(url),
          fit : BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style : TextStyle(fontSize : 25 , color: Color.fromARGB(255, 255, 255, 255) , fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(subtitle,
            style : TextStyle(fontSize : 15 , color :Color.fromARGB(255, 255, 255, 255) , fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          TextButton(onPressed: () { //! ปุ่มกด
              print("Next Page >>>");
              Navigator.push(context , MaterialPageRoute(builder: (context)=> DetailPage(v1,v2,v3,v4)));
              
          }, child: Text("อ่านต่อ"))
        ],
      ),
    );
  }
}

