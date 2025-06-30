import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodzone/2_foodlist.dart';
import 'package:image_picker/image_picker.dart';

class myadditem1 extends StatefulWidget {
  const myadditem1({super.key});

  @override
  State<myadditem1> createState() => _myadditem1State();
}

class _myadditem1State extends State<myadditem1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _category = 'pizza';
  Uint8List? _imagebytes;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async{
    final XFile? pickedfile = await _picker.pickImage(source: source);
    if(pickedfile!=null){
      final bytes = await pickedfile.readAsBytes();
      setState(() {
        _imagebytes=bytes;
      });
    }
  }
  void _additem(){
    if(_formKey.currentState!.validate()){
      final fooditem = {
          'name':_nameController.text,
          'description':_descriptionController.text,
          'price':_priceController.text,
          'category':_category,
          'image':_imagebytes
      };
      foodlist.add(fooditem);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("data added successfully")));
     
      _formKey.currentState!.reset();
      _category='pizza';
    }
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("add item"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'images/backg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    
                    labelText: "name",
                    labelStyle: const TextStyle(color: Colors.lightBlue),
                    hintText: "enter the name: ",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.food_bank,
                      color: Colors.deepOrangeAccent,
                    ),
                    
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionController,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: "description: ",
                    labelStyle: const TextStyle(color: Colors.lightBlue),
                    hintText: "enter description: ",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.food_bank,
                      color: Colors.deepOrangeAccent,
                    ),
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _priceController,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: "price",
                    labelStyle: const TextStyle(color: Colors.lightBlue),
                    hintText: "enter price: ",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.price_change,
                      color: Colors.deepOrangeAccent,
                    ),
                    suffixIcon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueGrey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: _category,
                  items: ['pizza', 'burger', 'tacoz'].map((String category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "category",
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      filled: true,
                      fillColor: Color.fromARGB(255, 206, 203, 203),
                      prefixIcon: Icon(Icons.category_rounded),
                      prefixIconColor: Colors.deepOrangeAccent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      )),
                ),
              ),
               const SizedBox(height: 20,),
              _imagebytes!=null?
                Image.memory(
                  _imagebytes!,
                  width: 200,
                  height:200,
                  fit: BoxFit.cover,):const Text("no iamge selected"),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.photo_album),

                    onPressed: ()=> _pickImage(ImageSource.gallery), label:const Text("choose the photo")),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: _additem,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5),
                      child: const Text("add")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const myfoodlist1()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5),
                      child: const Text("view")),
                ],
              )
            ]),
          )
        ]));
  }
}
