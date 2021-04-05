//
//  DesignSystem.swift
//  CovidMate
//
//  Created by NAVEEN MADHAN on 4/5/21.
//

import Foundation
import SwiftUI

enum DesignSystem {}

extension DesignSystem {
    
    public struct SymptomCard: View
    {
        let imageName: String
        
        var body: some View
        {
            VStack {
                Image(imageName)
                Text(imageName.capitalized)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }.cornerRadius(15)
            .padding(10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
    public struct Title: View {
        
        let title: String
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.system(size: 19, weight: .bold))
                Spacer()
            }
        }
    }
    
    
    public struct PreventionCard: View
    {
        let imageName: String
        let title: String
        let text: String
        
        var body: some View
        {
            ZStack(alignment: .leading) {
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(title).font(.system(size: 16, weight: .bold, design: .default))
                        Spacer()
                        Text(text)
                            .font(.system(size: 10))
                        Spacer()
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width/2 + 15, height: nil, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(height: 134)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.leading, 56)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 156, alignment: .leading)
                    .clipped()
                    .offset(y: -2.0)
            }
        }
    }
}
