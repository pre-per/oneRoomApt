import 'package:flutter/material.dart';
import 'package:one_room_apt/screen/Review/abstract_review.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  final List<Map<String, String>> cardData = List.generate(10, (index) {
    return {'title': 'Review $index'};
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 1.0,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 0.2,
                color: Colors.black,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 500.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[200],
                  ),
                  child: const Center(
                    child: Text(
                      'Scroll up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          children: [
                            _horizontalElevatedButton(title: 'hello'),
                            const SizedBox(width: 10.0),
                            _horizontalElevatedButton(title: 'world'),
                            const SizedBox(width: 10.0),
                            _horizontalElevatedButton(title: 'title'),
                            const SizedBox(width: 10.0),
                            _horizontalElevatedButton(title: 'hello'),
                            const SizedBox(width: 10.0),
                            _horizontalElevatedButton(title: 'world'),
                            const SizedBox(width: 10.0),
                            _horizontalElevatedButton(title: 'title'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AbstractReview(),
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
                                'Place $index',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'Information #$index: Hello Worlds #$index',
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
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _horizontalElevatedButton({required String title}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1.5,
        fixedSize: const Size(100.0, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
