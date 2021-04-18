import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF130D26),
          ),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Icon(
                              Icons.chevron_left_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                          ),
                          child: Text(
                            "Terms of Service",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "General Terms",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "By accessing and placing an order with Apollo, you confirm that you are in agreement with and bound by the terms of service contained in the Terms & Conditions outlined below. These terms apply to the entire website and any email or other type of communication between you and Apollo. Under no circumstances shall the Apollo team be liable for any direct, indirect, special, incidental, or consequential damages, including, but not limited to, loss of data or the inability to use, the materials on this site, even if the Apollo team or an authorized representative has been advised of the possibility of such damages. If your use of materials from this site results in the need for servicing, repair, or correction of equipment or data; you assume any costs thereof. Apollo will not be responsible for any outcome that may occur during the course of usage of our resources. We reserve the right to change and revise the resource usage policy at any moment.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "License",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Apollo grants you a revocable, non-exclusive, non-transferable, and limited license to download, install and use the app strictly in accordance with the terms of this agreement. These Terms & Conditions serve as a contract between you and Apollo (we, our, or us) grants you a revocable, non-exclusive, non-transferable, and limited license to download, install, and use the app strictly in accordance with the terms of this Agreement.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Definitions and Key Terms",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: Text(
                      "For this Terms and Conditions",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Cookie: a small amount of data generated by a website and saved by your web browser. It is used to identify your browser, provide analytics, remember information about you such as your language preference or login information.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Company: when this policy mentions Company, we, us, or our, it refers to the Apollo team that is responsible for your information under this Privacy Policy.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Country: where Apollo or the owners/developers of Apollo are based, in this case, is Bahrain.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Customer: refers to the company, organization, or person that signs up to use the Apollo Service to manage the relationships with your consumers or service users.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Device: any Internet-connected device such as a phone, tablet, computer, or any other device that can be used to visit Apollo and use the services.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "IP address: every device connected to the Internet is assigned a number known as an Internet protocol ('P) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Personnel: refers to those individuals who are employed by Apollo or are under contract to perform a service on behalf of one of the parties.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Personal Data: any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Service: refers to the service provided by Apollo as described in the relative terms (if available) and on this platform.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Third-party service: refers to advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "You: a person or entity that is registered with Apollo to use the Services.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Restrictions",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "You agree not to, and you will not permit others to:",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "License, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose or otherwise commercially exploit the service or make the platform available to any third party.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Modify, make derivative works of, disassemble, decrypt, reverse compile, or reverse engineer any part of the service.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Remove, alter, or obscure any proprietary notice (including any notice of copyright or trademark) of or its affiliates, partners, suppliers, or the licensors of the service.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Your Suggestions",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Any feedback, comments, ideas, improvements, or suggestions (collectively, Suggestions) provided by you to us with respect to the service shall remain the sole and exclusive property of us. We shall be free to use, copy, modify, publish, or redistribute the Suggestions for any purpose and in any way without any credit or any compensation to you.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Your Consent",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We've updated our Terms & Conditions to provide you with complete transparency into what is being set when you visit our site and how it's being used. By using our service and registering an account, you hereby consent to our Terms & Conditions.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Links to Other Websites",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Our service may contain links to other websites that are not operated by Us. If You click on a third-party link, You will be directed to that third party's site. We strongly advise You to review the Terms & Conditions of every site You visit. We have no control over and assume no responsibility for the content, Terms & Conditions, or practices of any third-party sites or services.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Cookies",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We use 'Cookies' to identify the areas of our website that you have visited. A Cookie is a small piece of data stored on your computer or mobile device by your web browser. We use Cookies to enhance the performance and functionality of our service but are non-essential to their use. However, without these cookies, certain functionality like videos may become unavailable or you would be required to enter your login details every time you visit our platform as we would not be able to remember that you had logged in previously. Most web browsers can be set to disable the use of Cookies. However, if you disable Cookies, you may not be able to access functionality on our website correctly or at all. We never place Personally Identifiable Information in Cookies.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Changes to Our Terms & Conditions",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "You acknowledge and agree that we may stop (permanently or temporarily) providing the Service (or any features within the Service) to you or to users generally at our sole discretion, without prior notice to you. You may stop using the Service at any time. You do not need to specifically inform us when you stop using the Service. You acknowledge and agree that if we disable access to your account, you may be prevented from accessing the Service, your account details, or any files or other materials which are contained in your account If we decide to change our Terms & Conditions, we will post those changes on this page, and/or update the Terms & Conditions modification date below",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Modifications to Our Service",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We reserve the right to modify, suspend or discontinue, temporarily or permanently, the service or any service to which it connects, with or without notice and without liability to you. ",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Updates to Our Service",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We may from time to time provide enhancements or improvements to the features/ functionality of the service, which may include patches, bug fixes, updates, upgrades, and other modifications ('Updates'). Updates may modify or delete certain features and/or functionalities of the service. You agree that we have no obligation to (i) provide any Updates, or (ii) continue to provide or enable any particular features and/or functionalities of the service to you. You further agree that all Updates will be (i) deemed to constitute an integral part of the service, and (ii) subject to the terms and conditions of this Agreement",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Third-Party Services",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We may display, include or make available third-party content (including data; information; applications, and other products services) or provide links to third-party websites or services ('Third-Party Services'). You acknowledge and agree that we shall not be responsible for any Third-Party Services, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality, or any other aspect thereof. We do not assume and shall not have any liability or responsibility to you or any other person or entity for any Third-Party Services. Third-Party Services and links thereto are provided solely as a convenience to you and you access and use them entirely at your own risk and subject to such third parties' terms and conditions.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Term and Termination",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "This Agreement shall remain in effect until terminated by you or us. We may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice. This Agreement will terminate immediately, without prior notice from us, in the event that you fail to comply with any provision of this Agreement. You may also terminate this Agreement by deleting the service and all copies thereof from your computer Upon termination of this Agreement, you shall cease all use of the service and delete all copies of the service from your computer. Termination of this Agreement will not limit any of our rights or remedies at law or in equity in case of breach by you (during the term of this Agreement) of any of your obligations under the present Agreement.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Copyright Infringement Notice",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "If you are a copyright owner or such owner's agent and believe any material from us constitutes an infringement on your copyright, please contact us setting forth the following information: (a) a physical or electronic signature of the copyright owner or a person authorized to act on his behalf; (b) identification of the material that is claimed to be infringing; (c) your contact information, including your address, telephone number, and an email; (d) a statement by you that you have a good faith belief that use of the material IS not authorized by the copyright owners; and (e) a statement that the information in the notification is accurate, and under penalty of perjury you are authorized to act on behalf of the owner.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Idemnification",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "You agree to indemnify and hold us and our parents, subsidiaries, affiliates, officers, employees, agents, partners and licensors (if any) harmless from any claim or demand, including reasonable attorneys' fees, due to or arising out of your: (a) use of the service; (b) violation of this Agreement or any law or regulation; or (c) violation of any right of a third party.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "No Warranties",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "The service is provided to you 'AS IS' and 'AS AVAILABLE' and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, we, on our own behalf and on behalf of our affiliates and our respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory, or otherwise, with respect to the service, including all implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement and warranties that may arise out of course of dealing, course of performance, usage or trade practice. ",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Without limitation to the foregoing, we provide no warranty or undertaking and makes no representation of any kind that the service Will meet your requirements, achieve any intended results, be compatible or work with any other software, websites, systems, or services, operate without interruption, meet any performance or reliability standards or be error-free or that any errors or defects can or will be corrected. Without limiting the foregoing, neither we nor any provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the service, or the information, content, and materials or products included thereon; (ii) that the service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the service; or (iv) that the service, its servers, the content, or e-mails sent from or on behalf of us are free of Viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components. Some jurisdictions do not allow the exclusion of or limitations on implied warranties or the limitations on the applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to you.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Limitation of Liability",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Notwithstanding any damages that you might incur, the entire liability of us and any of our suppliers under any provision of this Agreement and your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by you for the service. To the maximum extent permitted by applicable law, in no event shall we or our suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, for loss of data or other information, for business interruption, for personal injury, for loss of privacy arising out of or in any way related to the use of or inability to use the service, third-party software and/or third-party hardware used With the service, or otherwise in connection with any provision of this Agreement), even if we or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose. Some states/jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation or exclusion may not apply to you.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Severability",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "If any provision of this Agreement is held to be unenforceable or invalid; such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "This Agreement, together with the Privacy Policy and any other legal notices published by us on the Services, shall constitute the entire agreement between you and us concerning the Services. If any provision of this Agreement is deemed invalid by a court of competent jurisdiction, the invalidity of such provision shall not affect the validity of the remaining provisions of this Agreement, which shall remain in full force and effect No waiver of any term of this Agreement shall be deemed a further or continuing waiver of such term or any other term, and our failure to assert any right or provision under this Agreement shall not constitute a waiver of such right or provision YOU AND US AGREE THAT ANY CAUSE OF ACTION ARISING OUT OF OR RELATED TO THE SERVICES MUST COMMENCE WITHIN ONE (1) YEAR AFTER THE CAUSE OF ACTION ACCRUES OTHERWISE, SUCH CAUSE OF ACTION IS PERMANENTLY BARRED.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Waiver",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Except as provided herein, the failure to exercise a right or to require performance of an obligation under this Agreement shall not affect a party's ability to exercise such right or require such performance at any time thereafter nor shall be the waiver of a breach constitute waiver of any subsequent breach. ",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "No failure to exercise and no delay in exercising, on the part of either party any right or any power under this Agreement shall operate as a waiver of that right or power. Nor shall any single or partial exercise of any right or power under this Agreement preclude further exercise of that or any other right granted herein. In the event of a conflict between this Agreement and any applicable purchase or other terms, the terms of this Agreement shall govern.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Amendments to this Agreement",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We reserve the right, at its sole discretion, to modify or replace this Agreement at any time. If a revision is a material, we will provide at least 30 days’ notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion. By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use our service.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Entire Agreement",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "The Agreement constitutes the entire agreement between you and us regarding your use of the service and supersedes all prior and contemporaneous written or oral agreements between you and us. You may be subject to additional terms and conditions that apply when you use or purchase other services from us, which we will provide to you at the time of such use or purchase.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Update to our Terms",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We may change our Service and policies and we may need to make changes to these Terms so that they accurately reflect our Service and policies. Unless otherwise required by law, we will notify you (for example, through our Service) before we make changes to these Terms and give you an opportunity to review them before they go into effect Then, if you continue to use the Service, you will be bound by the updated Terms. If you do not want to agree to these or any updated Terms, you can delete your account.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Intellectual Property",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "Our platform and its entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video and audio, and the design, selection, and arrangement thereof), are owned by us, its licensors, or other providers of such material and are protected by Bahrain and international copyright, trademark, patent, trade secret and other intellectual property or proprietary rights laws. The material may not be copied, modified, reproduced, downloaded, or distributed in any way, in whole or in part, without the express prior written permission of us, unless and except as is expressly provided in these Terms & Conditions. Any unauthorized use of the material is prohibited.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Agreement to Arbitrate",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "This section applies to any dispute EXCEPT IT DOESN'T INCLUDE A DISPUTE RELATING TO CLAIMS FOR INJUNCTIVE OR EQUITABLE RELIEF REGARDING THE ENFORCEMENT OR VALIDITY OF YOUR OR Apollo's INTELLECTUAL PROPERTY RIGHTS The term 'dispute' means any dispute, action, or other controversies between you and us concerning the Services or this agreement, whether in contract, warranty, tort statute, regulation, ordinance, or any other legal or equitable basis. 'Dispute' will be given the broadest possible meaning allowable under law.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Notice of Dispute",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "In the event of a dispute, you or us must give the other a Notice of Dispute, which IS a written statement that sets forth the name, address, and contact information of the party giving it, the facts giving rise to the dispute and the relief requested. You must send any Notice of Dispute via email to: marc.agaceta@philschool-bh.com or genesis.basa@philschool-bh.com. We will send any Notice of Dispute to you by mail to your address if we have it, or otherwise to your email address. You and us will attempt to resolve any dispute through informal negotiation within sixty (60) days from the date the Notice of Dispute is sent After sixty (60) days, you or us may commence arbitration.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Binding Arbitration",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "If you and us don't resolve any Dispute by informal negotiation, any other effort to resolve the dispute will be conducted exclusively by binding arbitration as described in this section. You are giving up the right to litigate (or participate in as a party or class member) all disputes in court before a judge or jury. The dispute shall be settled by binding arbitration in accordance with the commercial arbitration rules of the American Arbitration Association. Either party may seek any interim or preliminary injunctive relief from any court of competent jurisdiction, as necessary to protect the party's rights or property pending the completion of arbitration Any and all legal, accounting, and other costs, fees, and expenses incurred by the prevailing party shall be borne by the non-prevailing party.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Submissions and Privacy",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "In the event that you submit or post any ideas, creative suggestions, designs, photographs, information, advertisements, data, or proposals, including ideas for new or improved products, services, features, technologies, or promotions, you expressly agree that such submissions will automatically be treated as non-confidential and non-proprietary and will become the sole property of us without any compensation or credit to you whatsoever. We and our affiliates shall have no obligations with respect to such submissions or posts and may use the ideas contained in such submissions or posts for any purposes in any medium in perpetuity, including, but not limited to, developing, manufacturing, and marketing products and services using such ideas.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Miscellaneous",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "If for any reason a court of competent jurisdiction finds any provision or portion of these Terms & Conditions to be unenforceable, the remainder of these Terms & Conditions will continue in full force and effect Any waiver of any provision of these Terms & Conditions will be effective only if in writing and signed by an authorized representative of us. We will be entitled to injunctive or other equitable relief (without the obligations of posting any bond or surety) in the event of any breach or anticipatory breach by you. We operate and control our Service from our offices in Bahrain. The Service is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation. Accordingly, those persons who choose to access our Service from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable. These Terms & Conditions (which include and incorporate our Privacy Policy) contains the entire understanding, and supersedes all prior understandings, between you and us concerning its subject matter, and cannot be changed or modified by you. The section headings used in this Agreement are for convenience only and will not be given any legal import.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                    ),
                    child: Text(
                      "Disclaimer",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Text(
                      "We are not responsible for any content, code, or any other imprecision. We do not provide warranties or guarantees. In no event shall we be liable for any special, direct, indirect, consequential, or incidental damages or any damages whatsoever, whether in an action of contract, negligence, or other torts, arising out of or in connection with the use of the Service or the contents of the Service. We reserve the right to make additions, deletions, or modifications to the contents on the Service at any time without prior notice. Our Service and its contents are provided 'as is' and 'as available' without any warranty or representations of any kind, whether express or implied. We are a distributor and not a publisher of the content supplied by third parties; as such, our exercises no editorial control over such content and makes no warranty or representation as to the accuracy, reliability, or currency of any information, content, service, or merchandise provided through or accessible via our Service. Without limiting the foregoing, We specifically disclaim all warranties and representations in any content transmitted on or in connection with our Service or on sites that may appear as links on our Service, or in the products provided as a part of, or otherwise in connection with, our Service, including without limitation any warranties of merchantability, fitness for a particular purpose or non-infringement of third party rights. No oral advice or written information given by us or any of its affiliates, employees, officers, directors, agents, or the like will create a warranty. Price and availability information is subject to change without notice Without limiting the foregoing, we do not warrant that our Service will be uninterrupted, uncorrupted, timely, or error-free.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFDAC4F7),
                              Color(0xFFad75f7),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Go Back",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BulletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(
        left: 30,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
