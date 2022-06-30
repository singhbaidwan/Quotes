//
//  CreatorsView.swift
//  Quotes
//
//  Created by Dalveer singh on 29/06/22.
//

import SwiftUI

struct CreatorsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var quoteContent:String
    var quoteAuthor :String
    var fixedHeight: CGFloat = UIScreen.main.bounds.width
    var ratiosArr = [["1" , "1"] , ["4" , "5"] , ["9" , "16"] , ["1.91" , "1"]]
    @State var i = 0
    @State var showAuthor: Bool = true
    @State var showLoader: Bool = false
    @State var ratio: [CGFloat] = [1,1]
    @State var backgroundImage:UIImage? = nil
    @State var bcOpacity: CGFloat = 0.7
    @State var fontColor: Color = .white
    @State var fontSize: CGFloat = 20
    @State var fontName: String = Constants.fontRegular
    @State var backgroundColor: Color = .black
    @State var showingAlert = false
    @State var isOpacityButtonAvailable: Bool = true
    @State var hideOpacityView:Bool = true
    @State var imageCategory: String = ""
    var body: some View {
        NavigationView{
            ZStack{
                
                // MARK: CREATOR VIEW -
                VStack{
                    ZStack(alignment:.bottomLeading){
                        ZStack{
                            QuotePostView
                        }
                        .frame(width:fixedHeight,height: fixedHeight)
                        
                        // Opacity Buttton
                        ZStack{
                            Button {
                                hideOpacityView.toggle()
                            } label: {
                                HStack{
                                    Spacer()
                                    HStack {
                                        Image(systemName: "pencil")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width:25,height: 25)
                                            .foregroundColor(.white)
                                    }
                                    .background(Color.black.opacity(0.5))
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 22.5).stroke(.white,lineWidth: 2))
                                    .scaleEffect(isOpacityButtonAvailable ? 1 : 0)
                                    .animation(.spring(), value: isOpacityButtonAvailable)
                                }
                            }
                            
                        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        // Ratio Button
                        ZStack{
                            Button {
                                withAnimation(.spring()) {
                                    i = i+1
                                    if i == ratiosArr.count{
                                        i=0
                                    }
                                    ratio = [StringToFloat(str: ratiosArr[i][0]) , StringToFloat(str: ratiosArr[i][1])]
                                }
                            } label: {
                                HStack{
                                    
                                    HStack {
                                        Image(systemName: "chart.pie.fill")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width:25,height: 25)
                                            .foregroundColor(.white)
                                        Text("\(ratiosArr[i][0]) : \(ratiosArr[i][1])")
                                            .foregroundColor(.white)
                                    }
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(22.5)
                                    .overlay(RoundedRectangle(cornerRadius: 22.5).stroke(.white,lineWidth: 2))
                                    
                                }
                            }
                            
                        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        VStack{
                            //                            Spacer()
                            Rectangle()
                                .fill(Color.gray.opacity(0.7))
                                .frame(height:0.7)
                        }
                        
                    }
                    .frame(width: fixedHeight, height: fixedHeight)
                    .background(Color.white)
                    
                    VStack{
                        Toggle(isOn: $showAuthor) {
                            Text("Show Author")
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
//                    FontColorView(fontColor: .black)
                    CreatorActionView(backgroundColor: $backgroundColor, fontColor: $fontColor , fontSize: $fontSize, fontName: $fontName, backgroundImage: $backgroundImage, imageCategory: $imageCategory , isOpacityButtonAvailable: $isOpacityButtonAvailable)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                    
                    
                    Spacer()
                }
                .navigationTitle("Creator View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAlert.toggle()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width:20,height: 20)
                                .foregroundColor(.black)
                        }
                        
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showLoader = true
                        } label: {
                            Image(systemName: "arrow.down.app")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width:20,height: 20)
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Are you sure"), message: Text("Your Saved changes will be lost"), primaryButton: .destructive(Text("Go Back!")){
                        presentationMode.wrappedValue.dismiss()
                    }, secondaryButton: .cancel())
                }
                if showLoader{
                    CustomAnimationView()
                        .frame(width:130,height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 7)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now()+1.3) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                }
            }
        }
    }
    
    
    
}
extension CreatorsView {
    var QuotePostView:some View{
        ZStack{
            if backgroundImage != nil{
                ZStack{
                    Image(uiImage: backgroundImage!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: calculateWidthRatio(for: fixedHeight-40, ratio: ratio) > fixedHeight ? fixedHeight-40 : calculateWidthRatio(for: fixedHeight-40, ratio: ratio), height: calculateWidthRatio(for: fixedHeight-40, ratio: ratio) > fixedHeight ? calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) : fixedHeight - 40)
                        .clipped()
                    Rectangle().fill(Color.black.opacity(bcOpacity))
                }
            }
            VStack{
                Text(quoteContent)
                    .foregroundColor(fontColor)
                    .font(.custom(fontName, size: fontSize))
                    .multilineTextAlignment(.center)
                    .padding()
                if showAuthor{
                    Text("- \(quoteAuthor)")
                        .foregroundColor(fontColor)
                        .font(.custom(fontName, size: fontSize-7))
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
            }
            .frame(width: calculateWidthRatio(for: fixedHeight-40, ratio: ratio) > fixedHeight ? fixedHeight-40 : calculateWidthRatio(for: fixedHeight-40, ratio: ratio), height: calculateWidthRatio(for: fixedHeight-40, ratio: ratio) > fixedHeight ? calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) : fixedHeight - 40)
            .background(backgroundColor)
            .shadow(color: .black.opacity(0.12), radius: 15, x: 0, y: 7)
            
        }
    }
    // MARK: Function
    func calculateWidthRatio(for height: CGFloat , ratio: [CGFloat]) -> CGFloat {
        let width = height * (ratio[0]/ratio[1])
        return width
    }
    
    func calculateHeightRatio(for width: CGFloat , ratio: [CGFloat]) -> CGFloat {
        let height = width * (ratio[1]/ratio[0])
        return height
    }
    
    func StringToFloat(str: String) -> CGFloat {
        let string = str
        var cgFloat:CGFloat = 0
        if let doubleValue = Double(string){
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }
}
struct CreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorsView(quoteContent: "No pain No gain", quoteAuthor: "Me")
    }
}
