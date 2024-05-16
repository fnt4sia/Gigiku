import SwiftUI

class ReportManager: ObservableObject {
    @Published var accuracy: Int = 0
    
    init() {
        let accuracyData = UserDefaults.standard.integer(forKey: "accuracy")
        accuracy = accuracyData
    }
}

struct ReportPage: View {
    
    @StateObject private var reportManager = ReportManager()
    
    var body: some View {
        VStack {
            VStack (spacing: 20){
                Text("Score")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                if(reportManager.accuracy != 0) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(Color.gray)
                        
                        Circle()
                            .trim(from: 0, to: min(CGFloat(reportManager.accuracy) / 100.0, 1.0))
                            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.init(red: 0.7, green: 1, blue: 0.5))
                            .rotationEffect(Angle(degrees: -90))
                        
                        VStack {
                            Text("\(Int(reportManager.accuracy))")
                                .font(.system(size: 42))
                                .foregroundColor(.white)
                            Text("Out of 100")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .opacity(0.4)
                        }
                    }
                    .frame(width: 150, height: 150)
                }else {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10)
                            .opacity(0.3)
                            .foregroundColor(Color.gray)
                        VStack {
                            Text("Belum Ada Data")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Text("Ayo Sikat Gigi")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                                .opacity(0.4)
                        }
                    }
                    .frame(width: 150, height: 150)
                }

                Text("Score Kamu Seminggu Terakhir")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
            .background(Color(uiColor: .init(red: 0, green: 0.75, blue: 1, alpha: 0.8)))
            
            VStack {
                Image("date")
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5, alignment: .top)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ReportPage()
}
