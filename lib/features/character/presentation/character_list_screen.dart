import 'dart:io';

import 'package:base_project/core/widgets/cus_text_field.dart';
import 'package:base_project/core/widgets/custom_toaster.dart';
import 'package:base_project/core/widgets/global_dialogs.dart';
import 'package:base_project/core/widgets/loading_overlay.dart';
import 'package:base_project/core/widgets/rounded_image.dart';
import 'package:base_project/core/widgets/theme_app_bar.dart';
import 'package:base_project/features/character/models/character.dart';
import 'package:base_project/features/character/presentation/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/colors.dart';
import '../../../core/widgets/custom_widget.dart';
import '../providers/character_provider.dart';
import 'character_form.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late CharacterProvider characterProvider;
  List<Character> filtered = [];
  int pageIndex = 0;
  TextEditingController searchController = new TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _endHit = false;

  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    // TODO: implement initState
    characterProvider = Provider.of<CharacterProvider>(context, listen: false);
    super.initState();

    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if user has reached the end of the scroll
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has hit the end of the scroll
      print("Reached the end of the scroll!");
      _loadData();
    }
  }

  void _loadData() {
    characterProvider.getList({}, context, page: pageIndex).then((value) {
      if (value.data.length < 20) {
        _endHit = true;
      } else {
        pageIndex++;
      }
    });
    print("Loading more data...");
  }

  @override
  Widget build(BuildContext context) {
    characterProvider = Provider.of<CharacterProvider>(context);
    if (searchController.text != "") {
      filtered = characterProvider.items
          .where((x) => x.name
              .toString()
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    } else {
      filtered = characterProvider.items;
    }
    return LoadingOverlay(
      isLoading: characterProvider.listLoading,
      child: Scaffold(
        appBar: ThemeAppBar(
          leadingIcon: InkWell(
              onTap: () {
                exitDialog();
              },
              child: Icon(
                Icons.exit_to_app,
                color: AppColors.white,
              )),
          title: "Character List",
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 10),
            child: Column(
              children: [
                // Search Bar
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 6).copyWith(bottom: 10),
                  child: CusTextField(
                    hintText: "Search by name",
                    controller: searchController,
                    textInputType: TextInputType.text,
                    onChanged: (val) => setState(() {}),
                    fillColor: AppColors.white,
                  ),
                ),
                // Scrollable List
                Expanded(
                  child: SingleChildScrollView(
                    controller:
                        _scrollController, // Attach the ScrollController,
                    child: Column(
                      children: filtered.map(
                        (e) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            margin: EdgeInsets.all(5).copyWith(bottom: 8.5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CharacterDetailsScreen(data: e),
                                ),
                              ),
                              child: Row(
                                children: [
                                  RoundedImage(
                                    imageUrl: e.avatar ?? "",
                                    height: 55,
                                    width: 55,
                                  ),
                                  WidthBox(8),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.name.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              "• " + (e.status ?? "unknown"),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: e.status
                                                                ?.toLowerCase() ==
                                                            "alive"
                                                        ? AppColors.success
                                                        : AppColors.warningHigh,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        HeightBox(3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.species ?? "unknown speccy",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CharacterForm())),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  exitDialog() {
    confirmationDialog(context,
            caution: "Do you want to Exit",
            cautionIcon: Icons.logout,
            isActionDanger: true)
        .then(
      (value) {
        if (value) {
          exit(0);
        }
      },
    );
  }
}
