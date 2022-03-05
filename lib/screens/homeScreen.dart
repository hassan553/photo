import 'package:flutter/material.dart';
import 'package:photo/screens/photoScreen.dart';

class HomePage extends StatelessWidget {
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Image.asset(
            'assets/images.png',
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,

          ),
          Container(
            margin: const EdgeInsets.all(20),

            child: Form(
              key: formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'not valid empty string ';
                  }
                },
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                  hintText: 'Search For Any Image',
                  hintStyle: const TextStyle(color: Colors.black26,),
                  //prefixIcon: const Icon(Icons.search,color: Colors.yellow,),

                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('hassan');
              if (formKey.currentState!.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhotoScreen(searchPhoto: searchController.text,);
                }));
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text('Search >>',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25,),),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//https://pixabay.com/api/?key=25883494-329254f697e1b6aacc43b87ce&q=yellow+flowers&image_type=photo&pretty=true