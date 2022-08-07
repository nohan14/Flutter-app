import 'package:flutter/material.dart';
import 'package:shoppy_list/models/item.dart';






class Additemdialog extends StatefulWidget {
  final Function(Item) addItem;

  Additemdialog(this.addItem);


  @override
  State<Additemdialog> createState() => _AdditemdialogState();
}

class _AdditemdialogState extends State<Additemdialog> {



  @override
  Widget build(BuildContext context) {

    Widget buildTextfeild(String hint, TextEditingController controller){
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
              labelText: hint,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black38,

                  )
              )
          ),
          controller: controller,
        ),
      );

    }

    var nameController= TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Add Item',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black87,
              ), ),
            buildTextfeild('name', nameController),

            ElevatedButton(onPressed: (){

              final item= Item(nameController.text);

              widget.addItem(item);
              Navigator.of(context).pop();

            }, child: Text('Add Item'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey
              ),
            )


          ],
        ),),
    );
  }
}
