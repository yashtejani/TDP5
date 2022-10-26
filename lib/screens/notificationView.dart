import 'package:flutter/material.dart';
import 'package:project/screens/dashboard.dart';

class Notification {
  String msgTitle;
  String msg;
  Notification({required this.msgTitle,required this.msg});
}

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Notification';
    return MaterialApp(
    title: appTitle,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],

        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 70,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        title: const Text(appTitle),
    leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const MaterialApp(
    title: 'My Flutter App', home: Dashboard()))),
    ),
    ),

      body: listView(),
    ),
    );
  }





  Widget listView(){
    final List<Notification> notification =[
      Notification(msgTitle:'Sample ',msg:' Your bus is delayed 5 minutes past its arrival time.'),
      Notification(msgTitle:'Sample ',msg:' Final replacement bus service ends at 23:00'),
      Notification(msgTitle:'Sample ',msg:' Last bus to Ashburton is closeby.'),
      
    ];
    return ListView.separated(itemBuilder: (context,index)
    {

      return listViewItem(index, notification[0].msgTitle);
    }, separatorBuilder: (context,index){
      return Divider(height: 0,);
    }, itemCount: notification.length);
  }

  Widget listViewItem(int index, String msgTitle ){
    final List<Notification> notification =[
      Notification(msgTitle:'Sample ',msg:' Your bus is delayed 5 minutes past its arrival time.'),
      Notification(msgTitle:'Sample ',msg:' Final replacement bus service ends at 23:00'),
      Notification(msgTitle:'Sample ',msg:' Last bus to Ashburton is closeby.'),

    ];
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 13,vertical: 18),
      child:Row(
        children: [
          prefixIcon(),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                  message(index,notification[index].msgTitle,notification[index].msg)
               ,
                timeAndDate(index)
              ],
            ),
          ),
        ],
      )

    );
  }

  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(Icons.notifications,size:25,color: Colors.grey.shade700),
    );
  }


  Widget message(int index,String msgTitle,String msg){
    double textSize =14;
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: RichText(
        maxLines: 4,

        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: msgTitle,
          style: TextStyle(
            fontSize: textSize,
            color:Colors.black,
            fontWeight: FontWeight.bold
          ),

          children: [
            TextSpan(
              text: msg,
              style: TextStyle(
                fontWeight: FontWeight.w400,

              )
            )
          ]
        ),
      ),
    );
  }

  Widget timeAndDate(int index){
    return Container(
      margin: EdgeInsets.only(top:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '09/10/2022',
            style: TextStyle(
              fontSize: 10
            ),
          ),
          Text(
            '20:50 pm',
            style: TextStyle(
                fontSize: 10
            ),
          )
        ],
      ),
    );
  }

}
