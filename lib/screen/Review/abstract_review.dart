import 'package:flutter/material.dart';
import 'package:one_room_apt/screen/Review/detail_review.dart';
import 'package:one_room_apt/screen/Review/writePage.dart';

class AbstractReview extends StatefulWidget {
  const AbstractReview({
    Key? key,
  }) : super(key: key);

  @override
  State<AbstractReview> createState() => _AbstractReviewWidget();
}

class _AbstractReviewWidget extends State<AbstractReview> {
  int _selectedStars = 0;

  final List<Map<String, String>> cardData = List.generate(10, (index) {
    return {'title': 'Review $index',};
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xF078002F),
        title: const Text(
          '안암역 6호선 어딘가 자취방',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: IconButton(
                    onPressed: () {
                      print('Icon Clicked');
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Star: ',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedStars = index + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color: index < _selectedStars
                                      ? Colors.yellow : Colors.grey,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Row(
                        children: [
                          Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '\$100.0',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.0,
            child: Container(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WritePage(),
                    ),
                  );
                },
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  child: Container(
                    height: 40.0,
                    width: 80.0,
                    padding: const EdgeInsets.all(1.0),
                    child: const Center(
                      child: Text(
                        'Write',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailReview(
                            title: cardData[index]['title']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Review$index',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Information#$index: Hello Worlds #$index',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}