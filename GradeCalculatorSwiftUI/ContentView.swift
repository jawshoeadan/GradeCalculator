//
//  ContentView.swift
//  GradeCalculatorSwiftUI
//
//  Created by Josh Daneshrad on 3/30/20.
//  Copyright © 2020 Josh Daneshrad. All rights reserved.
//

import SwiftUI
import Combine




extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct Background<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color(colorScheme == .dark ? .black : .white)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100)
            .overlay(content)
    }
}


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var value: CGFloat = 0
    @State var Section1: String = ""
    @State var Section2: String = ""
    @State var Section3: String = ""
    @State var Section4: String = ""
    @State var Section5: String = ""
    @State var Section6: String = ""
    @State var Percentage1: String = ""
    @State var Percentage2: String = ""
    @State var Percentage3: String = ""
    @State var Percentage4: String = ""
    @State var Percentage5: String = ""
    @State var Percentage6: String = ""
    @State var Desired: String = ""
    @State var Output = "\n\n\n"
    @State var sharedResult = ""
    @State public var isShareSheetShowing = false
    @State public var dataWrong = false
    @State public var shareBlank = false
    var vertPadding: CGFloat {
        return UIScreen.main.bounds.height * 0.01
    }
    var fontSize: CGFloat {
        return (UIScreen.main.bounds.height * 0.019)
    }
    var calcWidth: CGFloat {
        return UIScreen.main.bounds.width * 0.4
    }
    var devWidth: CGFloat {
        return UIScreen.main.bounds.width
    }



    var body: some View {
        Background {
            VStack {
                
                
                    VStack{
                    /*      Text("Josh's Grade Calculator")
                    .font(.largeTitle)
                    .padding() */
                    HStack {
                        VStack(alignment: .center) {
                            Text("Grade")
                                .font(.system(size: self.fontSize))
                                .font(.subheadline)
                                
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding(.horizontal, 9.0)

                            TextField("Section 1", text: self.$Section1)

                                .padding(.bottom, self.vertPadding)
                                .font(.system(size: self.fontSize))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)



                            TextField("Section 2", text: self.$Section2)

                                .padding(.bottom, self.vertPadding)
                                .font(.system(size: self.fontSize)).textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Section 3", text: self.$Section3)

                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Section 4", text: self.$Section4)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Section 5", text: self.$Section5)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Section 6", text: self.$Section6)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            Text("Desired Grade:")
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, -5.0)
                                .padding(.top, 5.0)

                        }


                        .padding(.trailing, self.devWidth / 16)
                        .padding(.leading, self.devWidth / 8)
                            .padding(.bottom, 23.0)

                        VStack(alignment: .center) {
                            Text("Percentage of Grade")
                                .font(.system(size: self.fontSize))
                                .font(.subheadline)
                                .fontWeight(.medium)


                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                                .padding(.leading, -50.0)
                                .padding(/*@START_MENU_TOKEN@*/.trailing, -50.0/*@END_MENU_TOKEN@*/)


                            TextField("Percentage 1", text: self.$Percentage1)
                               // .frame(width: self.devWidth / 3 )
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)



                            TextField("Percentage 2", text: self.$Percentage2)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Percentage 3", text: self.$Percentage3)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Percentage 4", text: self.$Percentage4)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Percentage 5", text: self.$Percentage5)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Percentage 6", text: self.$Percentage6)
                                .font(.system(size: self.fontSize))
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)

                            TextField("Desired Grade", text: self.$Desired)
                                .padding(.bottom, self.vertPadding) .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .font(.system(size: self.fontSize))



                        }

                        .padding(.leading, self.devWidth / 16)
                        .padding(.trailing, self.devWidth / 8)



                    }.padding(.top)
                }
                

                // .offset(y: -self.value)
                // .animation(.spring())
                /*   .onAppear()
                {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main)
                    { (noti) in
                        let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let height = value.height

                        self.value = height - 300 // *******
                    }
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main)
                    { (noti) in


                        self.value = 0
                    }
                } */
                Button(action: {
                    self.Calculate()
                    self.endEditing()
                    self.Success()


                }) {
                    Text("Calculate")
                        .font(.system(size: (self.fontSize * 2.0)))


                }
                .padding(.horizontal)
                
                    .padding(.vertical, self.vertPadding)
                
                    .background(Color(red: 66 / 255, green: 245 / 255, blue: 93 / 255))
                    .font(.custom("DIN Alternate Bold.ttf", size: 30))
                    .cornerRadius(10)
                
                /*  Button(action: {
                    self.Calculate()
                    self.Warning()
                }) {
                    Text("Warning")
                    
                        
                    }.frame(width: 200)
                .padding()
                .background(Color(red: 66 / 255, green: 245 / 255, blue: 93 / 255))
                    .font(.custom("DIN Alternate Bold.ttf", size: 30))
                    .cornerRadius(10)*/

                Button(action: {
                    self.Clear()
                    self.Warning()
                    self.endEditing()

                }) {
                    Text("Clear")
                        .font(.system(size: self.fontSize * 1.5))
                        .padding(.horizontal, 50.0)
                        
                }.alert(isPresented: self.$dataWrong) {
                    Alert(title: Text("Invalid inputs"), message: Text("The data you entered was invalid. Please make sure you entered your intended values."), dismissButton: .default(Text("OK")))
                }
                    .padding(.vertical, self.vertPadding)
                .padding(.horizontal)
                    


                Text(self.Output)
                    .padding(.vertical)
                    .padding(.horizontal, 15.0)
                    .font(.system(size: self.fontSize))
                Button(action: {
                    self.shareButton()
                    self.Medium()
                }) {
                    Image(systemName: "square.and.arrow.up").resizable().frame(width: 32, height: 44)
                }.alert(isPresented: self.$shareBlank) {
                    Alert(title: Text("Blank inputs"), message: Text("Please calculate your grade before sharing."), dismissButton: .default(Text("OK")))
                }
                .padding(.horizontal)
                .padding(/*@START_MENU_TOKEN@*/.bottom, 30.0/*@END_MENU_TOKEN@*/)

                
            }.padding(.top, 20.0)
            
        }.onTapGesture {
            self.endEditing()
            
        }
        

    }
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    private func Success() {
        let notifGenerator = UINotificationFeedbackGenerator()
        notifGenerator.notificationOccurred(.success)
    }
    private func Warning() {
        let notifGenerator = UINotificationFeedbackGenerator()
        notifGenerator.notificationOccurred(.warning)
    }
    private func Error() {
        let notifGenerator = UINotificationFeedbackGenerator()
        notifGenerator.notificationOccurred(.error)
    }
    private func Light() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .light)
        impactGenerator.impactOccurred()
    }
    private func Medium() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
        impactGenerator.impactOccurred()
    }

    private func Calculate()
    {

        if Section1 == "" {
            Section1 = "0.0"
        }
        if Section2 == "" {
            Section2 = "0.0"
        }
        if Section3 == "" {
            Section3 = "0.0"
        }
        if Section4 == "" {
            Section4 = "0.0"
        }
        if Section5 == "" {
            Section5 = "0.0"
        }
        if Section6 == "" {
            Section6 = "0.0"
        }
        if Percentage1 == "" {
            Percentage1 = "0.0"
        }
        if Percentage2 == "" {
            Percentage2 = "0.0"
        }
        if Percentage3 == "" {
            Percentage3 = "0.0"
        }
        if Percentage4 == "" {
            Percentage4 = "0.0"
        }
        if Percentage5 == "" {
            Percentage5 = "0.0"
        }
        if Percentage6 == "" {
            Percentage6 = "0.0"
        }
        // Swift is weakly typed, Double(var.text!) Double casts the value once it is unwrappedm ?? means if the value isn't a double it is default set to 0.0.
        // I use these values for the calculations because I know they are doubles and if they are 0, they won't be included in the calculation
        // Swift gives error messages even when they arent' required ex: suggesting constants because they arent't modified
        var s1 = Double(Section1) ?? 0.0;
        var s2 = Double(Section2) ?? 0.0;
        var s3 = Double(Section3) ?? 0.0;
        var s4 = Double(Section4) ?? 0.0;
        var s5 = Double(Section5) ?? 0.0;
        var s6 = Double(Section6) ?? 0.0;
        var p1 = Double(Percentage1) ?? 0.0;
        var p2 = Double(Percentage2) ?? 0.0;
        var p3 = Double(Percentage3) ?? 0.0;
        var p4 = Double(Percentage4) ?? 0.0;
        var p5 = Double(Percentage5) ?? 0.0;
        var p6 = Double(Percentage6) ?? 0.0;

        var des = Double(Desired) ?? 0.0;

        s1 = Double(round(100*s1)/100)
         s2 = Double(round(100*s2)/100)
         s3 = Double(round(100*s3)/100)
         s4 = Double(round(100*s4)/100)
         s5 = Double(round(100*s5)/100)
         s6 = Double(round(100*s6)/100)
        p1 = Double(round(100*p1)/100)
        p2 = Double(round(100*p2)/100)
        p3 = Double(round(100*p3)/100)
        p4 = Double(round(100*p4)/100)
        p5 = Double(round(100*p5)/100)
        p6 = Double(round(100*p6)/100)
        des = Double(round(100*des)/100)
        // The calculation adds up all of the grades times their respective percentage values times 100 and divides it by the total percent to get the current grade


        let num = ((s1 * p1 * 0.01) + (s2 * p2 * 0.01) + (s3 * p3 * 0.01) + (s4 * p4 * 0.01) + (s5 * p5 * 0.01) + (s6 * p6 * 0.01)) * 100
        let denom = (p1 + p2 + p3 + p4 + p5 + p6)
        var quotient: Double = num / denom
        //quotient is current grade
        //remass (remaining assignments) is the grade required on the rest of material, perleft is the percent left used for the output.
        var perleft = 100.0 - denom
        var remass = (des - (quotient * denom * 0.01)) / (perleft * 0.01)

        quotient = Double(round(100*quotient)/100)
        perleft = Double(round(100*perleft)/100)
        remass = Double(round(100*remass)/100)
        
        if(String(quotient) == "nan") {
            dataWrong = true
            self.Error()
        }
        else {
            self.Warning()
            if (des == 0.0 && quotient != Double.nan) {
                Output = "\nYour current grade is: \(quotient)%\n"
                sharedResult = "I calculated my grade using GradeCalculator and it is currently \(quotient)%\n"
            }
            //If the user enters a desired grade, the app just outputs the current grade and only sends the current grade through the share function, otherwise it sends the current grade, desired grade, grade required on remaining assignments and the percentage of the material left to the output and to the share fuction.
            // When adding a variable to a string the syntax is "blah blah \(String) " instead of "blah" + String
            if (des != 0.0 && quotient != Double.nan) {
                Output = "Your current grade is: \(quotient)%. \nTo get your desired grade of \(des)% you need \(remass)% on the remaining \(perleft)% of the material."
                sharedResult = "I just calculated my grade using GradeCalculator and it is currently \(quotient)%. \n\nIn order to get my desired grade of \(des)% in this class, I need to get \(remass)% on the remaining material \(perleft)% of the material."
            }
        }
        if Section1 == "0.0" {
            Section1 = ""
        }
        if Section2 == "0.0" {
            Section2 = ""
        }
        if Section3 == "0.0" {
            Section3 = ""
        }
        if Section4 == "0.0" {
            Section4 = ""
        }
        if Section5 == "0.0" {
            Section5 = ""
        }
        if Section6 == "0.0" {
            Section6 = ""
        }
        if Percentage1 == "0.0" {
            Percentage1 = ""
        }
        if Percentage2 == "0.0" {
            Percentage2 = ""
        }
        if Percentage3 == "0.0" {
            Percentage3 = ""
        }
        if Percentage4 == "0.0" {
            Percentage4 = ""
        }
        if Percentage5 == "0.0" {
            Percentage5 = ""
        }
        if Percentage6 == "0.0" {
            Percentage6 = ""
        }
    }

    private func Clear() {
        Section1 = ""
        Section2 = ""
        Section3 = ""
        Section4 = ""
        Section5 = ""
        Section6 = ""
        Percentage1 = ""
        Percentage2 = ""
        Percentage3 = ""
        Percentage4 = ""
        Percentage5 = ""
        Percentage6 = ""
        Output = "\n\n\n"
        Desired = ""
        sharedResult = ""

    }
    func shareButton() {
        if(sharedResult == "") {
            self.Error()
            shareBlank = true
        }
        else {
            self.Medium()
            isShareSheetShowing.toggle()

            let av = UIActivityViewController(activityItems: [sharedResult], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
            if UIDevice.current.userInterfaceIdiom == .pad {
                av.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
                av.popoverPresentationController?.sourceRect = CGRect(
                    x: (UIScreen.main.bounds.width / 2) - 100,
                    y: (UIScreen.main.bounds.height / 2.3) + 350,
                    width: 200, height: 200)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                .previewDisplayName("iPhone 11 Pro Max")
                .environment(\.colorScheme, .dark)
            ContentView()
            .previewDevice("iPhone 8 Plus")
            .previewDisplayName("iPhone 8 Plus")
            .environment(\.colorScheme, .dark)
           

            ContentView()
                .previewDevice("iPhone SE (1st generation)")
                .previewDisplayName("LITERAL BOOTYCHEEKS")
                .environment(\.colorScheme, .dark)
            /*

            ContentView()
                           .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                           .previewDisplayName("iPhone 11 Pro")
                           .environment(\.colorScheme, .dark)

            ContentView()
                .previewDevice("iPhone 8 Plus")
                .previewDisplayName("Slightly larger pain in the Ass")
                .environment(\.colorScheme, .dark)*/

        }

    }
}


