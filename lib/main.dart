import 'package:flutter/material.dart';
import 'package:shoppy_list/models/item.dart';
import 'package:shoppy_list/item_dialogue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mylist(),
      title: 'Shopping  List',
    ) ;
  }
}
class Mylist extends StatefulWidget {
  const Mylist({Key? key}) : super(key: key);

  @override
  _MylistState createState() => _MylistState();
}

class _MylistState extends State<Mylist> {

  List<Item> itemList = [];


  @override
  Widget build(BuildContext context) {

    void addUserData(Item item) {

      setState(() {
        itemList.add(item);
      });
    }




    void showItemDialog() {
      showDialog(context: context, builder: (_) {
        return AlertDialog(
          content: Additemdialog(addUserData) ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },);
    }





    return Scaffold(

      floatingActionButton: FloatingActionButton(


        onPressed: showItemDialog,

        child:
        Icon(Icons.add),

        backgroundColor: Colors.blueGrey,
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        title: Text('SHOPPING  LIST',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),),

      ),
      backgroundColor: Colors.blueGrey.shade900,
      bottomNavigationBar: Text('Add items here',
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        height: 4,

      ),),
      body: Container(

        height: MediaQuery.of(context).size.height *0.75,
        child: ListView.builder(itemBuilder: (ctx,index){return Card(
          color: Colors.blueGrey.shade700,
          margin: EdgeInsets.all(4),
          elevation: 8,
          child: ListTile(
            title: Text(itemList[index].name, style: TextStyle(

                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w400
            ),) ,

          ),);},
          itemCount: itemList.length,
        ),
      ),
    );
  }
}
