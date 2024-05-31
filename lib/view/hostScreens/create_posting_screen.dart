import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_rental_app/view/widget/amenities_ui.dart';

class CreatePostingScreen extends StatefulWidget {
  const CreatePostingScreen({super.key});

  @override
  State<CreatePostingScreen> createState() => _CreatePostingScreenState();
}

class _CreatePostingScreenState extends State<CreatePostingScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countyController = TextEditingController();
  TextEditingController _amenitiesController = TextEditingController();

  final List<String> residenceType = [
    'Detatched House',
    'Villa',
    'Apartment',
    'Condo',
    'Flat',
    'Town House',
    'Studio'
  ];

  String residenceTypeSelected = "";

  Map<String, int>? _beds;
  Map<String, int>? _bathroom;

  List<MemoryImage>? _imageList;

  _selectedImageFormGallery(int index) async {
    var imageFilePickFormGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFilePickFormGallery != null) {
      MemoryImage imageFileBytesForm =
          MemoryImage((File(imageFilePickFormGallery.path)).readAsBytesSync());

      if (index < 0) {
        _imageList!.add(imageFileBytesForm);
      } else {
        _imageList![index] = imageFileBytesForm;
      }

      setState(() {});
    }
  }


  initializeValues(){

  _nameController = TextEditingController(text: '');
 _addressController = TextEditingController(text: '');
 _priceController = TextEditingController(text: '');
  _descriptionController = TextEditingController(text: '');
  _cityController = TextEditingController(text: '');
   _countyController = TextEditingController(text: '');
   _amenitiesController = TextEditingController(text: '');
   residenceTypeSelected = residenceType.first;

   _beds = {
     'small': 0,
     'medium': 0,
     'large':0
   };

   _bathroom = {
     'full':0,
     'half':0
   };

   _imageList = [];

  }

  @override
  void initState() {
    initializeValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.amber],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(1, 0),
                  stops: [0, 1],
                  tileMode: TileMode.clamp)),
        ),
        title: const Text(
          "Create / Update a Listing",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.upload))],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 26, 26, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Listing name
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Listing name'),
                            style: const TextStyle(fontSize: 25.0),
                            controller: _nameController,
                            validator: (inputText) {
                              if (inputText!.isEmpty) {
                                return "Please enter a valid name";
                              }
                              return null;
                            },
                          ),
                        ),

                        // Selected property type
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: DropdownButton(
                            items: residenceType.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                            onChanged: (valueItem) {
                              setState(() {
                                residenceTypeSelected = valueItem.toString();
                              });
                            },
                            isExpanded: true,
                            value: residenceTypeSelected,
                            hint: const Text(
                              'Select property type: ',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),

                        // Price/night
                        Padding(
                          padding: const EdgeInsets.only(top: 21.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: "Price"),
                                  style: const TextStyle(fontSize: 25.0),
                                  keyboardType: TextInputType.number,
                                  controller: _priceController,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter a valid price";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, bottom: 10.0),
                                child: Text(
                                  "\$ /night",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),

                        // Description
                        Padding(
                          padding: const EdgeInsets.only(top: 21.0),
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                            style: const TextStyle(fontSize: 25.0),
                            controller: _descriptionController,
                            maxLines: 3,
                            minLines: 1,
                            validator: (inputText) {
                              if (inputText!.isEmpty) {
                                return "Please enter a valid description";
                              }
                              return null;
                            },
                          ),
                        ),

                        // Address
                        Padding(
                          padding: const EdgeInsets.only(top: 21.0),
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Address'),
                            style: const TextStyle(fontSize: 25.0),
                            controller: _addressController,
                            maxLines: 3,
                            validator: (inputText) {
                              if (inputText!.isEmpty) {
                                return "Please enter a valid address";
                              }
                              return null;
                            },
                          ),
                        ),

                        // Beds
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Beds',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 21.0, left: 15.0, right: 15.0),
                          child: Column(
                            children: [
                              // Twin/Single bed

                              AmenitiesUI(
                                  type: 'Twin/Single',
                                  startValue: _beds!['small']!,
                                  decreaseValue: () {
                                    _beds!['small'] = _beds!['small']! - 1;
                                    if (_beds!['small']! < 0) {
                                      _beds!['small'] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!['small'] = _beds!['small']! + 1;
                                  }),

                              // Double bed
                              AmenitiesUI(
                                  type: 'Double',
                                  startValue: _beds!['medium']!,
                                  decreaseValue: () {
                                    _beds!['medium'] = _beds!['medium']! - 1;
                                    if (_beds!['medium']! < 0) {
                                      _beds!['medium'] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!['medium'] = _beds!['medium']! + 1;
                                  }),

                              // Queen/ King bed

                              AmenitiesUI(
                                  type: 'Queen/King',
                                  startValue: _beds!['large']!,
                                  decreaseValue: () {
                                    _beds!['large'] = _beds!['large']! - 1;
                                    if (_beds!['large']! < 0) {
                                      _beds!['large'] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _beds!['large'] = _beds!['large']! + 1;
                                  })
                            ],
                          ),
                        ),

                        // Bathrooms
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Bathroom',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                          child: Column(
                            children: [
                              // Full bathroom
                              AmenitiesUI(
                                  type: "Full",
                                  startValue: _bathroom!['full']!,
                                  decreaseValue: () {
                                    _bathroom!['full'] =
                                        _bathroom!['full']! - 1;
                                    if (_bathroom!['full']! < 0) {
                                      _bathroom!['full'] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _bathroom!['full'] =
                                        _bathroom!['full']! + 1;
                                  }),
                              // Half bathroom
                              AmenitiesUI(
                                  type: "Half",
                                  startValue: _bathroom!['half']!,
                                  decreaseValue: () {
                                    _bathroom!['half'] =
                                        _bathroom!['half']! - 1;
                                    if (_bathroom!['half']! < 0) {
                                      _bathroom!['half'] = 0;
                                    }
                                  },
                                  increaseValue: () {
                                    _bathroom!['half'] =
                                        _bathroom!['half']! + 1;
                                  }),
                            ],
                          ),
                        ),

                        // extra amenities
                        Padding(
                          padding: const EdgeInsets.only(top: 21.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Amenities (coma separated)"),
                            style: const TextStyle(fontSize: 25.0),
                            controller: _amenitiesController,
                            maxLines: 3,
                            minLines: 1,
                            validator: (inputText) {
                              if (inputText!.isEmpty) {
                                return "Please enter a valid amenities (coma separated)";
                              }
                              return null;
                            },
                          ),
                        ),

                        // photos
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Photos",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 25.0, top: 20.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: _imageList!.length + 1,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 25,
                                      mainAxisSpacing: 25,
                                      childAspectRatio: 3 / 2),
                              itemBuilder: (context, index) {
                                if (index == _imageList!.length) {
                                  return IconButton(
                                      onPressed: () {
                                        _selectedImageFormGallery(-1);
                                      },
                                      icon: const Icon(Icons.add));
                                }
                                return MaterialButton(
                                  onPressed: (){},
                                  child: Image(
                                    image: _imageList![index],
                                    fit: BoxFit.fill,

                                  ),
                                );
                              }),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
