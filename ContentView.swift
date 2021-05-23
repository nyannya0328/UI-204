//
//  ContentView.swift
//  UI-204
//
//  Created by にゃんにゃん丸 on 2021/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack(spacing:25){
            
            TextShiemer(title: "SWIFT UI", isOn: $isOn)
            
            
            TextShiemer(title: "APPLE", isOn: $isOn)
            
            TextShiemer(title: "IMAC", isOn: $isOn)
                
            
            Toggle(isOn: $isOn, label: {
                Text("SWITCH")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            })
            
        
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
       
        .background(Color.orange.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextShiemer : View {
    var title : String
    @State var show = false
    @Binding var isOn : Bool

    
    
    var body: some View{
        
        ZStack{
            
            
            Text(title)
                .font(.system(size: 70, weight: .heavy))
                .foregroundColor(.red)
                .kerning(3)
            
            HStack(spacing:0){
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    
                    Text(String(title[title.index(title.startIndex,offsetBy : index)]))
                        .font(.system(size: 70, weight: .heavy))
                        .foregroundColor(isOn ? getColor() : .white)
                        .kerning(3)
                    
                }
                
                
                
            }
            .mask(
            
            
            
            Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.blue,.green,.red]), startPoint: .leading, endPoint: .trailing)
                
                
                
                )
                .rotationEffect(.init(degrees: 70))
                .cornerRadius(20)
                
                .offset(x: -250)
                .offset(x: show ? 500 : 0)
            
            )
            .onAppear(perform: {
                withAnimation(Animation.linear.speed(0.3).repeatForever(autoreverses: false)){
                    
                    
                    show.toggle()
                }
            })
        }
    }
    
    func getColor() ->Color{
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
        
    }
}
