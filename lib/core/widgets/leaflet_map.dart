// import 'package:base_project/Authentication/Provider/auth_provider.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:provider/provider.dart';

// // ignore: must_be_immutable
// class LeafLetMap extends StatefulWidget {
//   LatLng? initialCenter;
//   MapController mapController;
//   List<Widget> markerLayers;
//   List<LatLng>? polylinePoints;
//   LeafLetMap(
//       {super.key,
//       this.initialCenter,
//       required this.mapController,
//       required this.markerLayers,
//       this.polylinePoints});

//   @override
//   State<LeafLetMap> createState() => LeafLetMapState();
// }

// class LeafLetMapState extends State<LeafLetMap> {
//   late AuthProvider authProvider;

//   @override
//   void initState() {
//     authProvider = Provider.of<AuthProvider>(context, listen: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//       mapController: widget.mapController,
//       options: MapOptions(
//           interactionOptions: const InteractionOptions(),
//           initialCenter: widget.initialCenter != null
//               ? widget.initialCenter!
//               : const LatLng(50.5, 30.51),
//           initialZoom: 17.0,
//           maxZoom: 20,
//           minZoom: 12),
//       children: [
//         TileLayer(
//           urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
//         ),
//         widget.polylinePoints != null
//             ? PolylineLayer(polylines: [
//                 Polyline(
//                   points: widget.polylinePoints!,
//                   color: AppColors.primary,
//                   strokeWidth: 5.0,
//                 ),
//               ])
//             : const SizedBox(),
//         ...widget.markerLayers,
//       ],
//     );
//   }
// }
