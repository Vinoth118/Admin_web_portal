import 'package:admin_web_portal/components/side_menu_modal/side_menu_modal.dart';
import 'package:admin_web_portal/models/admin/admin.dart';
import 'package:admin_web_portal/models/admin/create_admin.dart';
import 'package:admin_web_portal/models/profile.dart';
import 'package:admin_web_portal/models/role/create_role.dart';
import 'package:admin_web_portal/models/role/role.dart';


final profileMock = Profile(name: 'Sathish');
final rolesMock = Role(name: 'Manager');
final adminMock = Admin(name: "Vinoth", sId: "abcd");
final createAdminMock = CreateAdmin(name: "Vinoth");
final createRoleMock = CreateRole(name: "Vinoth");
final sideMenuIsSelectedMock = true;
final sideMenuOptionMock = 'dashboard';
final sideMenuModalMock = [
  SideMenuModal(isSelected: false, option: 'dashboard'),
  SideMenuModal(isSelected: false, option: 'roles'),
  SideMenuModal(isSelected: false, option: 'admin'),
];
