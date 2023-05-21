//
//  ContentView.swift
//  FlashCardMemo
//
//  Created by Bikash Chauhan on 20/05/2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var greet = ""
    func getLocalTime() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            return dateFormatter.string(from: Date())
        }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                HStack{
                    Text(greet)
                        .font(.largeTitle)
                        .padding(.leading, 26.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onAppear{
                            let t = Int(getLocalTime())
                            if let tim = t, tim <= 12{
                                greet = "Good Morning!"
                            }
                            else if let tim = t, tim >= 12 && tim <= 16 {
                                greet = "Good Afternoon"
                            }
                            else {
                                greet = "Good Evening!"
                            }
                        }
                }
                HStack{
                    Spacer()
                    NavigationLink(destination: DetailView(title: "Word of the day", data: WordOfTheDay())){
                        VStack {
                            Rectangle()
                                .frame(width: 155, height: 155)
                                .cornerRadius(12)
                                .overlay(Image("wordoftheday")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Text("Word of the day")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    NavigationLink(destination: DetailView(title: "Flash Cards", data: FlashCards())){
                        VStack {
                            Rectangle()
                                .frame(width: 155, height: 155)
                                .cornerRadius(12)
                                .overlay(Image("flashcard")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                            Text("Flash Cards")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    NavigationLink(destination: DetailView(title: "Dictionary", data: Dictionary())){
                        VStack {
                            Rectangle()
                                .frame(width: 155, height: 155)
                                .cornerRadius(12)
                                .overlay(Image("dictionary")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                            Text("Dictionary")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    NavigationLink(destination: DetailView(title: "Quiz", data: Quiz())){
                        VStack {
                            Rectangle()
                                .frame(width: 155, height: 155)
                                .cornerRadius(12)
                                .overlay(Image("Quiz")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                            Text("Quiz")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                }
                .padding(.top, 16)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView<T>: View {
    let title : String
    let data : T
    var body : some View {
        VStack{
            if let _ = data as? WordOfTheDay {
                WordOfTheDay()
            }
            else if let _ = data as? FlashCards {
                FlashCards()
            }
            else if let _ = data as? Dictionary {
                Dictionary()
            }
            else if let _ = data as? Quiz {
                Quiz()
            }
            else {
                Text("No other details page available!")
            }
        }
        .navigationTitle(title)
    }
}

struct WordOfTheDay : View {
    var body : some View {
        VStack{
            Text("This is word of the day details page!")
        }
    }
}

struct FlashCards : View{
    var body : some View {
        VStack{
            Text("This is Flash card details page!")
        }
    }
}

struct Dictionary : View{
    var body : some View {
        VStack{
            Text("This is Dictionary details page!")
        }
    }
}

struct Quiz : View{
    var body : some View {
        VStack{
            Text("This is Quiz details page!")
        }
    }
}
