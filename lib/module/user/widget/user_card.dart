import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  const UserCardWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.imageUrl});

  @override

  /// Builds a widget that displays a user card with the given [name], [email], and [imageUrl].
  ///
  /// The user card is displayed as a container with white background, rounded corners, and a border.
  /// It consists of a row with a circle avatar, a column containing the user's name and email, and an icon button for additional actions.
  ///
  /// Returns a [Widget] representing the user card.
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey,
            radius: 24,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              const SizedBox(
                height: 4.0,
              ),
              Text(email),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
