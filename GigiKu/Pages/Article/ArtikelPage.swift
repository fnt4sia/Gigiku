//
//  ArtikelPage.swift
//  GigiKu
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct articleData : Hashable {
    var title : String
    var date : String
    var image : String
    var type : String
}

struct ArtikelPage: View {
    
    @State var listArticle : [articleData] = [
        articleData(title: "Bungsu tumbuh miring, apakah harus dicabut ?", date: "13 September 2021", image: "artikel1", type: "Kesehatan Gigi"),
        articleData(title: "Gigi susu mulai goyang, saatnya ke dokter gigi ?", date: "30 Juni 2020", image: "artikel2", type: "Kesehatan Gigi"),
        articleData(title: "Karang gigi ada pada anak, apa alasannya ?", date: "4 September 2021", image: "artikel3", type: "Karang Gigi"),
        articleData(title: "Gigi tonggos bagaimana cara memperbaikinya ?", date: "15 Februari 20212", image: "artikel4", type: "Gigi Tonggos"),
        articleData(title: "Ketahui Cara Mengobati Sakit Gigi Berlubang", date: "1 Desember 2023", image: "artikel5", type: "Kesehatan Gigi")
    ]
    
    @State var searchText : String = ""
    var listCategory : [String] = [
        "Kesehatan Gigi",
        "Abses Gigi",
        "Karang Gigi",
        "Impaksi Gigi",
        "Gigi Tonggos",
    ]
    @State var currentCategory : Int = 0
    var body: some View {
            VStack (spacing: 20){
                Text("Info Kesehatan")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 36, weight: .bold))
                    .padding(.horizontal, 15)
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("", text: $searchText, prompt: Text("Search Movies and Shows").foregroundColor(Color(.lightGray)))
                    Spacer()
                    Image(systemName: "mic.fill")
                }
                .padding(EdgeInsets(top: 10,  leading: 15, bottom: 10, trailing: 15))
                .foregroundColor(Color(uiColor: .lightGray))
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(listCategory.indices, id: \.self) { index in
                            ZStack {
                                Text(listCategory[index])
                                    .padding(.horizontal, 22)
                                    .padding(.vertical, 5)
                                    .foregroundColor( currentCategory == index ? .white : .gray)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .background(currentCategory == index ? .cyan : .clear)
                            .cornerRadius(20)
                            .onTapGesture {
                                currentCategory = index
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                
                Text("Temukan Artikel Terbaru")
                    .font(.title3)
                    .padding(.horizontal, 15)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                ScrollView (.vertical, showsIndicators: false) {
                    VStack (spacing: 20){
                        ForEach(listArticle, id: \.self) { article in
                            if(article.type == listCategory[currentCategory]) {
                                ArticleCard(articleDetail: article)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Info Kesehatan")
            .navigationBarTitleDisplayMode(.large)
            .padding(.vertical, 40)
    }
}

private struct ArticleCard : View {
    var articleDetail : articleData
    
    var body: some View {
        NavigationLink (destination: SpecificArtikel()){
            HStack {
                ZStack {
                    Image(articleDetail.image)
                        .resizable()
                }
                .frame(width: UIScreen.main.bounds.width * 0.3, height: 125)
                VStack (spacing: 4){
                    Text(articleDetail.type)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14))
                        .foregroundColor(.cyan)
                    Text(articleDetail.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 18, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .lineLimit(2)
                    Text(articleDetail.date)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.gray)
                    Text("Baca Selengkapnya")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.cyan)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .topLeading)
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 125, alignment: .topLeading)
        }
    }
}

#Preview {
    ArtikelPage()
}
