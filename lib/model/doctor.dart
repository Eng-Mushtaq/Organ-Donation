class Doctor {
  int? id, userid, mobile, salary;
  String? firstname, lastname, email, specialist, address;
  DateTime? dob;
  Doctor(
      {this.id,
      this.firstname,
      this.lastname,
      this.userid,
      this.mobile,
      this.email,
      this.dob,
      this.specialist,
      // this.salary,
      this.address});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    userid = json['userid'];
    mobile = json['mobile'];
    email = json['email'];
    dob = json['dob'];
    specialist = json['specialist'];
    // salary = json['salary'];
    address = json['address'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['userid'] = userid;
    data['mobile'] = mobile;
    data['email'] = email;
    data['dob'] = dob;
    data['specialist'] = specialist;
    // data['salary'] = salary;
    data['address'] = address;

    return data;
  }
}
