class DonorRequest {
  DonorRequest({
    required this.donorId,
    required this.Details,
    required this.DonorRequestDate,
    required this.Estate,
    required this.FirstName,
    required this.organ,
    required this.patient,
  });
  late final String donorId;
  late final String Details;
  late final String DonorRequestDate;
  late final String Estate;
  late final String FirstName;
  late final String organ;
  late final List<Patient> patient;
  DonorRequest.fromJson(Map<String, dynamic> json){
    donorId = json['donorId'];
    Details = json['Details'];
    DonorRequestDate = json['DonorRequestDate'];
    Estate = json['Estate'];
    FirstName = json['FirstName'];
    organ = json['organ'];
    patient = List.from(json['patient']).map((e)=>Patient.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['donorId'] = donorId;
    _data['Details'] = Details;
    _data['DonorRequestDate'] = DonorRequestDate;
    _data['Estate'] = Estate;
    _data['FirstName'] = FirstName;
    _data['organ'] = organ;
    _data['patient'] = patient.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Patient {
  Patient({
    required this.Id,
    required this.Organ,
    required this.Details,
    required this.Estate,
    required this.RequestDate,
    required this.FirstName,
    required this.Mobile,
    required this.Address,
    required this.Email,
    required this.DOB,
  });
  late final String Id;
  late final String Organ;
  late final String Details;
  late final String Estate;
  late final String RequestDate;
  late final String FirstName;
  late final String Mobile;
  late final String Address;
  late final String Email;
  late final String DOB;

  Patient.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Organ = json['Organ'];
    Details = json['Details'];
    Estate = json['Estate'];
    RequestDate = json['RequestDate'];
    FirstName = json['FirstName'];
    Mobile = json['Mobile'];
    Address = json['Address'];
    Email = json['Email'];
    DOB = json['DOB'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Organ'] = Organ;
    _data['Details'] = Details;
    _data['Estate'] = Estate;
    _data['RequestDate'] = RequestDate;
    _data['FirstName'] = FirstName;
    _data['Mobile'] = Mobile;
    _data['Address'] = Address;
    _data['Email'] = Email;
    _data['DOB'] = DOB;
    return _data;
  }
}