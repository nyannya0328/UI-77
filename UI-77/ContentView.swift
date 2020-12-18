//
//  ContentView.swift
//  UI-77
//
//  Created by にゃんにゃん丸 on 2020/12/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var selectedtab = "p1"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var xAis : CGFloat = 0
    
    @Namespace var animation
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection:$selectedtab){
                
                Color("c1")
                    .tag("p1")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color("c2")
                    .tag("p2")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.blue
                    .tag("p3")
                    .ignoresSafeArea(.all, edges: .all)
                
                Color.purple
                    .tag("p4")
                    .ignoresSafeArea(.all, edges: .all)
                
            }
            
            HStack(spacing:15){
                
                ForEach(tabs,id:\.self){image in
                    
                    GeometryReader {reader in
                        Button(action: {
                            withAnimation(.spring()){
                                
                                selectedtab = image
                                xAis = reader.frame(in: .global).minX
                                
                            }
                            
                        }, label: {
                            Image(image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(selectedtab == image ? getColor(image: image) : Color.gray)
                                .padding(selectedtab == image ? 15 : 0)
                                .background(Color.white.opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedtab == image ? (reader.frame(in: .global).minX - reader.frame(in:.global).midX) : 0, y: selectedtab == image ? -45 : 0)
                                
                    })
                        .onAppear(perform: {
                            if image == tabs.first{
                                
                                xAis = reader.frame(in: .global).minX
                                
                            }
                        })
                        
                        
                    }
                    .frame(width: 25, height: 30)
                    if image != tabs.last{Spacer(minLength: 0)}
                    
                    
                    
                }
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color.white.clipShape(CustomShape(xAxis: xAis)) .cornerRadius(10))
           
            .padding(.horizontal)
        
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
        })
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
    
    func getColor(image:String) -> Color{
        switch image {
        case "p1":return Color.red
        case "p2":return Color("c1")
        case "p3":return Color("c2")
            
            
        default: return Color.blue
        
        }
        
        
    }
    
}
var tabs = ["p1","p2","p3","p4"]
