import 'package:flutter/material.dart';


class myfooddetails1 extends StatelessWidget {
  final Map<String,dynamic> food;
  const myfooddetails1({super.key,required this.food});

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(food['name'],)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)
                  ),
                  child:food['image']!=null?
                    Image.memory(
                      food['image'],
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                    )
                    :
                    Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.grey[300],
                      child:const Icon(Icons.fastfood,size: 50,),
                    )
                ),
              ),
              const SizedBox(height: 20),
                  Text(
                    food['name'],
                    style:const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      
                    ),
                    
                  ),
                 const SizedBox(height: 8),
                  Row(
                      children: [
                        const Icon(Icons.category,color: Colors.orange,),
                        const SizedBox(width: 8),
                        Text(
                          food['category']??'no category',
                          style: const TextStyle(fontSize: 16,color:Colors.black),
                        ),
                      ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                      children: [
                        const Icon(Icons.money,color:Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          "\$${food['price']}",
                          style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                  ),
                  const SizedBox(height: 20),
                  
                   const Text(
                    'description:',
                    textAlign: TextAlign.left,
                    style:TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    
                  ),
                  const SizedBox(height: 10),
                  Text(
                    food['description']??'no description',
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 16,
                        color:Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  )
            ],
          ),
        ),
      ) 
    );
  }
}
