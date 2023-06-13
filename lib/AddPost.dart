import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskui/Texts.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final PostBloc _postBloc = PostBloc();

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      List<File> selectedImages = List.from(_postBloc.selectedImages); // Copy existing images
      for (var pickedImage in pickedImages) {
        selectedImages.add(File(pickedImage.path)); // Add new images
      }
      _postBloc.updateImages(selectedImages);
    }
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Add Post',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "What's happening?",
                hintStyle: GoogleFonts.aboreto(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
              maxLines: 4,
              onChanged: (text) {
                _postBloc.updateText(text);
              },
            ),
            const SizedBox(height: 16.0),
            StreamBuilder<List<File>>(
              stream: _postBloc.imageStream,
              initialData: [],
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: snapshot.data!
                            .map(
                              (image) => Stack(
                                children: [
                                  Image.file(
                                    image,
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        _postBloc.removeImage(image);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: _pickImages,
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.add,
                              size: 40.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _pickImages,
              child: Text('Attach Photos',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Perform tweet action using _tweetBloc.textStream and _tweetBloc.imageStream
              },
              child: Text('Post',style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}


class PostBloc {
  final _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  final _imageController = StreamController<List<File>>();
  Stream<List<File>> get imageStream => _imageController.stream;

  List<File> _selectedImages = [];
  List<File> get selectedImages => _selectedImages;

  void updateText(String text) {
    _textController.sink.add(text);
  }

  void updateImages(List<File> images) {
    _selectedImages = images;
    _imageController.sink.add(_selectedImages);
  }

  void removeImage(File image) {
    _selectedImages.remove(image);
    _imageController.sink.add(_selectedImages);
  }

  void dispose() {
    _textController.close();
    _imageController.close();
  }
}

