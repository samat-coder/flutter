import 'package:flutter/material.dart';
import 'package:foodzone/3_fooddetails.dart';

List<Map<String,dynamic>> foodlist=[];
class myfoodlist1 extends StatelessWidget {
  const myfoodlist1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("food list"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: foodlist.isEmpty ?
      const Center(child: Text("no data")):
      GridView.builder(
        itemCount: foodlist.length,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          final food =foodlist[index];
          return GestureDetector(onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=> myfooddetails1(food: food))
            );
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0) 
            ),
            child: Column(
              children: [
                food['image']!=null?
                ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)
                  ),
                 child: Image.memory(
                  food['image'],
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                 ),
                )
                :ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.amberAccent,
                    child:const Icon(Icons.image,size: 40,),
                  ),
                ),
               Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food['name']??'no name',
                            style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height:4
                          ),
                          Text(
                            food['description']??"no description",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow:TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Chip(label: Text(
                                food['category']??'no category',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.orange,
                              ),
                              Text(
                                "\$${food['price']}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          )
                        ],
                  ),
                ),
              ],
            ),
          ),
        
          );
        },)
    );
  }
}