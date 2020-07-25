//
//  ContentView.swift
//  MatchedGeometryEffectExam5
//
//  Created by Erdi Ergene on 18.07.2020.
//

import SwiftUI

struct ContentView : View {
    @State private var isExpanded = false
    @Namespace private var namespace
    
    
    var body: some View {
        Group() {
        if isExpanded {
            VerticalView(namespace: namespace)
        } else {
            HorizontalView(namespace: namespace)
        }
        }.onTapGesture {
        withAnimation {
            isExpanded.toggle()
        }
        }
    }
}

struct VerticalView: View {
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.pink)
            .frame(width: 60, height: 60)
            .matchedGeometryEffect(id: "rect", in: namespace, properties: .frame)
        Text("Hello SwiftUI!").fontWeight(.semibold)
            .matchedGeometryEffect(id: "text", in: namespace)
        }
    }
}

struct HorizontalView: View {
    var namespace: Namespace.ID
    
    var body: some View {
        HStack {
        Text("Hello SwiftUI!").fontWeight(.semibold)
            .matchedGeometryEffect(id: "text", in: namespace)
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.pink)
            .frame(width: 60, height: 60)
            .matchedGeometryEffect(id: "rect", in: namespace, properties: .frame)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
