import 'package:fetch_api/widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import '../service/app_service.dart';
import '../model/comment_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;
  CommentModel? comment;
  bool commentError = false;
  @override
  void initState() {
    getComment();
    super.initState();
  }

  void getComment() async {
    try {
      final data = await AppService().getComments(id: selectedIndex);
      setState(() {
        comment = data;
        commentError = false;
      });
    } catch (e) {
      setState(() {
        commentError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = comment == null
        ? const CircularProgressIndicator()
        : CommentWidget(comment: comment!);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fetch Api"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            content,
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  menuMaxHeight: 400,
                  alignment: Alignment.center,
                  value: selectedIndex,
                  items: List.generate(
                    20,
                    (index) => DropdownMenuItem<int>(
                      alignment: Alignment.center,
                      value: index + 1,
                      child: Text(
                        (index + 1).toString(),
                      ),
                    ),
                  ),
                  onChanged: (selected) {
                    setState(() {
                      selectedIndex = selected!;
                    });
                  },
                ),
                const SizedBox(
                  width: 40,
                ),
                FilledButton(onPressed: getComment, child: const Text("Fetch "))
              ],
            )
          ],
        ),
      ),
    );
  }
}
