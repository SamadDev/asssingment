import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/form_validator.dart';
import 'package:flutter_dashboard/core/responsive.dart';
import 'package:flutter_dashboard/core/toast.dart';
import 'package:flutter_dashboard/features/contact/blocs/bloc/contact_bloc.dart';
import 'package:flutter_dashboard/features/share/widgets/primary_dropdown_field_widget.dart';
import 'package:flutter_dashboard/features/share/widgets/primary_text_field_widget.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';

import '../../../core/theme.dart';
import 'two_widget_per_row_widget.dart';

showAddEditContactPopUp(BuildContext context, [Map? contact]) => showDialog(

      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: kcBlack,

        content: _AddEditContactWidget(contact: contact),
      ),
    );

class _AddEditContactWidget extends StatelessWidget {
  final Map? contact;
  const _AddEditContactWidget({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    Map formData = contact ?? {};
    return SizedBox(
      width: screenWidth(context) / (isSm(context) ? 1 : 2),
      child: Form(
        key: FormValidator.addEditContactFormKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  SizedBox(),
                TextWidget(
                  contact == null ? 'Add New Contact' : 'Edit Contact',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            TwoWidgetPerRowWidget(
              firstWidget: PrimaryTextFieldWidget(
                label: 'Name',
                validator: FormValidator.isRequired,
                initialValue: formData['name'],
                onChanged: (value) => formData['name'] = value,
              ),
              secondWidget: PrimaryTextFieldWidget(
                label: 'National ID',
                initialValue: formData['nationalId'],
                onChanged: (value) => formData['nationalId'] = value,
              ),
            ),
            TwoWidgetPerRowWidget(
              firstWidget: PrimaryDropdownFieldWidget(
                label: 'Gender',
                initialValue: formData['gender'],
                items: const [
                  DropdownMenuItem(
                    value: 'Male',
                    child: TextWidget('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'Female',
                    child: TextWidget('Female'),
                  ),
                ],
                onChanged: (value) => formData['gender'] = value,
              ),
              secondWidget: PrimaryDropdownFieldWidget(
                label: 'Profession',
                initialValue: formData['profession'],
                items: const [
                  DropdownMenuItem(
                    value: 'Engineer',
                    child: TextWidget('Engineer'),
                  ),
                  DropdownMenuItem(
                    value: 'Doctor',
                    child: TextWidget('Doctor'),
                  ),
                ],
                onChanged: (value) => formData['profession'] = value,
              ),
            ),
            TwoWidgetPerRowWidget(
              firstWidget: PrimaryDropdownFieldWidget(
                label: 'Nationality',
                initialValue: formData['nationality'],
                items: const [
                  DropdownMenuItem(
                    value: 'Egyptian',
                    child: TextWidget('Egyptian'),
                  ),
                  DropdownMenuItem(
                    value: 'American',
                    child: TextWidget('American'),
                  ),
                ],
                onChanged: (value) => formData['nationality'] = value,
              ),
              secondWidget: PrimaryDropdownFieldWidget(
                label: 'Language',
                initialValue: formData['language'],
                items: const [
                  DropdownMenuItem(
                    value: 'Arabic',
                    child: TextWidget('Arabic'),
                  ),
                  DropdownMenuItem(
                    value: 'English',
                    child: TextWidget('English'),
                  ),
                ],
                onChanged: (value) => formData['language'] = value,
              ),
            ),
            TwoWidgetPerRowWidget(
              firstWidget: PrimaryTextFieldWidget(
                label: 'Mobile 1',
                validator: FormValidator.isRequired,
                initialValue: formData['mobile1'],
                onChanged: (value) => formData['mobile1'] = value,
              ),
              secondWidget: PrimaryTextFieldWidget(
                label: 'Mobile 2',
                initialValue: formData['mobile2'],
                onChanged: (value) => formData['mobile2'] = value,
              ),
            ),
            TwoWidgetPerRowWidget(
              firstWidget: PrimaryTextFieldWidget(
                label: 'Address',
                initialValue: formData['address'],
                onChanged: (value) => formData['address'] = value,
              ),
              secondWidget: PrimaryTextFieldWidget(
                label: 'Email',
                initialValue: formData['email'],
                onChanged: (value) => formData['email'] = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: PrimaryTextFieldWidget(
                label: 'Note',
                initialValue: formData['note'],
                onChanged: (value) => formData['note'] = value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(kcPrimary),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize:
                    WidgetStateProperty.all<Size>(const Size(150, 50)),
                  ),
                  child: const TextWidget(
                    'Cancel',
                    color: kcWhite,
                    fontSize: 15,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (FormValidator.addEditContactFormKey.currentState!
                        .validate()) {
                      if (contact == null) {
                        formData['id'] = contactBloc.contacts.length + 1;
                        contactBloc.contacts.add(formData);
                      } else {
                        contactBloc.contacts[contactBloc.contacts.indexWhere(
                                (element) => element['id'] == formData['id'])] =
                            formData;
                      }
                      contactBloc.add(UpdateContactUIEvent());
                      showToastFlutter('Contact added successfully');
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(kcBlue),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize:
                    WidgetStateProperty.all<Size>(const Size(150, 50)),
                  ),
                  child: const TextWidget(
                    'Save',
                    color: kcWhite,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
