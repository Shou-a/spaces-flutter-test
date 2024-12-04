enum RequestStatus {
  // ignore: constant_identifier_names
  request_sent_to_receiver,
  // ignore: constant_identifier_names
  request_accepted,
  // ignore: constant_identifier_names
  request_rejected,
  // ignore: constant_identifier_names
  bot_allocated,
  // ignore: constant_identifier_names
  otw_sender,
  // ignore: constant_identifier_names
  at_sender,
  // ignore: constant_identifier_names
  otw_receiver,
  // ignore: constant_identifier_names
  at_receiver,
  // ignore: constant_identifier_names
  completed,
  // ignore: constant_identifier_names
  cancelled
}

stringToRequestStatus(String? status) => RequestStatus.values
    .where((e) => e.toString().split('.').last == status)
    .firstOrNull;
