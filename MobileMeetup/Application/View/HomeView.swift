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
        ScrollView {
            VStack {
                VStack(alignment: .center, spacing: 40) {
                    logoImage
                    if !viewModel.lastTalks.isEmpty {
                        lastTalksView
                    }
                    talksView
                }
            }
        }.background(Color.backgroundGreen
            .edgesIgnoringSafeArea(.all))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }

    var lastTalksView: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Last Talks")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .padding(7)

                Button(action: {
                    self.viewModel.clearLastTalks()
                }, label: {
                    Image("close")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20.0, height: 20.0)
                })
            }

            ForEach(viewModel.lastTalks.reversed(), id: \.self) { talk in
                Text(talk)
                    .fontWeight(.bold)
                    .foregroundColor(.backgroundGreen)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(3)
            }
        }
    }

    var talksView: some View {
        VStack(alignment: .center) {
            Text("Talks")
                .fontWeight(.bold)
                .foregroundColor(.white)
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

    var logoImage: some View {
        Image("logo")
            .resizable()
            .frame(width: 200.0, height: 200.0)
    }
}

#if DEBUG
struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(talks: ["Testes Automatizados",
                                                  "Testes Unitários",
                                                  "Android Developer",
                                                  "Koin",
                                                  "iOS Development",
                                                  "Threads",
                                                  "Apple",
                                                  "Google",
                                                  "Cocoa"]))
    }
}
#endif
