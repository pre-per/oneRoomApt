import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  File? _livingRoomImage;
  File? _bathroomImage;
  File? _kitchenImage;
  File? _etcImage;

  final ImagePicker _picker = ImagePicker();

  final TextEditingController _livingroomController = TextEditingController();
  final TextEditingController _bathroomController = TextEditingController();
  final TextEditingController _kitchenController = TextEditingController();
  final TextEditingController _etcController = TextEditingController();

  int _livingroomStar = 0;
  int _bathroomStar = 0;
  int _kitchenStar = 0;
  int _etc = 0;

  Future<void> _pickImage(String section) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (section == 'Living Room') {
          _livingRoomImage = File(pickedFile.path);
        } else if (section == 'Bathroom') {
          _bathroomImage = File(pickedFile.path);
        } else if (section == 'Kitchen') {
          _kitchenImage = File(pickedFile.path);
        } else if (section == 'Etc') {
          _etcImage = File(pickedFile.path);
        }
      });
    }
  }

  /*
  Future<void> requestPhotoPermission() async {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
      if (status.isGranted) {
        print("Photo permission granted");
      } else {
        await Permission.photos.request();
        print("Photo permission denied");
      }
    } else {
      print("Photo permission already granted");
    }
  }
  */

  void _saveData() {
    String livingRoomReview = _livingroomController.text;
    String bathroomReview = _bathroomController.text;
    String kitchenReview = _kitchenController.text;
    String etcReview = _etcController.text;

    int livingRoomStar = _livingroomStar;
    int bathroomStar = _bathroomStar;
    int kitchenStar = _kitchenStar;
    int etcStar = _etc;

    File? livingRoomImage = _livingRoomImage;
    File? bathroomImage = _bathroomImage;
    File? kitchenImage = _kitchenImage;
    File? etcImage = _etcImage;

    // 저장할 데이터 출력
    print("Living Room Review: $livingRoomReview");
    print("Bathroom Review: $bathroomReview");
    print("Kitchen Review: $kitchenReview");
    print("Etc Review: $etcReview");

    print("Living Room Star: $livingRoomStar");
    print("Bathroom Star: $bathroomStar");
    print("Kitchen Star: $kitchenStar");
    print("Etc Star: $etcStar");

    if (livingRoomImage != null) print("Living Room Image Path: ${livingRoomImage.path}");
    if (bathroomImage != null) print("Bathroom Image Path: ${bathroomImage.path}");
    if (kitchenImage != null) print("Kitchen Image Path: ${kitchenImage.path}");
    if (etcImage != null) print("Etc Image Path: ${etcImage.path}");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WritePage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveData,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReviewSection(
              title: 'Living Room',
              starRating: _livingroomStar,
              onStarRatingChanged: (value) => setState(() => _livingroomStar = value),
              controller: _livingroomController,
              image: _livingRoomImage,
              onPickImage: () => _pickImage('Living Room'),
            ),
            _buildReviewSection(
              title: 'Bathroom',
              starRating: _bathroomStar,
              onStarRatingChanged: (value) => setState(() => _bathroomStar = value),
              controller: _bathroomController,
              image: _bathroomImage,
              onPickImage: () => _pickImage('Bathroom'),
            ),
            _buildReviewSection(
              title: 'Kitchen',
              starRating: _kitchenStar,
              onStarRatingChanged: (value) => setState(() => _kitchenStar = value),
              controller: _kitchenController,
              image: _kitchenImage,
              onPickImage: () => _pickImage('Kitchen'),
            ),
            _buildReviewSection(
              title: 'Etc',
              starRating: _etc,
              onStarRatingChanged: (value) => setState(() => _etc = value),
              controller: _etcController,
              image: _etcImage,
              onPickImage: () => _pickImage('Etc'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSection({
    required String title,
    required int starRating,
    required ValueChanged<int> onStarRatingChanged,
    required TextEditingController controller,
    required File? image,
    required VoidCallback onPickImage,
  }) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(color: Colors.black, width: 0.2),
                  ),
                  child: image == null
                      ? IconButton(
                          onPressed: onPickImage,
                          icon: const Icon(Icons.add_a_photo),
                        )
                      : Image.file(image),
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Score: ',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              onStarRatingChanged(index + 1);
                            },
                            child: Icon(
                              Icons.star,
                              color: index < starRating ? Colors.yellow : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    height: 100.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Write the Review...',
                        border: InputBorder.none,
                      ),
                      minLines: 1,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
