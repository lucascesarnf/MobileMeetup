//
//  HomeView.swift
//  MobileMeetup
//
//  Created by Lucas César  Nogueira Fonseca on 10/03/20.
//  Copyright © 2020 Lucas César  Nogueira Fonseca. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.backgroundGreen
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 40) {
                logoImage
                talksView
            }
        }
    }
    
    var talksView: some View {
        VStack(alignment: .center) {
            Text("Talks")
            .fontWeight(.bold)
            .font(.system(size: 22))
            .padding(7)
            ForEach(viewModel.talksGrid, id: \.self) { talks in
                HStack {
                    ForEach(talks, id: \.self) { talk in
                        Button(action: {
                            self.viewModel.didSelectTalk(talk)
                        }, label: {
                        Text(talk)
                            .fontWeight(.bold)
                            .foregroundColor(.backgroundGreen)
                            .padding(5)
                            .background(Color.white)
                        })
                        .cornerRadius(5)
                        .padding(3)
                    }
                }.padding(.top, 20)
            }
        }.frame(minWidth: 50, maxWidth: .infinity, alignment: .top)
    }
    
    var buttons: some View {
        VStack(alignment: .center, spacing: 20) {
            businessButton
            logicButton
            someButton
        }
    }
    
    var logoImage: some View {
        Image("logo")
            .resizable()
            .frame(width: 280.0, height: 280.0)
    }
    
    
    var businessButton: some View {
        Button(action: {
            self.viewModel.businessLogic()
        }) {
            Text("Some business")
                .fontWeight(.bold)
                .frame(width: 250.0, height: 20.0)
                .font(.title)
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(.backgroundGreen)
                .padding(10)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 5)
            )
        }
    }
    
    var logicButton: some View {
        Button(action: {
            self.viewModel.computeSomething()
        }) {
            Text("Some Logic")
                .fontWeight(.bold)
                .frame(width: 250.0, height: 20.0)
                .font(.title)
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(.backgroundGreen)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 5)
            )
        }
    }
    
    var someButton: some View {
        Button(action: {
            self.viewModel.doSomething()
        }) {
            Text("Something")
                .fontWeight(.bold)
                .frame(width: 250.0, height: 20.0)
                .font(.title)
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .foregroundColor(.backgroundGreen)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.white, lineWidth: 5)
            )
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(talks: ["Testes Automatizados", "Testes Unitários", "Android Developer", "Koin", "iOS Development", "Threads"]))
    }
}
#endif
