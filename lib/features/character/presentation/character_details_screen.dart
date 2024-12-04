import 'package:base_project/core/theme/colors.dart';
import 'package:base_project/core/widgets/custom_toaster.dart';
import 'package:base_project/core/widgets/global_dialogs.dart';
import 'package:base_project/core/widgets/rounded_image.dart';
import 'package:base_project/core/widgets/theme_app_bar.dart';
import 'package:base_project/features/character/models/character.dart';
import 'package:base_project/features/character/presentation/character_form.dart';
import 'package:base_project/features/character/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character? data;
  CharacterDetailsScreen({super.key, this.data});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late CharacterProvider characterProvider;
  @override
  void initState() {
    // TODO: implement initState
    characterProvider = Provider.of<CharacterProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    characterProvider = Provider.of<CharacterProvider>(context);
    double imageSize = 120;
    double topSpace = 100;
    return Scaffold(
      appBar: ThemeAppBar(
        title: widget.data != null ? "Character Details" : "No Data",
        otherIcon: PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onSelected: (value) {
            if (value == "edit") {
              // Navigate to the edit screen (CharacterForm)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterForm(data: widget.data),
                ),
              );
            } else if (value == "delete") {
              // Show a confirmation dialog to delete
              deleteItem(widget.data?.id ?? -1);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: "edit",
                child: Row(
                  children: [
                    Icon(Icons.edit,
                        color: AppColors.primary), // Custom color for the icon
                    SizedBox(width: 10),
                    Text(
                      "Edit",
                      style: TextStyle(
                        color: AppColors.primary, // Custom text color
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: "delete",
                child: Row(
                  children: [
                    Icon(Icons.delete,
                        color: Colors.red), // Custom color for the delete icon
                    SizedBox(width: 10),
                    Text(
                      "Delete",
                      style: TextStyle(
                        color:
                            Colors.red, // Custom text color for delete option
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12), // Custom border radius for the popover
          ),
          color: Colors.white, // Background color of the popover
          elevation: 5, // Add a little shadow to make it stand out
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: topSpace,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: AppColors.primary, width: 2)),
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40))),
                )),
            Positioned(
                top: topSpace - (imageSize / 1.4),
                left: 15,
                child: RoundedImage(
                  imageUrl: widget.data?.avatar ?? "",
                  width: imageSize,
                  height: imageSize,
                )),
            Positioned(
                top: topSpace + (imageSize / 2.4),
                left: 15,
                right: 15,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                    margin: EdgeInsets.all(5).copyWith(bottom: 8.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          8), // Optional: For rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Light shadow for depth
                          blurRadius: 8, // Soft shadow effect
                          offset: Offset(0, 4), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow(
                            "Name", widget.data?.name ?? "Not Available"),
                        const SizedBox(height: 15),
                        _buildDetailRow(
                            "Status", widget.data?.status ?? "Not Available"),
                        const SizedBox(height: 15),
                        _buildDetailRow(
                            "Species", widget.data?.species ?? "Not Available"),
                        const SizedBox(height: 15),
                        _buildDetailRow(
                            "Gender", widget.data?.gender ?? "Not Available"),
                        const SizedBox(height: 15),
                        _buildDetailRow("Origin",
                            widget.data?.origin?.name ?? "Not Available"),
                        const SizedBox(height: 15),
                        _buildDetailRow("Location",
                            widget.data?.location?.name ?? "Not Available"),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$label:  ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 15, color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  deleteItem(int id) {
    confirmationDialog(context,
            caution: "You want to delete ?", isActionDanger: true)
        .then(
      (value) {
        if (value) {
          characterProvider.deleteItem(widget.data!, context).then(
            (resp) {
              Navigator.pop(context);
              CusFlutterToast.showToast("Deleted Successfully");
            },
          );
        }
      },
    );
  }
}
