import 'package:counter_provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TherdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("List View"),
     ),
     body: Consumer<ListProvider>(
       builder: (_,listValue,__){
         var listData =listValue.getData();
         return ListView.builder(itemBuilder: (_,index){
           return ListTile(
             leading: Text("${index+1}"),
             title: Text(listData[index]["title"]),
             subtitle: Text(listData[index]["desc"]),
             trailing: SizedBox(
               width: 100,
               child: Row(
                 children: [
                   IconButton(onPressed: (){
                     listValue.updateData({
                       "title":"Today in Class",
                       "desc":"Today class in Very important Topic Discussion"
                     }, index);
                   }, icon: Icon(Icons.edit)),
                   IconButton(onPressed: (){
                     listValue.deleteData(index);
                   }, icon: Icon(Icons.delete,color: Colors.red,)),
                 ],
               ),
             ),
           );
         },
         itemCount: listData.length,
         );
       },
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         context.read<ListProvider>().addData({
           "title":"Today class",
           "desc":"Today class in Very important Topic Discussion"
         });
       },
       child: Icon(Icons.add),
     ),
   );
  }

}